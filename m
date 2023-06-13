Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFCC72DA50
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 09:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547828.855439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8y0h-0006yR-6Z; Tue, 13 Jun 2023 07:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547828.855439; Tue, 13 Jun 2023 07:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8y0h-0006vi-3V; Tue, 13 Jun 2023 07:00:11 +0000
Received: by outflank-mailman (input) for mailman id 547828;
 Tue, 13 Jun 2023 07:00:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kK7f=CB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8y0f-0006vc-OQ
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 07:00:09 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eecfead1-09b7-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 09:00:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9568.eurprd04.prod.outlook.com (2603:10a6:102:26e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 07:00:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 07:00:05 +0000
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
X-Inumbo-ID: eecfead1-09b7-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YI6KZKKWbABd+2/rhAvv+VRMHpc3FvSP5X9R//gau6/R/LNdwqwj9pcJDU4s45jipCXENgkRN45T9HgtBlpzpb0fOebUdcDOqU4Mx2Y5C6u8qGIF2ecPCTwo4ZHqJJBkvdZy50qFKfl9S/K6qHA0CMr+qfpNSnUTzf3UPFggO8M7nF5gSlAL/f5yulvZc4CrzboIJJRyLkvYuz2XcpUtYHQn5xb+ot1TFPs9uaqjmpCPF8hORUhnjnMSn5yBDhHFl2AKA2PA1j4/AKjOmSI7/N3S9JOQUh/YO5LnghDsyvFfuk2pQDO+m7MMWbxdVvd7znQu0yMD3EZDB+n9mZt+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYPDir4W08RNALnGkY2xgl1e137RkqPk/jDp4Tgff2A=;
 b=G2WNoLCikeuvTOdesop1DeTj5c3VxhEIM0a4z0KvsSZDeV8estkTKfpXp4aaT4nwPICpA7XgH3kzf06YnxWm05FYpFfMswq/kNa1hT3omKtp4G+kA9BRZKbDInW7FSGnfz++UuKZZ5yUpPgvr1V2x4KTfpdQlwRtYdg3vs2rt7SjRWLqlP/AA8UPUpC2BRdGedOGmYWMQjVe18+A65BKzStNKjVd7+SJL+AQIac/VIOaoK7nptH+VpcD0SXSTBuXk3caN7VU66n4fZIbaLdGnhryzRxY779OxZSXHO/XAXnVjvrJvTXW3ogn4NZL7VAXFI/5oTImIhbSRC3wvZUOmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYPDir4W08RNALnGkY2xgl1e137RkqPk/jDp4Tgff2A=;
 b=cigdarHpalCNcQ6e+1g739rmEZihyrizSuyuEE3oGKzdW2SCe5JO3/ESMh2Nt5osJ5nl9WhYF5TBE1Q2PPJPNxQoNzsOfzYdq3uE5Jm3VyW2JvlO0ccWAixdnqOF8uZ6LZGLvrFhT5L3ZHQM9OFMaBLHOXNNTUY3qBXc0lWfYX0kaHm5isg5Uol+VVOK2I9xo0U2lCskoB+vcm97nrPzGTPSRh4sry643wUeAKlTbhkxvVwezJdjK7ui9XDNpr+Qpw65diWR3T/ZtaO9qEycKDkSrrIrIsn9mz37DTx2Nns+IGWWorD9sevq7I3L4fGnPyL9JSbC+RONO4oWOkC+Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01c1f68a-dad8-b499-7d50-904c85d5f87d@suse.com>
Date: Tue, 13 Jun 2023 09:00:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] x86/spec-ctrl: Fix the rendering of FB_CLEAR
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612192805.2904128-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230612192805.2904128-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: 70018302-3c59-4d70-04c3-08db6bdbd14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	59OANWo7gbcwbk4MFnhvili+722CQJ1f1kUstookX3VMIasFMmbMEE9uId4L+coFjGXm+f6FJEFOY8R7vKixOMuuqpGEwkhz4nYSu1mJQSX5wI/lRDWdfxDNoFNdabyVKLwEez2EtMV03x9ujXjgFSrFQGxUuDiKeAhc6r7nr/ErEgXkCdNIMmrUmVdCJ2TpBFr9kJ5/4yvW0duj9BvSYChvQV1XaW4hTdSDyqsFt6hI6sRlsMJUgFoJO81/eZjc6R4x/mosqa05lsVNKO36hlqRH2c5UgcB5gHZfrrKjAAgqo8k54/SVqO4ZO1YhjvYo52MCJE9rFU5juaHbnFXK2MOkHBHBJ7uOwpG32ZSjFO+1MByk+03++ArMmdp0YmB1EIRrEq2iwe46bIGhHq4HqW91XUxVP/LuOo7uteitRipd04VH9Esa4hvvNmId6M0FvMIWtlVNHF328zTHB47ujhWnadNoA70Tx05YntDDK357cvnpIY6eKfKHA5OgCgjWMhcYU/T0qA/sRpO9h8mDnjcILgyMQc3CEsCVWYdZnJOj6fJX3XudAom5fuC/vSrP//LKOwZKNKcBkeC3gxAa3ITPgy4PAVMWj5AEdIHWvwuaVP7iT7y5ueX2uyO7iOIULivDzLvb4ODRwYRC5J9nQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199021)(31696002)(86362001)(558084003)(36756003)(66476007)(66556008)(54906003)(478600001)(6916009)(4326008)(66946007)(316002)(6486002)(8676002)(8936002)(41300700001)(5660300002)(2906002)(38100700002)(2616005)(6512007)(26005)(53546011)(6506007)(186003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHBsQjJ1YXpWZHltYzJETlpFSTRlSWV5MmdrSU5Td1l6bTFpRVREOU5TMDYw?=
 =?utf-8?B?NVlMYnVIMXdCVFpMRTdISGtrdGVKNlBxQklXS2J5Rzd5cW1kSVdnQXFaWlc1?=
 =?utf-8?B?dzhOMzh0VDdONG16YnVhMDRiaERGRE5TK0ZMNU91Q1VnL2x4b2JLQ3VzQldn?=
 =?utf-8?B?blVhY3V5bFRKb0FIVnFLUDF3cm1EV0xtejJqZUtYZG95M0xTZE1BaEFyYjgz?=
 =?utf-8?B?STk4YjB6THZJQ0pYRXNSL0plRHV5ajFhOEIwbnNkVjVFdUV2bkVrNHZERkd1?=
 =?utf-8?B?N0dQbmZoRG11NUp4aFBoVDhrMXd0eUwxcWkrTlVldGJwczZZUlpUc01hUS9B?=
 =?utf-8?B?VS9HZGZmYjVMWlV3T1dRVzRqUGxwQzdOdEhGRmhIRzU4b1Z5a0M5bkpUcFN6?=
 =?utf-8?B?Y1BrT2pqeTNnYWY0Q01hU25BRzhFcUFFSjdZSUI4ajZwS1VzTWxRTEpGQWcw?=
 =?utf-8?B?VFg5QnU1cWJ6VEQ3eDREckx1YnNBZkJSMjdRU3l0QUE2eDVXcEVIMm9Melpu?=
 =?utf-8?B?YThQY2l6TzdOVTk0QkRWeklrSWkrK1QyV2Q1SGdCZDdVRE1zRncwZ3Z2SHpw?=
 =?utf-8?B?YjlCSHhnQzJQZmFjUkxrbld1MURSeTVRdzhWa05KVUZVQi9sc2VmS013WTJ4?=
 =?utf-8?B?cUlkcWVLMWRMQUFneVRvYTd4dGVnSDBMSG5JbkY5NVhrS3ZseTB6ZnloNDcw?=
 =?utf-8?B?NWJ3eVNtMUNpZnQ5dXVENy9QYnJuNTJWcHVjVmx0VXZWZG1tVzV3WlR4d3V1?=
 =?utf-8?B?bXVaOVFEQ2VOUXR2MlFNT2RwUUY1WGlpbFRFRE5JMnpnbXl0bnUwTlg0cmpu?=
 =?utf-8?B?ZWtIb0FSZ3gzbXNqOW95QlB4bThYMTR5RzV1SDJSM0grMDRJL0FqcG9sTFls?=
 =?utf-8?B?YnErVjVxMHVwYy9NSnBBZ2tmdXFtSmkyRjZDWDQrQUxaRzMwbjNNd01FdlF3?=
 =?utf-8?B?V1VLYjBGNzNMaG01S0s0bXBNc2crQ0htZnQ3M1ZRUHZZYk1nQXVWRytEa1lQ?=
 =?utf-8?B?SnN0eE5UeTlIMzVicGxVUHhrcGhwQVNFTmZaQ0NjSHpFTnBUcWVhbFFuZUNM?=
 =?utf-8?B?SWROMHBVdFMxRy9Sd01Hd0pPazcrVDlONWJsSTh0Y2FlbHBJcDFXc0RKaTdS?=
 =?utf-8?B?ZWNIb1B3MktKSk9pTTZDODVWcjZkcUVnSzRjV0RQMTdvU0VPSnI5YmppRHRn?=
 =?utf-8?B?S3R3UGNIdXFiL2pFMGgwaWRNaWd5bUNXclRFU1ZyUk5sbXRmY1RFVm5aSHNs?=
 =?utf-8?B?OHFMeTJlMXVNSFVhNDZWdkl1NzFXTERKR3VYUzN0S0Z0dXJqUmZreG5sS3Zq?=
 =?utf-8?B?c2F0OHVkUG54a21EMGZqR2hwVlJIYWFRSlYwd0E1SWpZdElSLzY4alo1aVpV?=
 =?utf-8?B?TlNzMy96ZWRDUmdyclpBaXozZkFlVlBMQlhjSkxkbWw1WEkyNjBpbjNBbXZ1?=
 =?utf-8?B?ZEZXdWZHNTJhdGM1U0NJNmk2NGt2TGpWbXE2VlNtWkNwdGJxK29FaXBRMUFn?=
 =?utf-8?B?YUhUemQ1YjZsUG0yWkl5cmNYUWgrRHJ3bVpPdWptTWU0Vk9hV0wxU0djWWVI?=
 =?utf-8?B?WjBzZS9ZV1F1Z2orTi9oQ2JmOEtJempyU25rWFVhYXFNZk9MQXNrYVhFNkhC?=
 =?utf-8?B?M05PbE5laW1OMkV3STNscVJ1Q1hsaXJZNzJhc1BkYjZzdUVQR3lOZ0svWlUv?=
 =?utf-8?B?c3p0RjRSUVRMY0U0TDM4N3ZmOTBHaG9ZczJjVWJUblVhS2R0U1NzTFV1Tk12?=
 =?utf-8?B?cGhTSEE3TEVqYllZU1ppQ3lha012YTRyK21XbCtqdEQrWXA3bEYrUXdqU1VK?=
 =?utf-8?B?UnFMbnk2a1VxWWtLMU9HNlYxbVp6WUNTNFNqOWlkT1FOQkZUOE1IeXVqa29H?=
 =?utf-8?B?M0Y1bjhpQTJmRi92aGY1cFR3OWRobksrazNoUXhraWtzdUNiUXNOMktERGNX?=
 =?utf-8?B?b2VsTEJaSlI0Tis5ZUQ5WTRJS0FRdTZVK29zOEE1ZEM4aEMvMUVDVTBjTlVS?=
 =?utf-8?B?Q2krY2pERjdRaEpjSTBYVnlKNFAxYmV6WjhSVjBHM1E4YTlTQ0VpUWVUcllM?=
 =?utf-8?B?Wm83dXI4NllXOCtKdlBhU2NSYUVJOGIvbWpGQ2pIdCtTRkhvaG5CYzVYQ0dq?=
 =?utf-8?Q?A2Me64Uta2U3HHPPtkyGoS0HC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70018302-3c59-4d70-04c3-08db6bdbd14c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 07:00:05.8418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUEwSxdXehDG60WU7PWFFw2q9nawT36sx+l4+/IzWVlb2V9QxuzWKKf0CO3Mwt4Jzo4qWl+UrTQxx5BjRPvRQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9568

On 12.06.2023 21:28, Andrew Cooper wrote:
> FB_CLEAR is a read-only status bit, not a read-write control.  Move it from
> "Hardware features" into "Hardware hints".
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



