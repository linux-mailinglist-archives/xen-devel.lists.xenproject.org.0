Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9906C2B5A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 08:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512220.792038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peWQM-000750-PP; Tue, 21 Mar 2023 07:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512220.792038; Tue, 21 Mar 2023 07:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peWQM-00072K-MB; Tue, 21 Mar 2023 07:28:50 +0000
Received: by outflank-mailman (input) for mailman id 512220;
 Tue, 21 Mar 2023 07:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peWQL-00072A-BY
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 07:28:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03ccbc10-c7ba-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 08:28:46 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7783.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 07:28:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 07:28:45 +0000
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
X-Inumbo-ID: 03ccbc10-c7ba-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhL964rdVXkjPbk2X7imMFYc/yzUAs8U4swnEn6K0NAMEy4wfZRuw0qg/OQaxkUGbLq3kIu5QlFET0smjrvcAyd31JJ1KmUqqZjCmeMDL9pUUq5HYUTO0a2q7wUmtJU7fVcD0GzaiyRvj/49Y0864ctdDiWYq0jWLYnDLOn3RKu+FGfOqk6u9lAzmTdAHY342xEupUO+OWDSeuQuqZUeZaLwe5kfH+ftgU2EYY7hf2hlFnPE7rz7W6delvAOJYC6kx2YTkUZOxUQkCfC3hDJppyht0YDKPK0OwGtUUaHQ9gLQwYMFAAL4/O8h+2777HS6qp6z09/PiSflwU61m2ynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Foz6/LL/2ZSWntFeiRZIfbGZLNrXiM170+k1o1TzyFc=;
 b=bgWd59WcXozFYX9Mk62xejHvt95bBvpsusNExqET4+6u2ofTMhnUNaKECI/femuABA4JJbinz6l3f9A6YaVD2FgLp2YxdH5aOMt+sRYAkzwc9qVrHztERNvUxbtNVHbOHjpKOiXGBFTFhxYrwhJK9LCWUKNR4OD+HJbTz1C64MW3ND5OT9ylzRHrzWn7OnYNvcaNuAhk2s2ZYXWKVJLqFAyH7V6F9NaRB0YyDpW/3Z48jgYmz0plb1QI+xa6QCBDH8TrY+umOaNcMj/JZz0tFbLuT3F82/oYsAFpmg5Os+ALb5k4ukT7Xex53sRnt99k9KUqW+5fh4KLEiM/SuCoaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Foz6/LL/2ZSWntFeiRZIfbGZLNrXiM170+k1o1TzyFc=;
 b=Lu1aaKbS0T9IcS4U+6AAusVokYWiqXGV6OpaeeOPloQ4EqdCs9FlS+tqP7KBR0dsJLtJgzXqrriCOUCx6PA3Igq2HIoObP6yuz2P3/FpchnIrxti7gj0+Q5ngzqm1DdYGsRrKBO41kSJbR+foyhS0/u1VOLDciGIcrK6djsADSh8LEqoCpqWmQ78YhR9a4GgWq700zQe+pTXgN2O6hjwe6XMQfApMOjbPGOofNs8QOh9k2B4+Yiyh/jaS9en0Ypum8g0BMHDeKm8Kn6hqNWmAURR63vYb2UqJzX+WeQsHRASO14NlZIgNeFVJHSXcHMd2ZKMV3RsLfL5lOSF/x5SsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f14bdb8-86cb-9c42-e1a4-751625ead2e7@suse.com>
