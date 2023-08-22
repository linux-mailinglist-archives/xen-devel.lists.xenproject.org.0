Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E574783DAA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 12:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588353.919857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYOLN-0008Uw-Rz; Tue, 22 Aug 2023 10:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588353.919857; Tue, 22 Aug 2023 10:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYOLN-0008Rb-Or; Tue, 22 Aug 2023 10:10:37 +0000
Received: by outflank-mailman (input) for mailman id 588353;
 Tue, 22 Aug 2023 10:10:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYOLM-0008RU-Qn
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 10:10:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 207b3467-40d4-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 12:10:32 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PR3PR04MB7433.eurprd04.prod.outlook.com (2603:10a6:102:86::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 10:10:30 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 10:10:30 +0000
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
X-Inumbo-ID: 207b3467-40d4-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzC4cdlskZU8e/yR52BQfgP73mmgfzCz5Z2R9J6HGg2BRciDrUGekyHnaMpSV+X9+hr+eOIPagibHk/eyWdPSaE6Q5m3IX4XMNVmS8V4kxsN9BX+FHgzw/H6eBaLfkT4c59amoiLycvGlG+O5TUiD6AU3LDXXbI9Mms+f7p2cPcwUFW8iduJ77fm0qfcVL5l0zbHmG+rC5RtFbg4p2dAGF7ZoxxfjIbMXAeXrUQkRioBKNwmBRTI02D9gz+UJFwfAhxSirvmotsNF9iY8OrWqj8TUr/bbb4T11cDkCZpywdBLCSyQtHgLZ/V0vJXPImsoTl7tzN6pnmd9f4TevJ+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGVRD9WRRBN34gsmqp52PvyjeGnZinUBSkxiM0NpBxg=;
 b=BdpfpSaLaY6I2bmIZRoSX7YiK8GtobrocswIREa3lARNwmPvxce2vFEErQfQSST/dJ+oxxD5wU3uuVNi6JYs0Pyl1ROT4XuCn6i85J3kZHKmfqQnXt5eVQXgoqvakW7ffbeKav9icIGwEpGvsIuWuH4/2US4N+2meJ2bvVaFrxz782TpoDd0fKLoFt4HEhd5a51HvVUIcpogCFhYrjvnWK2Z44OlnNqqHmMze9yu5GWrmAbXAq8H3LrQIICpn8Tinr/VAbuwc0jYXTQrGbgGN6Fpd6Sm57HFbNdjUoXlsLxfRpclCFkDzBc/29QMzh9m/hQqWVlO+hEeJBvE/prtwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGVRD9WRRBN34gsmqp52PvyjeGnZinUBSkxiM0NpBxg=;
 b=FosVsZWQLDnMVN/ZGcMhUCddUpSmPMJtEKsOPxNDtfJt1JCvcJXPBcf2pR/SmcS5BQv+tDkWb1zfME2Xk1XscVUBxbpbYqmGfCYNOlRbkJWfdrBgL5mwHzdT+r7FoQYFYHctGYyDXz6PPTIBI2WllNz3207UnJOElZee6v/9DGkkJVVbshnCz3RwiATAdcQe1zsOfEP+JUwMkwG94Rhe8giRixZQHP7jAuu7XJdsuEBlrJPT2eI4sd47WvaHpYBvqkskPGFIlBrzSXK3d7Ql3b2rwwdCGBAR7RdQ7xIKSZ81GNL5EtaIocrP+0d8Qw7RRu7bWkHLAb6bWQQFnxblxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7c22fd2-4a5a-3987-1dfe-691107790c87@suse.com>
Date: Tue, 22 Aug 2023 12:10:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
From: Jan Beulich <jbeulich@suse.com>
Subject: Re: [RFC PATCH 2/3] docs: make the docs for MISRA C:2012 Dir 4.1
 visible to ECLAIR
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1692636338.git.nicola.vetrini@bugseng.com>
 <857dd398240accabea73e5660ae77f3925727ee9.1692636338.git.nicola.vetrini@bugseng.com>
 <eaef1c3f-490d-a21d-92d1-cfbee50dbdd9@suse.com>
 <bc278b7fbc9d3cb85ac2dd44088ab818@bugseng.com>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <bc278b7fbc9d3cb85ac2dd44088ab818@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PR3PR04MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: e49ee3e8-ef7c-429f-b8f7-08dba2f803d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3aQO55IalHsLxLIXJYe3qzRDzyKH8buMLCAktbOFVbya4LrfaSUKJO3gQuHFi+JGBIFZjs3ZtCtqHjqCRpz44T4VnL/gCNr9syZooN8ZKuiHM+0XerGq/AoOeR6f3ojEUdj91ZR4DwBlbQtaLWp8wRlHRLWzL7pVkJexOh7CtumXSMQ88Bsz7sgB8SplrG1fmo3KZDXbm0K0BpaexZN5LyZimzPuFsJVDOU3mnE2chRfIltm0qw3TYf7RdFjoDeE/GgHH6gzNSVvuh0Rd2/pjU8NGa2YXvohOabvoX/jw9HNRuXBNjJ2836el17u1cZI3C5dTGUAUbaaY7l39UItNSSJFlNNQS06vyAUDn7wNRRark6FJzob9tVhCGEttVjjewJwOugzpUPjr6ReCy1y9whJH60hmV+3h0qSAXb7YjozuVosrorR60MJkQJUZCGGeORrhIJiuP5X0G1bBzjlkFNsyEKaXjjZ5ve1EBLlhZKeGRRUgktZNVzQhv37pGWPDlIBEjFlGOZZDRgVNDhsRm44zCrpzoKogA4IwoTGHMqy4mvW17t8n+B83c+DD0620vT3FU8MgP/aGTpo91lGrhpGUqEKXEuCqKX/A2EsxMQrlAEyB/KdyV2rwNdS5IU5MRnXIxLVnRV6ugz72GoUfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199024)(186009)(1800799009)(2906002)(83380400001)(6506007)(53546011)(6486002)(38100700002)(5660300002)(26005)(31686004)(86362001)(31696002)(8676002)(8936002)(2616005)(4326008)(6916009)(316002)(6512007)(66556008)(66476007)(478600001)(66946007)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1o3SFdBL0lDcThsN0lUU0FxcUY3SmhjaFRXKzNiWCtuWnFFT1A2WHcwTEEv?=
 =?utf-8?B?VmxPQ0dJdHc1MlhtM1hyNXAzSjVpZjRtTzlzR3dHTHN0NmdYdWMyVHVpWDl6?=
 =?utf-8?B?OVlrNVIwZUVmRVIvSmQ2ZGU5eENUMkpxSTNsd0s2Z0NQRWp4a1g0cFhvMUl2?=
 =?utf-8?B?U2RpaSs0WHpnQ2czd0xmZGNCemo1TUVST3dXUXRZaTlzV1BxQ29tTTIwRkd0?=
 =?utf-8?B?cGdFSEd5RzVMc1lJWW1YRmJLemlxYTIzblhJVkwyQ2ZHRFFmZTE1RS8rTFNZ?=
 =?utf-8?B?SkpGa0xXT3dzRy9vUXVVQnFQZHpFM1h4a1YwaHZzL3Z0cWNzSlh1Zm9COGF3?=
 =?utf-8?B?bnlibld6VXdmRlZMZVcvc2IyU2k0a1Zsdmo5YUZsMytCSFZVRTY2b1BGRzBT?=
 =?utf-8?B?ZEpGemtxZkQ5cStMNzVKT3UvdlZOTlM5c0JSZXJPVklLMjZzT3p0ei96WXhz?=
 =?utf-8?B?cXA0ZWk4eXEyQmVrS1ZRdGt3djJLSGI0S2ZMazZ4S21nMXRFRXZrSXRjOWZa?=
 =?utf-8?B?aHVFcU94UFljaHBZUVNUT25EWnlONk1uYjREa1g5ZVhybHFyTkdFa2xJaUJ4?=
 =?utf-8?B?UFd4aVVJQ2ZXeWFoM1ZsSWE3ODZRV2lqbjFQWjZ0SW90VjZkamNiUmlMRnJt?=
 =?utf-8?B?QjIxWms5MEk1dVZXR2FpUSsyaWxsU1h3OWVPOXZpSHczV05pRGtZZlZYQk9M?=
 =?utf-8?B?SjdLVmwzL21Jc2dEZUcwVDRCaEN1YUt5bVdTeHlTM2h1cWt1ZUJvZWVMS00v?=
 =?utf-8?B?Q0lUT1ZRZ2NORU5mVkNjbWQwWkhtWmVMRitaQlloa2VYWHJPdGVheUJuT3JP?=
 =?utf-8?B?R0VkY0pjNlZ3S2FHaXFFaFcwZURFL2hHenBEaXM5eTBOVWh5eWZJRjNlZ2dV?=
 =?utf-8?B?U0xFL3YwQVZLQTRVaG4ybVp5cUpNMnNLYm01SmVSSGpIa2FUdDhKQ0dJR1E3?=
 =?utf-8?B?b2dBUDJ6QmdFRDArRDRpMm82OEo4Y2h6RTNaWUNtcGM2cGhJR2o1cDk5b0JM?=
 =?utf-8?B?aENZTEMyK2cvZHVoRis1anRrb2JXd3dJSU9CdVFRNDkrMGI0c3IwOVZKVW9I?=
 =?utf-8?B?VmZXQVVyVHZrdzdnWUcrenhBb1l2b1NXR0w0UVdsUEJ3TldURGNFbEh0ZjQ2?=
 =?utf-8?B?ai9GaDNldVVxOStwMG9YNFBXUjFJRUZzOUZYbFlpZ3NESkNBYUVxYTNveW1U?=
 =?utf-8?B?dzZidkg3eGxDaDZsaUErdCtJQ3Bab0JoL1NkU1pRNlFpYkFoMlNhTEtKT0VY?=
 =?utf-8?B?cTdCZWtqd1BvT0M3Z2Qxbk41QTd4WWtWa2U5RVFHcFVWbTFDVjRPc1h4Nlph?=
 =?utf-8?B?Y041OFdhZmNmbEV0aWsxc1I4SUpkSmJZQWtJbThocDhKcWJqZGxHT1RQWURk?=
 =?utf-8?B?NDFaeDN3emcrN2x2Smx1VDB0cDJEbHJmTUhlenN2YUxMYjB4NUVadWpsM1J5?=
 =?utf-8?B?ZEMvRFY5OGJwKytsSXVXRUYrVkJlODBPTTVKMlg3cjBYRmpZRXlJYTJpUGdj?=
 =?utf-8?B?Qjd5RnhETzdwd3JoaHQ1STBjRHo1blk4SW1FSXNlempjd0V1Z01qcyt4Qk00?=
 =?utf-8?B?SlptRUZkd05DSFZuRG9nU1dMaC9ZT3dkeG9Ka1NibzR0SVZYT0lDSjhocUVS?=
 =?utf-8?B?OERUQTF2U0RDRjJ5WlVraVo1TEJYaTJVbXg0NmxZZEhpbkJFdHRDNThFRWZR?=
 =?utf-8?B?Tm0xTG54c2x3MHFHcHRKQUJFM05COUdyL3hMZ2paYnA5b3RiZTRWS3hSTTFY?=
 =?utf-8?B?Sm82c0RKQWdBckJTUTdNenRua2lVN2Q5NjI2Y09nRnVMZG5TUnlDQk9aV2tM?=
 =?utf-8?B?SUQreGIwcVlFWkJPa1p3OVVwdi90elZZSGYzRnlPdmZlaXlWZ1N5ZCtKOUo1?=
 =?utf-8?B?SEQzUFM3UFhvcTZuVndJK2t4OFVmMWNwU2wyOCtVZGNFUjg5MDJhV0dwcjJ4?=
 =?utf-8?B?aTJ4bTVyVU5jY2h2TmI2alN6TlYxcDRKbVZXaWFvS1dNclNQSU1wOXJvZkEr?=
 =?utf-8?B?ZUFCKzFkcE9WODRwK2wwdHVrSTM3R0ZTN2VJL2E1aHI0YldoZjBlanNHT3k5?=
 =?utf-8?B?VCtReDBRajhlcnowUWhwWXhGbUFXNkoySlRNTU5VUVVOZlFXQzYxbE91akRa?=
 =?utf-8?Q?E8NGs96uC67dm6JIYIzrnfpux?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e49ee3e8-ef7c-429f-b8f7-08dba2f803d8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 10:10:30.4263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqXX7CcDrPA1JdOv8GStRYbShYkK0aebeaca7S+TbwAK/Lb89Q9k/Ax4SFSYYqr99GOdLHGM713tmy8+A3HjUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7433

(Nicola, I'm sorry for the duplicate, but I didn't mean to drop xen-devel@.)

On 22.08.2023 10:27, Nicola Vetrini wrote:
>>> +C-runtime-failures.c: C-runtime-failures.rst
>>> +# sed is used in place of cat to prevent occurrences of '*/'
>>> +# in the .rst from breaking the compilation
>>> +	( \
>>> +	  echo "$${MISRA_HEADER}"; \
>>> +	  sed -e 's|*/|*//*|' $<; \
>>> +	  echo "$${MISRA_FOOTER}" \
>>> +	) > $@
>>
>> The rule of thumb is to generate into a temporary file (then you also
>> don't need to wrap everything in parentheses [or braces]), and then
>> use mv to produce the final output. This escapes anomalies with failed
>> or interrupted commands.
>>
> 
> I do see your point for temporary files, though wrapping commands with 
> parentheses is a
> fairly common pattern in Xen Makefiles afaict.

Now I'm curious: Grepping for ') >' underneath xen/ I couldn't find a
single instance in any makefile. (I'm not going to exclude there are a
few uses, but then likely not merely to combine multiple commands'
output.)

Jan

