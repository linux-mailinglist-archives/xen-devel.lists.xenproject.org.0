Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED4C574B51
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 12:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367540.598597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwXp-0001eA-37; Thu, 14 Jul 2022 10:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367540.598597; Thu, 14 Jul 2022 10:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBwXp-0001bU-0E; Thu, 14 Jul 2022 10:58:09 +0000
Received: by outflank-mailman (input) for mailman id 367540;
 Thu, 14 Jul 2022 10:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqGS=XT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBwXo-0001bO-Cv
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 10:58:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7758494-0363-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 12:58:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9390.eurprd04.prod.outlook.com (2603:10a6:102:2a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 10:58:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 10:58:05 +0000
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
X-Inumbo-ID: d7758494-0363-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZqcYvpiRaXgY1bNUR/e5Gmv0re08+59jd7RbExT3SOo/6Qy/wGGkuWDcAOG33Evfqe89+bWZqpV9VZ+5Ou4a+Dxi3qv/CmNlicbe1x2hkpZSmXE5txUYTXcuYlOhippl+hZGosUZQakZ0CblduSpSJUTXlzRxVrvriCJRspWGlSrmBI6G9nmnKCVI9igphNVatH54ttECNxyV/XdJwI23IV7/eKam+ipf1+bGRmJCjAL7H/E1p9AjqMQ4+18Y9uQS4tLf3T1hGMpx/D+QP55UlA4NG+R5ROYZjSxEGbRLpOvB02p0s91wm2pUWHaWkX4t3jsE+ODCZ4roptyKkyJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bibu7jyJrS/qbbXSfecX2SbhNuCbugRY9QRrHx+y2m8=;
 b=cWDyEq7QeuqoCKJqXTshmq4w+CCvUsAEf2jgePe2jV2XlQGNZLl3jaDcgOIxb81N4vRoIjJVcbEICK4TfFApGuAWsfcLqB3Wiftuq/IURQXHAuVwhmlg0jdAkwjr0guT2vGBlY+OEr/kMSmkgse4lFkLV824kJegYjV0WHiZ6a0CufrZatQoud6mVRnzTIktUyU3O4bMrtKi/ZVnjOQwuQhi5sEHzvkgpxAd+aYJU+ZiA4yQo1KcoXIqZdWHeIMj2SVykNfO/F6pkfVK/b988SeZGCVcHX/VefK2a5APq1x66+P3nIpJ9gZ3XgmitRHUX9IVNLTKkLN1CNY/frDTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bibu7jyJrS/qbbXSfecX2SbhNuCbugRY9QRrHx+y2m8=;
 b=XOdpvfpl21nDz5Cjj6C/nyUnETAXmMdZPRuvxjxdCWiJb28so6CzulZ3Xw4rQDESsREw0wYzXCfXq1loJOuteGrYNzw6uzlpcYnKDAKypQqVlKOuDyL6vi60DlSOXH8uykfnosddgreN1pZkaQzIkTg3BZ7L8D9amLl+R1y0kMwbbwWjg5GeXwK0+s75Xi4HvHthQpGyW1qdZp9pbYJGzPNF+4/T4zAIzgVeluRL5tT1W9qcwDKBD/dAOOmI54P54qMLaabqM6TOknUnkB5LKRlAKIVyqm0CI4pt7/SsBoCLa5Oak25WjGPWLs/EjnWZI+d3kUErGZ8+XeKyetvs0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <94652840-c563-3424-d2d2-70871b39ad62@suse.com>
Date: Thu, 14 Jul 2022 12:58:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/9] xen/x86: Use enumerations to indicate NUMA status
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-3-wei.chen@arm.com>
 <aff4a02b-6700-8b5e-5c2e-bf419a9e1b82@suse.com>
 <PAXPR08MB742028368F9F42899E876F759E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <a0ffb1e5-1052-1f8c-355c-5a3acf7f9da8@suse.com>
 <PAXPR08MB7420F531ECCE4106BE8227D49E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <f263956a-aa5b-e71a-ed96-c8f50ebe0d1b@suse.com>
 <PAXPR08MB7420ACF437B10A32BF09689E9E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <66b4ce65-037c-a8cc-ce17-adfce7828a2f@suse.com>
 <PAXPR08MB74206EF1995F61B23F4C60609E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74206EF1995F61B23F4C60609E889@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9eaa0da-ac2c-4681-8fcf-08da6587ba68
