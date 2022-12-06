Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4176441EE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:16:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454681.712209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Vva-0005zX-76; Tue, 06 Dec 2022 11:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454681.712209; Tue, 06 Dec 2022 11:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Vva-0005x7-3U; Tue, 06 Dec 2022 11:15:58 +0000
Received: by outflank-mailman (input) for mailman id 454681;
 Tue, 06 Dec 2022 11:15:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2VvY-0005x1-ML
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:15:56 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe16::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a268a0a-7557-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 12:15:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 6 Dec
 2022 11:15:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:15:54 +0000
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
X-Inumbo-ID: 5a268a0a-7557-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DL2YEghoZuRQSftS2nAWyxAX6rtF72P+MO810nWDTsGzovc7AR9KR2BiVD8Sr/fABwihnUAxYnDh1+61J6Axu+ZBve/bz8zFzLYMILH5x00g+sRqP+J1mSuO3mqkTf1wWRXftEYQI4/2c3ZEM1t7xI/rlffnvXDhsFm+bfmDjhh+gHUtO9QV8MYCVnv6UP2DxP0fDZNICygpwXXMnlmTNOKDY3stB5BFfnsUflShuUuDzHE6XgxkFvr0tMhwcv+LisGE0WH/5FCR9yYzIMBk2KrIZSubgRSl/fKdF1pCg9+J8QFs5rbhkLG3L6ruaqK4C/LrBP9WGTGaRq2WO7TvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGbyUn0XJdketXB8fylRv0lxICYA7CPIh8bLXhxvOt0=;
 b=NmGsu2si228VrPigmGcDW9LEpu93fNo1+nX/iSkRuzWU4/S7k56hERGbGCHUupkYJjVtDpksGrcV4XTwBeqcdxIwMYHSl0N4A76RLQgjAB7v0sjQip66x+j0UJvzOINojRQxq3PZ4KH479m4Bc6fuXeS7BjTGZlEL6Pix2ItRVbPiUGGTEXhHWJouI6J+Er3/g4wwQCBbnav0mvji6g1keSYfHUvcJgqR2G7LgOyRPGB0N6Wrltjw7Q8lMTrMqtzyy0zKsUgXWo/oPPpLUMiMU2f+9eh3ap58iAaez9NQfHro+XKPuL5z0eaCAhzwQ01SSMh3W2yq4zwBiCNyHA3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGbyUn0XJdketXB8fylRv0lxICYA7CPIh8bLXhxvOt0=;
 b=5e8d5BONWV2XtAvmHNIBoeNBp6trqZy9e6hNiEGS91j6GF6ll1Z/aPji1hsewfXx2vShJwT/wtiOrqF8ET/RnLubWboBPTST0h6znqpm3IVfLba3zMubZLtL/UocHtPawzjQwK0dMeg9BF1iwCdB4V+fc6u/DaTR48E8NFmUDBvmjoaDh7DqOOGPzRmwIAqCb83tJ+of+nF5u+ywoRSe8CpXw9l1sXHgGXlOJoKsO4lcs0UjwT85dnDgy/szwX685T/OVVJaCTkxkd/YROs5XunqzoQ6qs9mHlJgyMw7jMbw4m8Qe57tW4/rzn8GYYD41gx7qB8+1g8an7bGmApXTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29d6a8a8-1c18-8e50-f8ee-18f161031954@suse.com>
