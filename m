Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD0161F3CC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 13:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439385.693431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os1fl-0006Wd-VX; Mon, 07 Nov 2022 12:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439385.693431; Mon, 07 Nov 2022 12:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os1fl-0006U2-Sc; Mon, 07 Nov 2022 12:56:17 +0000
Received: by outflank-mailman (input) for mailman id 439385;
 Mon, 07 Nov 2022 12:56:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1os1fl-0006Tw-4R
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 12:56:17 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2053.outbound.protection.outlook.com [40.107.104.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f05cb59-5e9b-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 13:56:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7423.eurprd04.prod.outlook.com (2603:10a6:800:1a0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Mon, 7 Nov
 2022 12:56:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 12:56:10 +0000
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
X-Inumbo-ID: 8f05cb59-5e9b-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djUedHVC13KCgvxaSJYyQK/QWBpQmR+IUH4e0U+1TnYjFYttRk81badA2qK6wvTHT2GuBtXVXjntka+tG73EpVU1w7DvUV6T0O+1iPjbaaINHIVicHs9nNI2+3nReP2KvQ02KSr8/qvn3W2a2qg+VdqJQ6O/hYHpFxvQBI0CSDZrhzrMnA268XSVvH21DVtxoUN/OcTf/ta8pIvvjD4vDGvITpt3CBTgX+AA1sX7a+n0ZesWQtUhW6arnn8GYNEW3tYXCbkddR/ufxD2djIwYf/GuhdXfQ4255QMGos3+be+EjRtNik6VA1dD424QItqTlaayjnkP83Z0hSGPDD3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gom/usOdYTCjJw1aHXnmajlSa4tRBYFsESzO8uiolg=;
 b=L72f3yT282UFkjuzNZUePKo9J0od7WlNmiFA7XZlT+EU5Rwi0NSoz0PguEKzqoUm/AKM6/utQ4ieeKN9aIr3b+Ii3ZU/wBX6qH5k2nyyAcfgP4RzpsVQc1PgL1hvdp4oL86ibvk4DM8qQtlaULc4X2ONsBT6uDKSHI4bJI9WuzGB5AhJ8oG2Gso8X9oNjvwQu4ndz+0vL5OeuJJPPZAj7MywXk3ILGKP2simU0I+OGIWPD6lVYshNoGZVLyu77x/AhHac+jEIMrCk3XOorRzSnocWyhl9Jk4BF1ZNjskZ0te0utU4c+dRW73oDr1SHH6s08wJj77xBd5MfkCuGCPGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gom/usOdYTCjJw1aHXnmajlSa4tRBYFsESzO8uiolg=;
 b=FWEpZYBVvxyUC5P6lB5g9r9t5RaW4EXhVgIys0pTubgrgUhmRPSsPcA+0V9MKZ/WmC5c38WgInXGi3rrftQmf9uGXsQZqfXjsSHkb02Wu9GOY/zJgPA4iduFYDpuBfOlzBpUHKMKnXXNW3iokExMyz4jSPGCEPpO6HUJis/KP8x1E0YLh3p29VfiVP6KU1qBSEjbHjEyAoziFv5RIfPaOXkSmpndH4lR+vAg0FibrWPcb4EA8vAq/ct/gcLRymRNR8FsvW89CUulRJ3W+Px8d6aBjW2fxZw/iUqSrnEoUduin87Ogx2fWbtA5ZLV4sAa1qvEj1a0xStKVMBZYIjAtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <933c4227-5839-312e-3996-693a7d8f7706@suse.com>
Date: Mon, 7 Nov 2022 13:56:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 4/4] xen: Justify linker script defined symbols in
 include/xen/kernel.h
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-5-luca.fancellu@arm.com>
 <5caf911d-e96d-39e4-d945-db6537412f60@suse.com>
 <3925276F-8B6E-4B19-9EC2-C085FE88A637@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3925276F-8B6E-4B19-9EC2-C085FE88A637@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: ab617a38-c494-4529-b3df-08dac0bf71ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nk146Z5eOKaeplgeMsCc6/EWvywKGvXZHJ/cdn039jhrHjh82pB+78BsJJb9rKZUR13mKYYqkUVdoNROZoinEZqBlDuPP9jvEVhhWLsxOOTQ4U4vGojnwnQ8o7CuWYWjeY5JKvteNE+2xMhSHsOeFaBT5Fuo8F07SyCR3jjNE/hBbRIsOiU9n4OjsQj2gIyzsW1TGyce49wuQSGSApNybHHeNtmyW2/ZpVGE+V3zF6cxxQztFwue6mDYW0xeFg6xGsImjvSDspdxSdXqKC4tGIj2pZaqlywgnKbTHy7lrTqel2IIIW4xa1FF3IlrwbMReDp+kHKUhl4Sfs+7cE/6y/cHqIp2QYEjtAwm1aqE3IRQP6C65zoZ0yqrKXYDF3b+qbl3PWI+3T/UEnBCX/SntiS71+1RzMq6NBzJmvz3uc9aJICHb+GGPjTUcAS5njZfQYdecExHlMXHRELZqNjGog1Jh1MxFu6hqdkiEqF6v5fm1UZOzdVfhMDrUQYdRgqajeW9r2foaC4eQEtFeyVRhIWSA+nwG6a/AFXECqgz6evE0up9fN49Az3jtzuA/tKHhkqcakXQw5YQid8kKBAMm0e6WnFeQo3iarrloheT3qRccGH3PvHNlSFUPEDJWUi6MYunbKGJHFZYUqv0TogECJpmeg4jEpWjVr+cy8+LiUXIBU4voKsOnOACZ58hp+R4G76VgVP3rKn+uhTXkfOU2/FjKNPQYim+AIPrUtpcyPsc35I+00+xzfER39MEQpo9p++Q0ONiiph8sAsNThDSmE2NYV31YhVtnP8vemXoqhI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(376002)(39850400004)(396003)(346002)(451199015)(186003)(53546011)(26005)(2616005)(6506007)(6512007)(2906002)(6916009)(478600001)(54906003)(41300700001)(6486002)(5660300002)(8676002)(38100700002)(8936002)(4326008)(316002)(66946007)(66476007)(66556008)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWpMdm1BSFZxR0pIN2pmWlo1YU5vU1hZRjY3SzRxTVlTRnd3YnhVcnJYUW5h?=
 =?utf-8?B?ZVREUHN6Wk84RVNUUVRiRU9uYTk0Q2t3WFliUkNZM3ZEMDZQRE5mZnBCWjZw?=
 =?utf-8?B?bnA3dFpaRlpEbUphWGU3aEFSLzFwcGZsK1ozajJGVXRSQlhPQURCZ0tIZE54?=
 =?utf-8?B?L3Z3VjJJb1FSdHpYZCt6b090RHBmN2E2N3VJNHdPVHlZOURwcWJONU9Wcmpy?=
 =?utf-8?B?cEVXMHlJbXgrQUxXOWNRbU0vQ1BMWndidUVHRG0vOWNzRU5JNzkyWWllV3Qy?=
 =?utf-8?B?RDJmcklFaGRHaVZTdmc1OHphYkNUL1YyQlFMa2FTNzFCeGwrcFBwMVE4KzJC?=
 =?utf-8?B?cG9rRWFoV2Faeit0T0QvOEg4WVBPOE4xOXdDTDJ3SHZFdVR0Z3ZUTFFtZjdJ?=
 =?utf-8?B?T3hwWkJhYzh2b0RYWFl5czFXT29aemlqa0tNNmlwUWpHSVhHRklzNlArenlW?=
 =?utf-8?B?cEN2c04xUmNqR3Nqb3Fod1RGdU9LWG9OK0Y5MnZYQ2VRZGEwcE1sT2hsb3gy?=
 =?utf-8?B?THpOVUt5VWppc1Y3T3B6R2ppYnc2M3ptQnB1MEd5UXJNQVQzd2RtQk5pcjZT?=
 =?utf-8?B?TFVjc2l0cGVHV2UxZGlXU3lYa2pHditWVWFDdWpnbnhXSGkzRVZzWnV3N1B0?=
 =?utf-8?B?Q1VKTkJwbU82S3I0enJpZFdGS2hRNm9SSkpKNnI0VndpaHhXSWV1L1BJcWln?=
 =?utf-8?B?VitkVkx0eW9ZMGhtMGx4Z0x0WWRXeUNPbUt0cUNwbGJ5SXJaRGVmNjNsTjRj?=
 =?utf-8?B?SDlMc3RKY05DQXQ3dVlyaFN1NWFBRllJV1M0UTE3empWcVJ6UW9GTXVIazVN?=
 =?utf-8?B?YmdtUW9pVmtMa1J5Vko3Y2lUM2t1NlNaQndSWmNzbi8vWlo2NWdzQjZXVmZJ?=
 =?utf-8?B?THExcmIvSTlUZ2ZFZEJHbHBxbklKVkV0RzlremxUNlRDcmowU0dweWJMQ3p0?=
 =?utf-8?B?QmIvVER4aU8ya0JFSWhmNm9DcGNhZFN6V2Z3clQ3akltR2xuby9IUEVJR0lw?=
 =?utf-8?B?Uk9wa3Ewc0dCTzViYldVV1VtTWVrN2xIa1dBdGJEZlFBbmt3cmcvZzRhcUlN?=
 =?utf-8?B?OXBNWU96NmhRQnA2Q1kzWTRvTU92YXl1N0hIcUJId2hpWitwTUV5WnVHRXZj?=
 =?utf-8?B?UlpVL2s4UGlyR1ZHRFd4T05Nd3pIV0R2MmFCNisxSWxiMHlTTXhpb21TNy90?=
 =?utf-8?B?dWw4WGdrOVNjK0gra2g0Smp6MENmNTFUVlY5SUFIUTc4RDdTSHVlM2lSVzBJ?=
 =?utf-8?B?YkRmQ0ZlR0RwbUZqWEsyMFdkckdXb21HZXQ5NitUNkpVTEMycHo4aXBuNWpj?=
 =?utf-8?B?UTNXUCtrQkZkcnIwQncraWlTZzM5VEh0VjZ5dWQ3bFRRUzZRR1Q1T1lYRzVG?=
 =?utf-8?B?SG9FbnZjeEJRSk85WkJkZ2ZYMG1ZbU5TMXZZVnlNQjRpRjVSWmt0azBCdHBt?=
 =?utf-8?B?RjVGZmFNcHN2RnNhWFZ2Q3pWK3Y1QlMyR0ZuTmorekpUMDMvYXg2M05TRWND?=
 =?utf-8?B?dXhVQk9jbXk3OHE1eUEvRVhxNk5icGkxaG14SEFZQzAvTmVoZ21PK1UyQzFr?=
 =?utf-8?B?TG9RWDZ0ZzQxaXd6V1VMd2w4UEkweE1uRUNWZ3ZRTmFLZW0wNlhGVFhSSXBs?=
 =?utf-8?B?OUtIdHNqaytEUDducUhWRHk1SXdkU3NNb1piNEx3Vkp2eWlyc0t6OWRSTWtX?=
 =?utf-8?B?ZVo2L3NjVVR1N2RweEtwMWlmMitld0Z3TEt5Yk5oOHhpbkhQWDBxMXMvSUNw?=
 =?utf-8?B?RzJMZktxZzUzUUNUWHNhRWdsQ1VLQ2lRVzNYOXJMVExLOHdNRXcxVEpYNFNN?=
 =?utf-8?B?UFo2aXhNYzZrcTB4NWV4K3ZITGE1VjZmTzVId0pIR3ZGYjBKS0ZsKzd3a0NP?=
 =?utf-8?B?TEtVVnhRVGdOZ2h5UWd0U2hIeTduaE1pN3JtREVwMUFyNFNITkVhQlMyWnFX?=
 =?utf-8?B?MWdSTXVleWxNcGdsTmVIdnZDMHJEYVBOVTVucERnUjBnZ3JBN0F6OXFzYlVU?=
 =?utf-8?B?YUVxTE43MU5tZDJucnpSTURnbDFGR08xaW1BWTBzY1lzTjVqUnd6MHVUdXlT?=
 =?utf-8?B?TDN6QXRWSHZTTk9pZ0FBTjlKdGp4cms1WDhNLzVIMjk3UFE0eDRZS0tRYXFG?=
 =?utf-8?Q?leQQnsEePVZDOz/8qZfks4QGG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab617a38-c494-4529-b3df-08dac0bf71ab
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 12:56:10.8617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVry2kVzjo5XeeeQBt2jnS/SSCMzjDKeVq6Y0Qh9ODPFbTHzrrksw7YIE3JzEW40dhffGv2rAffJPB1cdNAhtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7423

On 07.11.2022 12:53, Luca Fancellu wrote:
>> On 7 Nov 2022, at 11:49, Jan Beulich <jbeulich@suse.com> wrote:
>> On 07.11.2022 11:47, Luca Fancellu wrote:
>>> --- a/xen/include/xen/kernel.h
>>> +++ b/xen/include/xen/kernel.h
>>> @@ -65,24 +65,28 @@
>>> 	1;                                      \
>>> })
>>>
>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>> extern char _start[], _end[], start[];
>>> #define is_kernel(p) ({                         \
>>>     char *__p = (char *)(unsigned long)(p);     \
>>>     (__p >= _start) && (__p < _end);            \
>>> })
>>>
>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>> extern char _stext[], _etext[];
>>> #define is_kernel_text(p) ({                    \
>>>     char *__p = (char *)(unsigned long)(p);     \
>>>     (__p >= _stext) && (__p < _etext);          \
>>> })
>>>
>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>> extern const char _srodata[], _erodata[];
>>> #define is_kernel_rodata(p) ({                  \
>>>     const char *__p = (const char *)(unsigned long)(p);     \
>>>     (__p >= _srodata) && (__p < _erodata);      \
>>> })
>>>
>>> +/* SAF-0-safe R8.6 linker script defined symbols */
>>> extern char _sinittext[], _einittext[];
>>> #define is_kernel_inittext(p) ({                \
>>>     char *__p = (char *)(unsigned long)(p);     \
>>
>> Why the "R8.6" everywhere here? Didn't we agree that the in-code
>> comments should be tool-agnostic?
> 
> The R8.6 is not tool specific, it is to give the quick hint that we are deviating
> from MISRA Rule 8.6.

Well, yes, "tool" was wrong for me to write. Imo references to a specific
spec should equally be avoided in in-code comments, as other specs may
turn up.

Jan