Date: Tue, 21 Mar 2023 08:28:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>, =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg?=
 =?UTF-8?B?0KHQtdGA0LPQtdC5?= <valor@list.ru>, xen-devel@lists.xenproject.org
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru>
 <f2231607-b29c-b54b-874f-4e30ee84ae80@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f2231607-b29c-b54b-874f-4e30ee84ae80@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 86133720-70a1-4116-631b-08db29dde73b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o70r8VOkogCPisbYSEoOaGZbDWDhAEbAiR9LsSJgDbDRbcosCDMqptNi9mAvpzhavEQMwzv3jkMuefHIYQBUTK4MFPi3Zo6OV/9wk+jjsWP3PeCZ7Hvz1bzarXLJeSzgDgIOU2r3YnQzCpagd8iDrF0wROmH2hZUMQcv+p+2uCGXuD1ytkjj5zx6ui3hWhhziKM8ANWiSHzWVLatAazIEseWmUPPuiOPNrsDAHVj7cv27yZG8mmy23uAX7KFN/0Ck3LSdzkLD6rcRqfD8XPye3NOhGMasxx90TAgUBNrqivZEkb6nOqQJc35g6T3pVIMmwcGnn/vuTTd5z5JsSw6ukBR84BwEDo8NNPtDLTo23vpREU8KINM1GCI2dC3rZRja91JndL6fQDq5hP61nV8CRnkQCNrKkzc8/3y/T3IgF9QYoacSGyiqgtg2mzXQKBbeNxoYTGFOBwwpY/7hzXvsJsERW0t+YY3RrMYFIQNpIFdZbOEsOPGzEeZSAJlw8qPXk8r4IPDO6Oi+2fWiRhmtsIgRCiWvJ66XM21pBQQD24fx9TYU+j8Vgtf6+/1LGCWWh9Y0IWkz3rbhdkjcWzRZvewJ75JLRSFab04VKpCOtnzcRyr1U2+t98MMfzEP5NaxLasHWvYPYP3FPfggG41HfS1hYR5z0wkm2b+SYXlEkFRUDL+A9thY4UhMxM/+4spcfJh5zmaGIYkgz3l+hZlvNXnDxeO0z5TAVrgAiTMgBU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199018)(8936002)(5660300002)(4744005)(7416002)(86362001)(31696002)(38100700002)(2906002)(36756003)(4326008)(6486002)(478600001)(6666004)(41300700001)(2616005)(6512007)(186003)(53546011)(26005)(6506007)(31686004)(54906003)(316002)(8676002)(66556008)(66476007)(66946007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGNLTTcwYWF0OUZ2S3hMT253RzNIc3dJL0lUem1VeVNmRjI0RmJJY3ZJR05s?=
 =?utf-8?B?ZXNJSjA3cCs4aktaNE1HbHRSMThpU0F3YXBhMFNZNmhVUmVqeGRzM0FjLzc1?=
 =?utf-8?B?OWlTbkc0cDJEOHlLQUtTMjhOQ29OUGxKYmYvZTZ2SGd6bFQwcDdCNUMvelBE?=
 =?utf-8?B?RUp6M0pQN29pcXJwTEY0MFVBbHpBWE1peGtxSVhvOTRGNEZNa1hrdkNDRFU2?=
 =?utf-8?B?YmpNNEtmZUJBbS9WTjhDU0dmZmtPUzIxcXV0Sm9Pd083ck9QMnVaUHpuNTdX?=
 =?utf-8?B?VGhwQzI0a0dMQ08vakNkOWZZd2VVQnA4S29NaDlDa0FUa1NGS2FnVlhaSGpk?=
 =?utf-8?B?dTQvclNXR1hQY05uRFhzOVNVNHBWbmlNdVZYZmFoZkRjMnZoTy9pLzBYcjk0?=
 =?utf-8?B?Y2RRRzAxdXhzRUZrRWtUUWFpeHJoZ2Z6Y3pPRFUwY3dScUVBSEpncG9nek15?=
 =?utf-8?B?ZFQ2NXYyUU1lOTNzOXlHNG42Z01uUlQ3TmhhQlUzUUFSWFhxaUx2MzhCWU1n?=
 =?utf-8?B?aXVuN1BydWh1dGtuMjZ3cEZkRlgyTFFsQzZhS284Vm02S3Y5UHYyRW5Dbk95?=
 =?utf-8?B?VmV6UTYwbGxDVUFDbzFyaEgwNldPNHdlL0xQYnBIck00a1lFcGxFV3I1ajZ1?=
 =?utf-8?B?V1NUME9HbmpBdTBPYmEzRFBvKzJ0TmhvM3hHck83Y2Q0aStra2s2MnVaSWJW?=
 =?utf-8?B?L0ZYUmxIUHpjZkdmdUZVMVZPazZzMHRTMjdvWDdCVVN5UHVmK2tZbWM3azZv?=
 =?utf-8?B?NXFEaStNK1VZZDUwK0ZDR3NlbVFkVTJseUVmRlduYmNXREI3UUo5VW9Yc0Ri?=
 =?utf-8?B?Qk9uVWVjdVpQNnVaUUNsWTdPUzBzcmd0TDF3Y3VlNTViNzNncHVsVWZzeUZa?=
 =?utf-8?B?ektPZCtsVEpyVEVhZzhXU29qb1ZrZmllOThoYTBiVnVFSnJ3aG14b2ZQTHZW?=
 =?utf-8?B?VDF1amZnNlc5V1FSazhTV05jS0s3N0pFMzJoSjRqSkQ3VmtXbHFjeTlnWHdy?=
 =?utf-8?B?Wjk2b1QrTXYvS0dqdXM0VTNuRmlQZUJHQ1lQcmR4Qk1OSUZ6RlROT0ZsM3l0?=
 =?utf-8?B?NU5XK0p3OVIyK3dQT0wvQ2lCeURtZEZaOVg4UG1TMDRtbXo2WnRNYWpSTE0r?=
 =?utf-8?B?S0lHVUpPWG90Qy9yays0SDhlWFVVNWhkZkNaMW9icXMxM1JMWUxUZ1J5N2dI?=
 =?utf-8?B?ZnFQTjhFZG16UkxPOVM3M1FLZkNUYVlpMzd1cFQrYi9oT00yMW4xMlNTTWdU?=
 =?utf-8?B?SWtYWjRNN0M3a2JIejd0bS9RV05jSk9CRlhsU21DdnhnenpZRDJjTWJjTDM5?=
 =?utf-8?B?TGN5VlNwdWpHSDF3ck85Y0RHQlNDVHZjb0V6dGFmRWQ1MzEyemczR0VLQ2Zy?=
 =?utf-8?B?djg4eFlqUGlpU0x0SDc2OFpIQ2sydHdyNVN1M0pVUjZDRnArUzIwNEZJV0lP?=
 =?utf-8?B?YjR5bHZ5OTY1NVVTTjhHVW9rdWgwZ1h4V1dMbTV3S3JrNHk5dGxOMDh3S3I5?=
 =?utf-8?B?bXhBcEVYRXd1aUxlT3ZrcXpxMUNRek1idVlOK3V0bnZWUmgzazJVbG96UTlm?=
 =?utf-8?B?ZlA1bU5YSzc2L0JXTncrQnVjZTd0RjVHSmZiUXlJeHFQaHFWQVFmdlhnbFZx?=
 =?utf-8?B?ZU1MS1lxNnpoTmo2MjdoREppVzVZVEloZzN5ejZ6MTVPbnFORkloYmp1b2dQ?=
 =?utf-8?B?b05WblpRdzMySWpJaS9ZQmw4dXYxR1FlazNXckJQL1ZUSzdYbGM3NHl6OWJq?=
 =?utf-8?B?US9iS3N3cjVjdFUreTdoTzlSeVVFOHpsUHlZYlhGSnU3WG1vZG5YODBxMVRV?=
 =?utf-8?B?dEhpeUNTNld1c0k2dVNqSVpYcXV6bmNIbXBERUUycC9Dd3NqQS9zSi8zMk1s?=
 =?utf-8?B?ajlhMVNMZ0FWdDJyM1VocGU0K2llTktPNU5yQVRpWE01b08rdW1ZS2FwS2t1?=
 =?utf-8?B?dGx3aW94ODc3ZzFOUGJWSmN6ZE4rVForUlNqNkJVelJqQTFGSGFRZmY4QUxs?=
 =?utf-8?B?YTQrcU1rM3k2eXhMK1k3WDFFY21weW91SlZIQkY4ZVBRUXpteXVxeUgrNEsw?=
 =?utf-8?B?NUZBZ3BrdG45WmhMQVdxNGdscisxR2Q4eTM5bi9PM01qa2NZUm8vWHpHTlhU?=
 =?utf-8?Q?gYbDjb3f6gFRtDbGJPV9FS2zQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86133720-70a1-4116-631b-08db29dde73b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 07:28:44.9653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZP9WeSMTZJXri6DdTpAvbP0xHm3/r4AN67+zEq5iKnKOuckHRtrsB+CwHfVYjIRovPMBNeBit+MImoXkqaFBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7783

On 20.03.2023 20:07, Andrew Cooper wrote:
> On 20/03/2023 4:32 pm, Ковалёв Сергей wrote:
>> gva_to_gfn command used for fast address translation in LibVMI project.
>> With such a command it is possible to perform address translation in
>> single call instead of series of queries to get every page table.
>>
>> Thanks to Dmitry Isaykin for involvement.
>>
>> Signed-off-by: Sergey Kovalev <valor@list.ru>
> 
> I fully appreciate why you want this hypercall, and I've said several
> times that libvmi wants something better than it has, but...

But is a domctl really the right vehicle? While not strictly intended for
device models, a dm-op would seem more suitable to me. Considering you
already brought altp2m into play, it could also be a sub-op of HVMOP_altp2m.

Jan


