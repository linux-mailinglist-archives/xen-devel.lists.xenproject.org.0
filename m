Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C7663AC0E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 16:20:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448980.705578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozfvL-00075p-NN; Mon, 28 Nov 2022 15:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448980.705578; Mon, 28 Nov 2022 15:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozfvL-00072v-K7; Mon, 28 Nov 2022 15:19:59 +0000
Received: by outflank-mailman (input) for mailman id 448980;
 Mon, 28 Nov 2022 15:19:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emon=34=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ozfvK-0006y3-F2
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:19:58 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dc8b5cc-6f30-11ed-8fd2-01056ac49cbb;
 Mon, 28 Nov 2022 16:19:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8147.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Mon, 28 Nov
 2022 15:19:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 15:19:56 +0000
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
X-Inumbo-ID: 1dc8b5cc-6f30-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGnl0TJn/wJXN6BPEaBPKyv+Xz1mZA50DHUc3sUMpzh2yEcpTdYmISjQh/Mm1Y+kdv60gDvu8l9f4shTu1JRW9qhit5k/j2IHEUGKrf70iL0Oa+jqnBewZXJYshMKnI9g1sNek31Fe57iAsgOP0ImVm6Lt5T8ZWqjI570SWSe0aeh7LTQnf4oX1i7zkk/aaipJq+PNvgiIYnmjZ85S+BsU2+DCVLFweRkyovXkiogFht0OIXyfeiaKKSZUyMOjRjMr2BK0rGjJNjxo4qxkWHB0ZItruZfnXBakE+gaFKXBwohZT0hFDPse1VhKQZKyWQwgHxx8INQqezNfExU43LPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzVPwWMa89s+yehIoKdNhe5yT+pBINAK4y5HD1plJU0=;
 b=JEN8cklF4lwSu5mXlbzWerftyZZwGUCoo7becoAdF8u/z3v8Lfdul+Dv4cRgMC6m6hhzCueEGkwJ2SAgLvV4ss+x5onHzgEaB7HHtMOnRUqp0Onp3cWWUaf7rigBnsJyXkYocyCVIEPTQzOFKFoGdRvU50JZGiDn9lq3vcdm3fIyi86y4oMoj+WqzLyjcSDNdIsqAQmLLujyayx648d3rHUMLT6XBqiw60vle18x40fMFbgqq9+EQR8K6fAo1qbRStT8KZi6TyS4tHxTiy6oNidvlajXnbjsGi1C9rwJpHs+27WOchHGALAzqJSkdwrzlOgKt2ecQOfwWXOuO2HfXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzVPwWMa89s+yehIoKdNhe5yT+pBINAK4y5HD1plJU0=;
 b=Wh8FaazTbOX/TC/xiZHltuJv7B8BquIfM5arWr3JSLzt0Vj13sS2hMT36ZT9jIE7vZrsC/wvi2iRli8nRQBkTcF0vW1FXUssTQuMOqn9ukHgvCy4OzVkoTa+I0Ye1x8Ctsp0U6cyj8ENJjhxsjBrJCODc1ek75DyQduTT6xvqLDgFd94ob1t5wnEO7aC22eXhsyzVZzDeW8dxl5yMhcJ6GpZFbFO7RrGDjzFzwz+I9dI13znaLILEdNtKRoqhSYYLQJOhLr9WRr6SEEeWqqaBkXGgcL0mcsXdeemjtE/gU4onopSXc+oHmIzXzmRSS7+ppwBukYBsI3eOD+SuAHtrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87000198-5aa2-35ed-6946-068eedb34f3d@suse.com>