Date: Tue, 6 Dec 2022 12:15:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 4/8] efi: Avoid hard-coding the various PAT constants
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <ea32e526153a40837484ba9c64a7d157804b6c27.1670300446.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ea32e526153a40837484ba9c64a7d157804b6c27.1670300446.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b666fa-b13a-48df-c8ac-08dad77b3db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	su1WqPseEONJnkFadvMX6uDOQMU5hnss0CldwLdo93mjF12QyJMH4OtZyiIwOXD2EdEMOGzByCAtYQYvxOtL0b3ncE2pML4r6WIvvwCegB6LP2F18nVxrQUO2+BXLudd7FICLdNBw7y24rGWr71Z+EuSVjOEspvC8kGxTQ0Cv5ml3WaBtwRq4mwP7D1VuaRzzDvt4HNYyh78DH+a5wTD3vaNBEBW/8fMGtiAL1lhX4DUJirdrgTJ9ibyRpWkpUpcD1oa9nNm2Iym7VZd5xxh2Q1sqs5gQBCWmDIsKX5n119hufzteka3TzfCEfl9mopuYNx6dLI7cCMQHKhdZLi7jPdK9shAWgUBLfN9f2wk2XwNMGyYGR4opoOAxYSdjI3Ow4hHgVA58htx45B2E0RpUpfXJl4t9aGfD19iAUHol3N8wn/J5CsiNnKOI2reSdtvqlFulsyP5feUfIFoO8S6c7lbZQ767ANxqhoB0m7YY5VwLM8KJHxutgaZ+8aM944Mb3Pi1Q9fiVzsV57S4Gfct+UCiYoYmMR6Cup1lhJBknR/GwTGNGQnRbARuoMrPqGzWvaLi2svHcHFq1k3BfWhdYzdVFF6O2eDkNyVXQK6RqCEypw2nrrVWTSbA38XKrul3q3aUwY7Ov3LOvgVHZpv5IhCkk/NIc2CnrKYueW3FvNuIbH0G/scXyoHIwdQ/fBjVAK9HIR8R1WSxLDbnoNVZGbfc23aiffblEvpdFCIQGQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199015)(86362001)(31696002)(558084003)(6486002)(53546011)(478600001)(6506007)(36756003)(6512007)(26005)(5660300002)(41300700001)(8936002)(54906003)(2906002)(6916009)(66556008)(66476007)(66946007)(8676002)(316002)(4326008)(186003)(38100700002)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkF2bkE1Z1NlTWs1UUVYOGIwRHk3d2xLMHBrTXBZV3VzSEFaQjJ5NFBQYS8r?=
 =?utf-8?B?OVN1enhBQjE0RmRGMVI3bUhRVDRUTUt3SFZkRWNOL2lSbHhNeUVqYm9WS1lj?=
 =?utf-8?B?NVg0eVE4NG1Ib01JcFZiUVAxdC8yODVsL0tQTC8yQ1Irc2wzYUpuNk9LcnNt?=
 =?utf-8?B?cS85QkFReGhMQytQd0RRcHdFWFZEeFV5NmJONjN5cHpOOXE4dXV1UTlHZWFv?=
 =?utf-8?B?Z2lDWDQxbFNTd2xNbVRNWWJreWdadS9NRnFxTlZDVEMzR1BWdDZRS0h0YWtZ?=
 =?utf-8?B?eTFxbVJpTzlyc3ZOUFQwbVo1R2pIeGxRdi9zaWY0eFBCUDRsWlNkQmpFaS9o?=
 =?utf-8?B?MS9BWC90TUVsNWNtdmMydFJnWE93VldOWm5DZGJvMjhnOXgxSnhKN3BTdXQ3?=
 =?utf-8?B?VFp4VHUrOStVVkpKTnFCZU9nK3RocDBCUytKNzZ4Y0VaLytYay9wMmRPeHpE?=
 =?utf-8?B?dmQydmtnK2tFSFhBOVdScGptN0pmbW55QVA0cE5pWVdwWThpUGttYUQrVmtH?=
 =?utf-8?B?UnVRVlBLdnpKVUt1TXZNYndhbWkxZGgrV1FNWmJzWHNVVHUvclhQMkdjV3gz?=
 =?utf-8?B?OTQ3LzIyWjVHaHg2dGhvTVVacWgvbTkzYXo3TTY5dEtGSi9wcFR0am5zRW5R?=
 =?utf-8?B?ZlFPUVd2N3JhS1NEWTd5bVhnRHFXbFo0SWxoalI2OFNFUHliK2xLc3pVWnJK?=
 =?utf-8?B?ek4xMzZEbzhuL242T1RhTkd3a1NOb3JkRXBoSk9GNUpMNnByeVlwSlFOZW9o?=
 =?utf-8?B?NERPbFp3Sk80dlN3WnpKZzZ2aUU0dExkMktmTkhmb0piMWJncVEvb0xrUTQz?=
 =?utf-8?B?WFNNb04rYVh3WTJtbEtyODRId3RVUGVxRkNKb0hva3p1MDlHeExBeDV2WG8v?=
 =?utf-8?B?TngzTm10TVNBdXRZUUVlWm5SZUpIaXd5RjY2ZnFwNlhjeFhEMnVzMkJjSWp5?=
 =?utf-8?B?UGhNblhXYXR5a21qVVRaSUdRSGYzRUh2TXErLzJqV21KSUZnRE5pb000RmRk?=
 =?utf-8?B?MjBQNzdMbG1aL0hHT2hZL3JURk80dGpVejRyWlpZWktoVk5XcSs1cEFIcHQy?=
 =?utf-8?B?QVlBV3lwaVhrbTF2NFQreG45SG8vRlIycmpZS2NKMjdBZVZpR2MrUnVhZTRI?=
 =?utf-8?B?VkVBQ1VuSmkxcVIxZFNXRXozYmdlcHBreXlyMFkxcDFQdjNNZFVicXNUZkNr?=
 =?utf-8?B?WDFKSm9ZdEczYi9FQWpEaTR1a2JPR2psZ2d5ZHJuY3FXUHpsK2wybEQ0d1Fu?=
 =?utf-8?B?eHo3aEs1VVB5dmc4S3U3RkJSdWV4bUdWSVZqYm50WE9MWWw5b3FCb2hDQkNJ?=
 =?utf-8?B?cXdZbEZOWkFWdlJHSjFrNXA1OE0xQ2JNUEhqQWluME1MUlFuQzJWbnpFVHor?=
 =?utf-8?B?Nk8zcDU1STBlM3NQck9SWm1NWjJhMUJOcGNMTUQ1K3ZzTzlOUklGNytVOHdW?=
 =?utf-8?B?K2w4OWdmVmNLMy9hclRIcVJLRE1LWldOT0VySE5tVWZxdUU4OVJ6YU1iM3g4?=
 =?utf-8?B?VVVMRFg0ZGM0K3hwVXlIb0t4blNNQlpnYWV2TUx4Nml1ODhmVytDQlc4YUtQ?=
 =?utf-8?B?UDRkQmlNLzBkbXIybkxQZHRqMVRmWWtDYmIvTUxyOGd3dXljeDU4TjJ4MFF0?=
 =?utf-8?B?cUl3QlU1RG5Ob3FEY1FPN3RtMk5lM1lpdkZDMDIzbDJHZTFmUHFQRURFaGx1?=
 =?utf-8?B?UmtXV2ovQWQ4cjlDOEVPRkhKR2VuY0plVXZxN0Jxd0RabzFBOTZVSjRsM2J6?=
 =?utf-8?B?bXRYaTZ3OXFyT0lGd1I5Z1dyYnV5MG51K2JNWWVXYWs2WWNrVUIraE0wMVgz?=
 =?utf-8?B?blpkK3NidXBwaXdTWHFKQks1M3BoQW9PVkhVeWI0TCtrQU5oYzNpMnEwVWhM?=
 =?utf-8?B?TlpMMWJvRzRIcmx6ZkpGbko1UDAwVnRJcnVrbU5rNDMzM2Q2ME1oSHJSQU1K?=
 =?utf-8?B?NkVPSnhweDNLVEhDclIrdk5td09lYittcUp6SjhjSWV6R21TREZycDVMVnVr?=
 =?utf-8?B?aEl2UTRDK3VFeU9XOS9paENTZHl1N3p3T2VKV2NKd3p0YkhCQnAvVVdqTCt5?=
 =?utf-8?B?ejErSEdhTnNUaWxSbk5ZQXRiaS9sejJ1c2x4dGE0ZHJzZmsvd2tseVdLM3I2?=
 =?utf-8?Q?lSZWx/2shjND2pbOtqe+xcvbq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b666fa-b13a-48df-c8ac-08dad77b3db5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 11:15:54.4337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNq1Y/IlhkJ2An1nOg97IwW59gQnZvmUV7uIutqrytfVTIQ/bdGES4tpA+oCculbDz8Zs8AHdk4yrR0KmLMynQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8604

On 06.12.2022 05:33, Demi Marie Obenour wrote:
> This makes the code much easier to understand, and avoids problems if
> Xen's PAT ever changes in the future.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