X-MS-TrafficTypeDiagnostic: PA4PR04MB9390:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o7M7eV8TeblZWdeT+cTce0iXJs9O5tzO7y8YqPbHCszrAz44xIfD5ZkL1V5OFraqZtMLuilq6Wa937q15qubtXrihPfq4P2P7VOujGT+CAuajBOE0B8OKcB0U162KfD5ZTf2vbBSEK7Rf80N+aFGP2msr5RQwlddfMqLVYExMik5G0zFdfCMpZQGxM47rkaT5jRn843H5ySe8aAc47hz0cD1yyb8HgxjP0l7DZ5N5bA+eyaUL8pEtnyllT5it910r61EUd6OJwhZhByW4IvMrTSV5QTz7AE3DhunhB868mNig8aB8hHHPcHAcEYqC4bnxBg7tD1uNyNwmJApHU50FVBEzoOFiib4llvQ2PxzT56Ir3WAJlFWi5Z1SU/CDOH/bJ8EJyM2FxYhf2ZShJ9r7lPfTlM4bpTof22PaztsLjVgpvBDMGqkdlISCM6QEf1vm2vBfOf3DVKeA5G52H5nBxcrWek2feVp2rGzLt9h2i+s2Msfyir4esySfC9qFyui01SSwilwZK9Q88sRgWmNN9U2E1GOptbSEQAx2BYOJZxhtOZNYVoPWgPpLk3Dk718Bim/mz1jVarSIGPu3wukpWmwoWMsmuThDDtwZG99R7aJQZ7oWMKmmkRbsb4tkdoosB5umZcwK2DL8AMccdYv9g7gJSV/a1TDVz4z/LlN0B88X/AZzBGGQACvnBoPlar06WFZIg2PxBaaZil8X+SIfLBArBLjfzsjKxvEqa2juUB8wmpHHY2kiFUP5qDdZFwwqH69Q55/I8aCxNebWOWMCUQPPD+i3cnbwpYb3K1guEwRZSZpoBUsa1Vo7ov6MTcpvIasFtm8a50M3WOwRfrxk6GvKNFbIdtK9hHaIZH+AG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(376002)(39860400002)(366004)(346002)(186003)(8936002)(38100700002)(66946007)(31686004)(2616005)(2906002)(36756003)(5660300002)(6862004)(66556008)(6486002)(66476007)(8676002)(478600001)(41300700001)(26005)(53546011)(6512007)(6506007)(54906003)(31696002)(4326008)(86362001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW40S2dYdEJNZWlLSk9HRHB4SGx4bmtuSlhmSDV3OUphS01xVVR4bFRiNG5O?=
 =?utf-8?B?VWV6Ry9aQ1pjMFA2SDFTYVR5NXliVWtjUG9zcjQ2bVFneXp2QWlVUkJuMWQr?=
 =?utf-8?B?TjkxUllSSk5QTjdjd0tZa0dmUzFhazhSWk5KWEhaYkJROVAxbkVsVFBNZEFr?=
 =?utf-8?B?MVFqS0hQUG4vZFFibjJmeEMxWGZXa0VRNnRtNDEzY3JSdGQwMVQwUnJBS21F?=
 =?utf-8?B?ZWlmeGQ0NjdnenpxRU1BTGcrdUJ6SmhiMm1VMEFLRXRGb0haVWRhcUpVMDlr?=
 =?utf-8?B?TXBlT0JKeDE0N21rSGtkbDBabkU3cHBBS2tDc0dPYlBqbStqQmZENysvR3pW?=
 =?utf-8?B?RTF4MHRNZGlYY0lpVEdoVHZNdm1Kd0xqWEhBbHlOTFlwSmpnTUtxRVlEOHVW?=
 =?utf-8?B?eWJ5djB2dWwxWFJJcDNITzFRZ3VaTUQxOE1aOUVXRHNsSTM0TlBFbXRWc0hr?=
 =?utf-8?B?TG5XVUtNeWozbFBzazJMZWExbkxMeE1XYStsc1NRUGY4UzBndUh0ZXViblhG?=
 =?utf-8?B?NGN0NDBKekNLbXdPK3J5OGVRU0hCbmdpckVmRElkd2ZJMzRLYWk1bUxzbzVE?=
 =?utf-8?B?dGtocjBMeW5RM0U5ckdRdU1JdDN3bEU2QXNJcUtkejk2OUhsbjdpcE92WkNp?=
 =?utf-8?B?Wng1MlN0aXAxL0VyaGR4dUk2cDBjWFN0UXJRRHJYbWN3eVR6dDZpZ2VEWC9K?=
 =?utf-8?B?TzYwY3NwaWNpMlNIbU01NVEzZWpyMXpqaEx2MllJUGhBWldvcGZOaHRnL2wx?=
 =?utf-8?B?R2RrclU4cjB0MGlGSmhXOVI4UTJoSXpHZi9YL2E5bERDTjE0V3FYdFhQRk9O?=
 =?utf-8?B?S0dHa3VSTEYweVIzS1RKNHRKeE9rS05Fa082c2N5YnpmbEx6S3ZPWFZWTFhQ?=
 =?utf-8?B?ZU05RlF6NGFVRmNlcFFMWkh2QkhkdmZkR3VLWmdTZzhQS05UTkdDdjhhMlNh?=
 =?utf-8?B?ZndFVWYyQTBSOUJCdEgrWnVBMG12aUpxU1Viank0WkJLSDVNK2FFbEhZKzdW?=
 =?utf-8?B?Sk1Mc0ZHTWp5NUtrMTlpcDNKTDk5U3UyaG5USUdyMVU3UThkWTY5UjRQZUdD?=
 =?utf-8?B?Tk9XakJENUVueVF4RGVIV0hZMGQ5c3FTcnpDMjVVMjZQV2FjVElZaVpZVXUr?=
 =?utf-8?B?UXZMeWw5UnhVNUlBaXgveFdBMXd1Z1J2TU1ia2ZicjFnVDZEMXhIQjVQNkY3?=
 =?utf-8?B?dUdEOGVDRncvMDZFdE4zK3pQWG1DZjN0QVlndXJVS3ZhK3VtSXpyUjZUTTN4?=
 =?utf-8?B?bThRVnZlV2p3b0I4TSthbjdKSi9zOHgySjhMaU5KQUdqNmVkc0tlbDJieVpz?=
 =?utf-8?B?Z3Y1dU5pVC94L0lEUVpORmF5S0d3eVA4YWpoYjR2RVZEdjJIWHl5ZHk2WkRs?=
 =?utf-8?B?YitsYmdKZzYxRnovMjk0SnBxNDhkcmZRakhLeUl0SWtoY094Z1VRU3NoMnVF?=
 =?utf-8?B?M21qdXBuaFpEYkM4UDBSbHFMZFc3TlNGUUxLVDcrY3k5VTVGc3B5bjNNTUVH?=
 =?utf-8?B?VXJWYWw2dEE1aDJ5S01iL080MERMUnBmWFdidEkvNkxOWU9HR2hleW83a2Yy?=
 =?utf-8?B?RkxJWE5jTHJUVFJCY29haUlHUTZtTWwvQmU0S3NtUHUraEMxU0lLOE9rSmtZ?=
 =?utf-8?B?K2lpNFFuOE56TFRpWlJ6UnRIcmNVc0ErUG9venhCRG1wZFpaQWs4SDl2TVRa?=
 =?utf-8?B?M215NHdKdk41VHFvRklKNUdQL1QvV3dFVzRhVmdmY3phQ3h2UDVsOCtXbEgw?=
 =?utf-8?B?SGxvbzFEeisweUxGdFVncWFHSHlScGxuT0tDZU80RmYwMDNHTXp0Mi9OM2hB?=
 =?utf-8?B?YjFha2E5akh3RTBtcXgvSklDZ1lLcmdDQ0ZlNE91OU1FRFhRNDlMRTZMbXky?=
 =?utf-8?B?K1JPREFyUW8vcmxCTW5XNGVvb1VCRy9HUWp1Y08wM0E5eTdQMnJvVzhsUHJz?=
 =?utf-8?B?VFdqRWVXTklBK2ZJWjhHd01WOU5KZzVFOGQ3RUZzbFVod2tuOXMxTncwY0JD?=
 =?utf-8?B?RUxkRHZERjhndzdCcDMrcXY1UlZpVFVHUHVmamVldzdHZmRmQW03SWxoeUdS?=
 =?utf-8?B?aUo5aE55cWVqYmo4cDFnK1h4ZDNhRHFTMW04QWdKV2xIYmVhMXJVQkdkeEU2?=
 =?utf-8?Q?QCPDXL8PaON/1RzkSo3SJqFzf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9eaa0da-ac2c-4681-8fcf-08da6587ba68
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 10:58:05.0626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9+Wy+CSnmB1+xKU9Po5q6c0IgESAv5PU5F+NusfTVVrUGlOVvBQmfH4owQatFkiAj6MCXmQoKJv1Umig2hv2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9390

On 14.07.2022 12:49, Wei Chen wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年7月14日 18:37
>> status
>>>>
>>>> Well, this makes the table complete, but it doesn't explain how you
>> mean
>>>> to fold the settings of the two command line options into one variable.
>>>>
>>>
>>> No matter how many separate "numa=" parameters have been parsed from
>>> Command line, the values of these original variables are determined
>>> after parsing the command line. So the determined status can be mapped
>>> to the new one variable from above table.
>>
>> Hmm, I was partly wrong - the initial values of both variables are
>> indeed set from just the single "numa=" parsing. But later on they
>> "evolve" independently, and multiple "numa=" on the command line
>> can also have "interesting" effects. I'm afraid I still can't
> 
> Can you provide some examples? This way I can better understand your
> concerns.

Take bad_srat(): you convert "acpi_numa = -1" to setting numa_no_acpi.
Yet imo (matching the present model) numa_off shouldn't be affected.
While your change is fine in practice for (current) x86, it is wrong
in the abstract model (which is relevant when making things common).

Jan