Date: Mon, 28 Nov 2022 16:19:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 4/4] xen: Justify linker script defined symbols in
 include/xen/kernel.h
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221128141006.8719-1-luca.fancellu@arm.com>
 <20221128141006.8719-5-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221128141006.8719-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a50410-518d-4155-644b-08dad1540188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gvNDm60GBhAE1iFTiPdRlWn6IefJeRqa1yQeToV86SvQz6X++Hn3CZ2DEQWq7+SHDcYf8apAz4gW7kExXBRZ+4N4tRbarNjn+SWF7fkolCaC8/AH2lyTB9d+ovMfIJ8JNdNT7qPZtLH8u9vUVaPUupkfC+x46BUOyDeeWw5fJmth/gnaBA/mxmO369f9PN8MZ45yyFqJOB1wTVPJSqLgIeqC66pQpKOiIT6/T6wwfOZXevGnOGUWF5jx11Sh8go5jdXrVUOD3z0Lfqs07BJXWTughhhtaFNTlij5bOSoEiNihGHeKF9N0xtLKJjeh/jTZbP2JP5ksOTOlLd+etuWQqeSy8qpi+s+n6wtOTfbzsZ6wXA5qykVWIVv0/1coKNwZ1TXoyZSzfVSuWYbR5h/X/JjFF0nU25XPlFvpVSTlWLdB1ELOUFloTI42ON29Kv7AxFhaQr5gbZjoOmOX1PSG7c9Z1B+5zRqsugVBzU8Dofl/vv/LsWAC5ZGycHq3JNUJdDl7oBveI96xDGtxkh/dBMF3ulFdTvSy82OQiupuqw8CKcDj4KVuP6qayICCw8zjN+T2m5cQnemWfENY7R9t+l5CDzqJzbeQKlk6TOL7aoDSYUOMXJqI5w4eM/gzM7erQ82nza6RfVwyyQ40z/gNd16t5Tdr6S8Ds4s6DYvC136ZYcRgpL7AD/VmiHc1Zlg9QYSOVUfPBJQYfc+eFztVu/PiDbZS9Q/WIGDB5sYyRk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199015)(316002)(478600001)(66946007)(36756003)(2906002)(6916009)(54906003)(38100700002)(26005)(6506007)(53546011)(6512007)(86362001)(31696002)(186003)(2616005)(6486002)(4744005)(5660300002)(31686004)(8676002)(41300700001)(8936002)(66556008)(66476007)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUVIeDFNTnFIbi9RdGpxM281NmVBMGdZb25ubzBuZ1pveG0ySTYzYlhNSENr?=
 =?utf-8?B?ajhiSFc5ZWViTFRNSjNnbElHZjl5ZzI4Mmc0dmZ1a0tjOFI3QkpqNUUwaElP?=
 =?utf-8?B?M0Rib29VSDZvekd6MEUvZEJ3Yk4xaFF5YXl5bUZGc0hwOUR2aVRwcUxIT0pp?=
 =?utf-8?B?aFRmWi9EV2w5ZjBsTkNLZjdneFE5ZlFLUmpDWnBJbFNTWlJtL1pxVVN5SEY3?=
 =?utf-8?B?TFExcEZVbFc5dzNiNlQ4UDhsMFI4aTBEdTN1WHIvUjBiMHQrc2ZFVUtkMkZl?=
 =?utf-8?B?WlhDSE1YOGx1WXpKcmNnNUd2TzljUDBHc29xa1RzQU8wK0JVcllEbk9hd2dv?=
 =?utf-8?B?UFNJTEs3L2xtZXdBeXRFWjBNK2x2QTB4QWJmWnVidGpwS1Jqb1Aza08xbWkx?=
 =?utf-8?B?T2FkdjkzeC9qTm8xTUd2ZG9vVGJaZlpFYzFWSXR0cU5EZGVnY2Qwcnp3UUNK?=
 =?utf-8?B?TjY5dnZzT1hSQk5oZDZhL2owYzdBbmx2VW1UdDc0VlFzeXlUd01TbEJoSXBD?=
 =?utf-8?B?S21VVCs0azllY1JLbTlkNUg1SS8yaU5ORlB5RXRvMFZjOUpKNDlCL2hvbkJP?=
 =?utf-8?B?T2hRSlZWVHQ4dEtuZVdCQU1UQmZjdnFFM3MyU3BjR3hua090eHVLQkE0aGwy?=
 =?utf-8?B?UGxUSExVRGxsZjJWdmxvMTRkSmZRTGJURlRVSE55aVdBdDdjVXJRWVFtYnpV?=
 =?utf-8?B?UE9FQzFqWXRvcTN0U2VEQlpCMmNNMUV4NGZVL3JMWjcva1ArVDF4K1NWNGVs?=
 =?utf-8?B?aHdZNjUxZDlveGlPY2p6K1MycXhIK1FBaUxGSmhlbEcxSnc3RmlFUUZQbFpP?=
 =?utf-8?B?MkxpbEFkaWRpcXlrVFk2OEdUUUovcncrM2Rwc09CR3l1SzVNeEF3QjQvaVVT?=
 =?utf-8?B?d0dUdU5wQ1d5bHVZK3g1TnNmcTF1YWJ4a0hDUjh2N051T20rWVBMcHkvK2tz?=
 =?utf-8?B?cmRwNW5VMldNR1l5UVBzaUZUeU9Wd1dhREovUml1UUpucW5odUZSejJUTSt5?=
 =?utf-8?B?ZExlNmR6MHp2WVYxcjU0MHk3NXdWNUIxYVk3VUYrYkNrSVZGdG5YWmdjTzkx?=
 =?utf-8?B?TDZPcUZMTjlyTUdoeEd1U0RHN2xHd3N5enR0bUNrdEFLMmJWWXN0TCtOUVNH?=
 =?utf-8?B?WnRDMDdLZzVsRGNEa3hCdlUzN3JFTHlaV1pqUFJ0SFZpdlhhWkxOZlpESTBB?=
 =?utf-8?B?SHp0ZzBXU1k2bmdRcWgyQnF1UFdGbWtUUTc5K0JHZjIyU0pwWjJQWk42VzZN?=
 =?utf-8?B?ZnFXVW9CVG1DeEZXS3pCRU92Zlk4emxpR2VKeGl1RHVDS0JndjdVVEhxMGJr?=
 =?utf-8?B?ME41L1BpM3F2eFdRN0NMY3VpNGsxaUpwQy9iWGZ1YmYwTE1CNnc4VEQ0bWNK?=
 =?utf-8?B?RmZKbUVBcHJNck53RU1JL0tIazlhVCt1QkRwblQ5NUk2ZGxXREE4Z05tNEhw?=
 =?utf-8?B?Y0dwUzZYb1dkdmdwTklSQk42MnVoTTRGMmlkeDJjQWhPdUN2dVRqTjFzU2hp?=
 =?utf-8?B?eFdQOExYUWUvTEFvWXI3NVpiNExCTDBsM05xL1pmM0dJQXlUYzVaRWQzVmw5?=
 =?utf-8?B?bllkVUVDQ3I5N0lYcnpPU3BBY3J5bHRHcVhka2k2KzBFTkljMVBtNkhMMVVU?=
 =?utf-8?B?RWI3WnZTTUxXVlV4Q0wrM3lyU0lZRDBBYXZnd1NINnAxbGxzNGNlTE5nTE8r?=
 =?utf-8?B?aTNDTTIrUU9RdWVTSmcwb01tejFUcitYUGd6dWRkYXZFYSt6WGR4YkJySUhU?=
 =?utf-8?B?Z1k4RTdxTWlhSTdMWkdpMEU4WjJEZ0V5dWtRemtjRlBrR3YreVVEamVzbmUx?=
 =?utf-8?B?aVdTY0hhWEJUR04wUFduUDlZbTJTMDN0MmkyY0lsOHZrL2tmU2VGejRDZi80?=
 =?utf-8?B?M21DS2pGdks4eGFnSFdWYnIySUJzaDVHWDZHMEwvVytueTFHTHFiRG9sWlFh?=
 =?utf-8?B?clpoNFlaVUo0ZHRPSGNDc0FXeU4rNzNBeXNucXcwTGlhcnBGU1VLRThpdEIr?=
 =?utf-8?B?cy9tcVZ3RU5XT09IdXBHQnFDOC85NUpGaHdPOTRra2s0OFFDNTNCQUxxVDQv?=
 =?utf-8?B?T3hMS05pVDBFdVVhMzFkTHZCT0ZGSW1Ed0xEN2JjaEVmNXdaZW03d1lsWTZt?=
 =?utf-8?Q?TM7nD0n+dWL98jXeS6x4P9o5m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a50410-518d-4155-644b-08dad1540188
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:19:56.0614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLASc+qgIEhR0fdJf6PT1lQvQNGDhVwZK+5YxLm9FkCmU6749ZwHeXqzCLsiCo2bhXdbe96dKicjNLc4w7Berg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8147

On 28.11.2022 15:10, Luca Fancellu wrote:
> Eclair and Coverity found violation of the MISRA rule 8.6 for the
> symbols _start, _end, start, _stext, _etext, _srodata, _erodata,
> _sinittext, _einittext which are declared in
> xen/include/xen/kernel.h.
> All those symbols are defined by the liker script so we can deviate
> from the rule 8.6 for these cases.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



