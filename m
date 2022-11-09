Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4AB6226F8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 10:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440754.694914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshPQ-0001ex-Tj; Wed, 09 Nov 2022 09:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440754.694914; Wed, 09 Nov 2022 09:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oshPQ-0001bp-Pk; Wed, 09 Nov 2022 09:30:12 +0000
Received: by outflank-mailman (input) for mailman id 440754;
 Wed, 09 Nov 2022 09:30:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oshPP-0001bj-8p
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 09:30:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aaa3901-6011-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 10:30:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7575.eurprd04.prod.outlook.com (2603:10a6:20b:29c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Wed, 9 Nov
 2022 09:30:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 09:30:08 +0000
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
X-Inumbo-ID: 1aaa3901-6011-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYJ74Xc1xw/W0ypMmaZeOwZtiEwuQVMO0DU5j7F1ItItCAtD39v7MOsCu4fqNXzXWedTaiu7f3B8lJ/S9uqtljpM0YIDWpW3DV+tkBqFRSHScCSOKixZJNxNixLW3jbfgfMEkDNYVpEZiZwGykY3E4tKHRWR2mJtJ+0tHvBEBNumajGkTOCHYbU35S/PmGh4TxCgxD59yI7hjeLWN9khoSkLws+qJoV4iQ5W//7Lxg/H8D8cGdygcpjAIY66SxlpTBRtS8Hhabw9d0w+Z+0WcBxhNZErcU0eBG6o2tfxvNiv+0lvjs/QbM3oE7W70saFOh6IbpisvZJ7JQY+OxUqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kZE7U7NQ7GZIwC5g9fFzLHfPsijZCo0hDfLuoH5oOM=;
 b=YtEyhhAMPxC9Kv/2vKYs/yCIXYBunk9wHRnuBlZQKDDPThdYYQBh72B+egBTltPKeT9lSor9X1mu9lYswnWfQ4l6LbL7PWCMonlCSuHSPTOlPRBgu+/KA6VlNZnP/f2f/Ml8pBXzXAmDICBys14BhG++uFIlh73wL7lBHC2PV+zQHfmjJuhs7Gh3N5ZJ0JoUI+070NmGwJwfn7fGA9zm9LJiRpgyfBkvrsybyrCEvTPKVjwWpYKMp27Qu3lS53LEZ1qE0OhJ48/lEKrRAEkG4ZFVr36jyfEwK5j0aDD9MAOvQOrC1DGM/ok1I+DgA+zNaGOtwBbElIYyiO8+n3e9tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kZE7U7NQ7GZIwC5g9fFzLHfPsijZCo0hDfLuoH5oOM=;
 b=ODxHN1duUVAdMEtCOeB9h6COsaiP2LTohx01EEXhz+PslITSkUJTD5UtO9DQn8SKIOxsTJncrLRjdKKwbWfcod71YuTcn6WSSS6oDm/wuD4yeWoOEUmpxupQ0WPvyeYHpLbksZza9EAmOOaOdCfN8GKJVRDu1F0L58oRAnVlZzurYyF3echI01pwtZzoCfQDFrdNMh6VJd/57EGpwsBpxLyJr7DbrFZGHR/doJ2Q3agYGbdw2uDFhS3jtOykIl5YiezTFV5NvOoK9DxkGT5WilRKrHd5KkUaP4vlQ97jLS2KE6/th3ErvEXR3AHCiSTQFsh/Sn6OrwdaPfSNfkzpaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <64dfe9e6-8d92-8be9-c987-28d507ac617f@suse.com>
Date: Wed, 9 Nov 2022 10:30:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v7 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221020061445.288839-1-wei.chen@arm.com>
 <20221020061445.288839-6-wei.chen@arm.com>
 <b957bbc9-20a1-fadc-5865-e4a6ff274a93@suse.com>
 <PAXPR08MB742052EC98548796B21998379E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB742052EC98548796B21998379E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c22643-1ff4-4d4e-e87a-08dac234fe04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TX1LkgD2+TjNX3DgJJD/1E/FYVTx0MujpLIV1ihnRxLRxwqCyhVC3VrDFiu/KJmgj8s5wT9lcGuU1lch4PRNbsz6x8IeqwgJQf35FxIw2d+h9HV1HIPG+Vy5UqiDK+9CeIs8dB9LJZpCKsmJisdKYmLcFqEKR7o4lIxEIHWdGMnXQ9qD6JWrjDkTwxi1Zluc9GQiCZK46W9HRvlF4efZj8fRkjZNgxtZe5Gan2VSKmBiH6QF5pAUQkBQUJDOBIVj2D9P/ZTaf13fkX4KjQ4PedA1+U9udJgH8aUB7AudwsIARCZ7JGwc9b8Z72p5VCghxpNJL/db75aL2RIQAFA0kDx11FcKBAWq8DpYvp011udSmXKPmbtYY1SRAPbaHA8QefNFBwTuDO7XplgGO3mleJ2b9rjq2jMQ+ABesBqRV+oyYy3PvujzN+W0DwCGFAOL2DwwNw33aatAKiKrJsTjkGAVJ45OrtP6tYLDEIHFOnNcXDWQjQHLILEbpfLOmVpB8qTADYrDwEq+jNWoPX97sfyRo2KQF6Sfu3+QzwQorw53YW+xGthemHfcjiyGlvL7RMlXproh9XjsllYQv8E9LPTTreqPEMRCQ1wYHL26gUxlSk3aMbRdx4k9HGYjUFlcWnrYGIkQEow2NfuzIX3kBxN5mZpV9vNbBKUAUwKWWpiHThyyzI0dvC8wTnYDsvNWIlEMkZbj/C0UK7MSrbq0Dv/MgMH5dmLqTGOtncpd5V8vJy8dfGVBn81EMD6Z8fk9Yi3aGg1kpa/AGQIr6L//JGA3KkeabR2P0ModR1AYQPY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199015)(36756003)(31686004)(38100700002)(31696002)(86362001)(5660300002)(2906002)(53546011)(186003)(6506007)(83380400001)(6512007)(2616005)(26005)(478600001)(66476007)(66946007)(66556008)(54906003)(4326008)(6916009)(6486002)(316002)(8676002)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekwxN3NWV1ByYTc2dmp2bkJoWXdXWHJqN2Z0WFoyU3BxL1pLTXJHTlJDVHp6?=
 =?utf-8?B?dUZRTzZ0dyt1bGdPdXJTRURLd1ZuMGR4cWFabXNQT3FmVTExZkFXbmpHdmdQ?=
 =?utf-8?B?MUN4REEyTFNOdXN5RmtPZUtWY3FwdGV3NkxoS003WWx4SXMwOUFlSk5iUFVv?=
 =?utf-8?B?amgyenVTNEt2a0ZJZEdka2NEelA5M2ZNMUYxOFZrVnk3ZlorTkNxcXV6Wlhk?=
 =?utf-8?B?d1dPZlBCRUxUcjdqM1NPZlVQZUJtbzJhUWNRMVY3ZnJ6Wko3bUVSazhOKytP?=
 =?utf-8?B?azMwRDhVL2RHS2xTeVBHWnlYN0V4cDAyZWhyd2RRcXZENkl3NytnOUtMeml5?=
 =?utf-8?B?SEdseXI1T1cvemV0TjJ0ZnhVc3lvMTg5R0YyR2p6Z3BBQ203ODVBbXhqVG5X?=
 =?utf-8?B?WjUyUnJ1SUljUzA0MWxRc0xiYWhrckZkMm5Hd1FDRjBGRFZZRDNKM0NtUWYx?=
 =?utf-8?B?QUUyS3dPdGh3T2lkQzJDaWdBSmNya1d6TTNxOEV0ZTJmTDhNTGd6ZzN4SzJF?=
 =?utf-8?B?aU9iend5NFdYN3Y1aUVmdDVyVVRoTHNwUGUwTDZVUS9KOU11aGpxQzBpa29G?=
 =?utf-8?B?SWdrc0R1T296c1NyM3hldEs1ZVNyUTRISjYyN0VXaWl0Z1VKNVkxKy9XQkpD?=
 =?utf-8?B?dFd3TUwva0IyTG4yaU9DZkRrS0Mvc1R1TlVCMHR1MDFMZy9nQS9oeXBCOVd2?=
 =?utf-8?B?SmpMOEZDMklic3h4akVybmFZclltUUtac05yWkRJOUpaVDlRdjE4emxRTDJ0?=
 =?utf-8?B?Z0Y4ams4d3gwWVJuY2lBdElNbXdzblBQSW1hYldYV0psK0xTMExKdDFZQkQw?=
 =?utf-8?B?Q3RYdmpneFV6SWJJajY5OHpDcllUVExoWTByQVlHckN3Y283OGZkdGhlNm5r?=
 =?utf-8?B?ZGNvYkJkeDFVV3VCRTBkYldCNE5mNUhGd1dSWWtiT0RVTG1sR0QrQ3U4a1lt?=
 =?utf-8?B?MzdFbUE1Y2p3UU1lQXRpOERUM3BEMFpIOExEQnFFWDVVZmF4cmduR0YzbnVn?=
 =?utf-8?B?NkJxekN1eG83OWlkZjhFNURFejQzTTZoZUxtZ1VwcnBhZUViOWVyYlU5Rmhy?=
 =?utf-8?B?UnhaalNRUHdzWGpicitJTUs3bjB4YzJLd3BoWk03Q214aERlSnBJd2R1Nzdj?=
 =?utf-8?B?VGQzYlJSSmNrTGxsQVpEQnZwTjI0VGhyNzRreEl6M29KK2xsM1J1WjRxT3FW?=
 =?utf-8?B?S3FNaXFKUWxwbTZDcFg3UTZZckN2ZXpmWUZNcjRJYlBGR2ZZY3d0TkJsUXJ4?=
 =?utf-8?B?WG5kWUZSM1ROMUxWcnR6SGhOMm9QMno0WmhPbjArTzBzMm40WlBOazVDS3ND?=
 =?utf-8?B?Z0s1SjNINUpXaUpyV0N5NnhUd20zSlZXZVpSa1o3WTBUSzNTQkJHVlJzK2RM?=
 =?utf-8?B?QWtOUnV5YjZDU1BOTzA1S0xTWVpROGdKMnNxcVBUZllveThjbEg1WDlqamJj?=
 =?utf-8?B?SWo3a1FMMHkzMTBWWTJVYklIcmhNZDNZKzVXaEVQS2ZQN3ppbndkZUk5QUNp?=
 =?utf-8?B?WUwyMVI3bDBkT1FOYlVnS2cvUEp1TXlqZGJNVHVKbWNkOEVTaVZIVjlDVUpP?=
 =?utf-8?B?TkZ3ZDZ1SU42RnV4dVUzaGJWbkNGZW1sNW5OUVkvZ3VDdVF4MCtGN3o3U1Nw?=
 =?utf-8?B?QmlTOE1MUG9FemM4WUNyQTBRVkN0UVM0am42RHdNQmlIajZuV2I4TWNpaW5h?=
 =?utf-8?B?WVFrREtXWG1QSVNBeHlCSytnQjRsZTVWYUdlMTBGUFdaSXQybkhVTTMvWUM0?=
 =?utf-8?B?TTFIa053OXlQZDFNV3NmS3E3VWVkdVpRUktvSGhYenBDakdwbHh1Zm41bXUv?=
 =?utf-8?B?ek1rWVIrT0Z0STVqUVR1QXFZZ0JMd05xTHJ1b1RWS0hCdE84YkU1bC9MRDlZ?=
 =?utf-8?B?SklIWE1HNzBhSmFDWTZseFFQL1dibUlCaTNHMHRlSFp5a3pQdmxiVUJZMXFM?=
 =?utf-8?B?aU9CV09Cek12QW5Hb1BMSGNOb3lETXdXcmFxSnhXbThub2hsaWlXNmRTby9K?=
 =?utf-8?B?Q1o2Q1lBVDRUdzgzZUR5enA5YU1leXk3eDJNMjcvcVhoN3lQdG1HRWRGNHFU?=
 =?utf-8?B?M1l5SDVSK2h1Smg1S2VLNC84Q3ExT1RNdVFabWhnZlE2a0lBMjVaYXkydkhF?=
 =?utf-8?Q?dpgWYMMxW7gc1BMcnNtOakn9g?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c22643-1ff4-4d4e-e87a-08dac234fe04
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 09:30:08.3887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gppEU/i347IjqLFGUu0iHVthJmvZqIclu29Obz1yDD0SUAo+wSP0ACaFn2c7y66v0I4BCyT5vEFIKo/9hgXNwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7575

On 09.11.2022 09:51, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年11月9日 0:55
>>
>>> @@ -341,159 +247,14 @@ acpi_numa_memory_affinity_init(const struct
>> acpi_srat_mem_affinity *ma)
>>>  		pxm &= 0xff;
>>>  	node = setup_node(pxm);
>>>  	if (node == NUMA_NO_NODE) {
>>> -		bad_srat();
>>> +		numa_fw_bad();
>>>  		return;
>>> -				}
>>> -		} while (found && start < end);
>>> -
>>> -		if (start < end) {
>>> -			printk(KERN_ERR "NUMA: No NODE for RAM range: "
>>> -				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
>>> -			return 0;
>>> -		}
>>> -	}
>>> -	return 1;
>>> +	numa_fw_nid_name = "PXM";
>>
>> ... this to be happening too late. Not because I can see a way for current
>> code to use the variable earlier, but because of the risk of future code
>> potentially doing so. Afaics srat_parse_regions() is called quite a bit
>> earlier, so perhaps the field should (also?) be set there, presumably
>> after acpi_table_parse() has succeeded. I've included "(also?)" because I
>> think to be on the safe side the setting here may want keeping, albeit
>> perhaps moving up in the function.
>>
> 
> When I was composing this patch, I also thought current place to call this
> "PXM" setting would be a little late. But since there is only one function
> that uses this prefix right now, I thought it was acceptable at the time.
> But obviously your concerns make sense, I will move this call to
> srat_parse_regions after acpi_table_parse has been done successfully.

As said - perhaps not move, but copy. There is an (extremely unlikely) case
where srat_parse_regions() would not be called at all.

Jan

