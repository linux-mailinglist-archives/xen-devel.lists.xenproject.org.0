Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85240653CFC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 09:27:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468275.727332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Gv1-00062E-8N; Thu, 22 Dec 2022 08:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468275.727332; Thu, 22 Dec 2022 08:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Gv1-00060E-5R; Thu, 22 Dec 2022 08:27:11 +0000
Received: by outflank-mailman (input) for mailman id 468275;
 Thu, 22 Dec 2022 08:27:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8Guz-000608-Us
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 08:27:09 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2058.outbound.protection.outlook.com [40.107.105.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c834846-81d2-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 09:27:08 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB7136.eurprd04.prod.outlook.com (2603:10a6:800:122::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 08:27:06 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 08:27:06 +0000
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
X-Inumbo-ID: 6c834846-81d2-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFuDR7fMaYkzoo8yt3k/BG3fOa5aNLLkRb6tcseQaV1Q2TZpWuS/4kwGAk1FNOxiyZ2y+azchT45gstYNBY1mfkVKNLO4oQb9Amj0zR5/dIrvlRYcwUNwIWBNQByJk6K9rlXs7rFrd26mWv8cCFZLs9eXSvg6XoSiJoLgH9//d1CM/yDhs1pXkhe7ELqODORK5JNJ4vAi0kXjxMvRqcrbPgGWmhFZ4g3XBIHbWv9uDzd8gnvAFLMPTZJdTIIPKs4lXwvcIyY9xpdOlm6FM0r2eSq2robjpxQqjRQ5+HkU85g9hFOP3kvJxznqnh2LVpedNLMmh7kdsASXpeJilgWAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+ndfufsbCvvr6VDuB9yDWu7QNF6veOi+RYiSRjzuxo=;
 b=aE2NYeoza6d6/6tiT0KiAyoM2CJNFDr8He7SqQEAaznxn34ijTNsWw+Pocz7G4fVUPnYXQ4jyu3+1simYeCimuaSMMJgHj7CiYUqqP4BQrlQg00X/NLuXnbMyX2QnIaxQgxgR1HLpa7+NQKIFOSTZzdtKUnKct2acGDzi+IxPQjNwsyJPwPWsDVBXwduPuYjTe6P2k3CnGcHLrbmdnoy8NtdzSt7WAFnn+IuwPdf47xn42SzJxNWui2pQ0KNB73YS8b2sP1toQ8OhBtC0HYo3jCe2DTjvLqWlqHjYOqAQNfQ9o82LDBTsm7/tIGnu1I/aTH9dSqgmBimu3WnKW1uYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+ndfufsbCvvr6VDuB9yDWu7QNF6veOi+RYiSRjzuxo=;
 b=zfXjx+WPLibnqgQcI+mRWpvLA4pSKBQpLIqNEYjuY+PlOxSi89EPvMQJAiClWKuFVuhtLABlRCEBggB0zZNvVtN1HAYiwBuGEYveZscC3zX7iux4S78VLXa2dcY/oz9ws5D3Q15sOku8V7MQwxrz3rf6tVhX3XTX+CyRCkm/7yLA4Ot+KoVOUk+Kcy7Bh26w1TcukBHWDfgA4f+N+yKKkDBQkyI67QsD8/T7TqN6B5CX50phS8ApVfRmoK77W5N6T74hmrPzsKuhIRT4DHjy36H3pE+hzfbgGPKKiEFzz9CDIJR1pgAtuggXfg4pYPTEVXyTJEKiUGxSRCTd4pli4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f4e57e6-bbc6-0773-b422-62d5a367ad7c@suse.com>
Date: Thu, 22 Dec 2022 09:27:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 6/8] x86/shadow: adjust and move sh_type_to_size[]
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <e142f7f8-1184-a65e-0f50-0b01ec7fad55@suse.com>
 <04350e03-25f3-df4c-8b1a-486d531eeda7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <04350e03-25f3-df4c-8b1a-486d531eeda7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|VI1PR04MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: fff57d28-edbf-4ed3-e445-08dae3f64fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rXULhC/H4aSDprEt1m0MF1a5IDOrNDSnQFobO8RdNbX7Cq4nYtYReUsrgBKWVBYsJmU66KbhOBremLUimCStmSRsqElBqQOGT4vaklwLGzqdqXRGibF4RSVGZoGStbHWVVBXmVTOFiyqJGZMgZObxuvX6EoFhDcmshR8JDvHdwoc5zl8gFcbTtwADpkFI+cMqFzKfkuMOz6v13e1bgaf/D6k/eKue+u1xx1e7dyRpokDN/8YcO2yI5SedF9G0oMlOuquwCsUMS//gM2moH0umOZkvEzsRXDii+C4FSBi+n4TBQYSrQrJrRjaBqgsIRZpG7aPOeGHXqj14IPCenI8MXAcxk1V+8ZuqOwXdXmgEImqx6D+YKvYwZSX+BaQs/6eEFFeCytulovuK+YCHkqVOVUrsrNaYDIkK6r2oFSvHcYouSNuSz2KPtlFYdnrsOa01cUkXrypC+WqButPq/QtCdeVYdEEh/4y17yukjXhKDFqF4gn1DN3/F3+tbU9cHQozyGWRY89izMxaseqaALXBvIj6oIJZSJ0mPPYU/y6v9fE2M++Zqp4bFxTmUgpHsdMJkXWja2f8bXkMdpF49nUNdkZTeCua08+Tovt4EDMv5At+MBnREwxGBwMc+yOw8d2Wf8F0od3lRMmKouERia+Y/CQJSSp7fixCwwu9CmHAvELK9IN8Xiku3xIKbeEHJTmCqyUkk46TCTgYHkGHjpOZNlD1/C12kR4cSUkJt03v6A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199015)(31696002)(83380400001)(86362001)(38100700002)(2906002)(41300700001)(5660300002)(8936002)(6506007)(4326008)(6486002)(478600001)(2616005)(53546011)(186003)(26005)(66946007)(6512007)(66476007)(54906003)(316002)(6916009)(8676002)(66556008)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkZBOVRsRlQ2RWFZdXVrYVZxR2tPcDBsbm1CbzE4R21lMnVGOFVaMmF6YjY2?=
 =?utf-8?B?TjM4Zk41TzRSdzAwV2xQNm5KMHo3VGZLbDV5eXRubTl1UDU1cTZpdXI2ZnZD?=
 =?utf-8?B?OGYxMFlXZk55d2ZnQ0NTK0lZdzBuY2pZLzBtdnZ2UXVLREFra3c0RmRneW1k?=
 =?utf-8?B?ZDU0alljNG5sMlRCSnNrRThJQ0o3aXFJTzY0QlJNNkxZdjlycFFwZ1RWUXlS?=
 =?utf-8?B?L2dtVFROc2MwWTJsZDc3QWNsNVpYbWwyZnF1QjlWdTUySzNlZWpHUmNBU0Rw?=
 =?utf-8?B?NHZDZWt6MXNYQUdWcFh3ZU1rVEczaklMTXRnNmZWN012NStFWW5PYVlLSXZ6?=
 =?utf-8?B?VFhMQlhPZlh0NDYvcUtXVDUxMTN6WHJha1F2UVdYS0FPUE5mWHY3bllVTGpl?=
 =?utf-8?B?Z3VlckpoOEM3N1J4MExlQm9PN2QyekNlNUZmakh5dkJsUzJKVCt3NEkwdmxE?=
 =?utf-8?B?VTZhbkJqVCtrSFpWeVM5clRVUkZCWDZ3dkRZMzQzU1NGZmVCclAveVNKZGJJ?=
 =?utf-8?B?TDNyYjZsMW1uR2VEZzVYMDM3V0owRUw0SGZ0Slg1UzJNc2FBUmY4aVBHa3Q4?=
 =?utf-8?B?OFE2QTBtYlRoNHp0dk9FRzRlTHBmeDBtMmVCeitHZkpISElZYTNURU5tOFJl?=
 =?utf-8?B?R0pkRWhENFRlRzY2R05yYTVBUzMyY0dYNGNFUnJ3QmtEbTRpMnNxL3BsTUZZ?=
 =?utf-8?B?NXRPczJTUGQzaXZwYXF0TzROSTdQM3NodkxGL0RDZmpJU3VQYmJWVTloZFdS?=
 =?utf-8?B?UU05SjRjWlo1dmhWTWIwbFREZ28zK290bis0YUpCemZGVWErUzkxRGRUcVB1?=
 =?utf-8?B?c0JyTEswaGVGNzZkRFhlK2pIYlRsbUc1MDRsUGc2QVdvTWJpMU5KWTNTbTE3?=
 =?utf-8?B?MjdGdEswSndhVm9mdXI5UXZKekdqTzlSSW9tT1FGTzJmeDFPWGQ2cDZDZnZZ?=
 =?utf-8?B?Z21SWk9JK05iOCswc1RqaG1XNjRmTldDNVM3bVQ5dTE4d2VaRmduSCtRUzVh?=
 =?utf-8?B?YitUU2RqN0tjU0Rtak9VWWVZbmxYRXVNbHMxbGw0VnBKRTJrNHNNL3lmVDdZ?=
 =?utf-8?B?TjdlczZjaTlWMXVFYk1ZaEdMZGxqdzlhQXpzS2pmVXN6L1dPYWZncW14NGZh?=
 =?utf-8?B?SHkxdjF2eXUxdS82MUo1U3NpTHY5S1NaaHkxdCtFUDBXeTJhYVVrNzBBZ0Qx?=
 =?utf-8?B?QjV1NmJkVklPZ0xBTldiaE1BRHFSQ2xnY2Y5czRObjFpTDVWSXZLWmhHNFhI?=
 =?utf-8?B?V3haRU41TEE3SXcxMDI3dllBUjZNeXZ0VXdvQkxvakNZMHpLUEdVMFEyalNy?=
 =?utf-8?B?TU0rSmlKSnNIeERKM1dkMTdCcmsxbEdnaGV5dmwybE1vc1lkSExhd2FQSFBw?=
 =?utf-8?B?cEsyQUlvc2dYa1F5dlEvK3YxdG4ydWpVVDI5eiszQmRHNWZyNnFuRHVOUjY0?=
 =?utf-8?B?a1o5Wm50TWpjRUhDOWUvOWlWSWpkdVNOanYwcHhkRDZ3VFJYLyszaTBOeTNa?=
 =?utf-8?B?TTREckJEWG1kU2JMQTFLaHhocVFTMzkxQkovMjl3ellobHpuemxGNkZoSUxR?=
 =?utf-8?B?RXVudjNzVGNSWTE2SHllY202ZnpSZTZHc2NKUll4WEhia2Y3RGNKZ0wzZTNE?=
 =?utf-8?B?b2RSK2RzSnoybDdTK3UrSUJEcXprQ3dDMmFMZWp6SHFUTXRQcnBhVnkyWjVj?=
 =?utf-8?B?TWJZRi9vTVhuTWRScnpLRFVONWtVZGdNeC93RHY3WWVzc201VU1PZVk4NUVW?=
 =?utf-8?B?azhYYTFoNDNzcXp6eU5mNE5EOXZIT1FQSnBnZm9GbkNMMGRIalpzdGtmWVVt?=
 =?utf-8?B?ZDVZZmJPSWZuWGtoN0FkdWM2TjEzUCtvVDJMSjdZaEdwUGY3OE1RTndtbDVY?=
 =?utf-8?B?NGFwR1BQWE50UHdaL016UmlqSk80bWc1KzVBZ1BjdStOK290U0JzOFc1MUVJ?=
 =?utf-8?B?MjBzTm5QNmY0dlJjeGFlNmJDMnNWOEo3bmxpVlZyeVBWL2VhMDRhYmhGQklF?=
 =?utf-8?B?aEFOWUEzZ1RrQ1JOWXlvVjEySFVNRnRGRGdublh1VXFLYnlDazFjZVc5N2VS?=
 =?utf-8?B?WkhUQnRVaGdCUVlIZjVTVDJuQ2xiWUkrL05icWhkRW0yWXM1MmsrdEhQWmlj?=
 =?utf-8?Q?GbaXnV8yXZyOg3fbbEhoXVfnv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff57d28-edbf-4ed3-e445-08dae3f64fca
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 08:27:06.7909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UiIpMwyOri6HxhtmdSZdJVRjdqxFDY1Wd35MHXX2XawijRC2sYUTl29efom4t3bR41DloPK/YYxtHZhhRy8dnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7136

On 21.12.2022 19:58, Andrew Cooper wrote:
> On 21/12/2022 1:27 pm, Jan Beulich wrote:
>> Drop the SH_type_none entry - there are no allocation attempts with
>> this type, and there also shouldn't be any. Adjust the shadow_size()
>> alternative path to match that change. Also generalize two related
>> assertions.
>>
>> While there move the entire table and the respective part of the comment
>> there to hvm.c, resulting in one less #ifdef. In the course of the
>> movement switch to using designated initializers.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although ...

Thanks.

>> --- a/xen/arch/x86/mm/shadow/hvm.c
>> +++ b/xen/arch/x86/mm/shadow/hvm.c
>> @@ -33,6 +33,37 @@
>>  
>>  #include "private.h"
>>  
>> +/*
>> + * This table shows the allocation behaviour of the different modes:
>> + *
>> + * Xen paging      64b  64b  64b
>> + * Guest paging    32b  pae  64b
>> + * PV or HVM       HVM  HVM   *
>> + * Shadow paging   pae  pae  64b
>> + *
>> + * sl1 size         8k   4k   4k
>> + * sl2 size        16k   4k   4k
>> + * sl3 size         -    -    4k
>> + * sl4 size         -    -    4k
>> + */
>> +const uint8_t sh_type_to_size[] = {
>> +    [SH_type_l1_32_shadow]   = 2,
>> +    [SH_type_fl1_32_shadow]  = 2,
>> +    [SH_type_l2_32_shadow]   = 4,
>> +    [SH_type_l1_pae_shadow]  = 1,
>> +    [SH_type_fl1_pae_shadow] = 1,
>> +    [SH_type_l2_pae_shadow]  = 1,
>> +    [SH_type_l1_64_shadow]   = 1,
>> +    [SH_type_fl1_64_shadow]  = 1,
>> +    [SH_type_l2_64_shadow]   = 1,
>> +    [SH_type_l2h_64_shadow]  = 1,
>> +    [SH_type_l3_64_shadow]   = 1,
>> +    [SH_type_l4_64_shadow]   = 1,
>> +    [SH_type_p2m_table]      = 1,
>> +    [SH_type_monitor_table]  = 1,
>> +    [SH_type_oos_snapshot]   = 1,
> 
> ... this feels like it's wanting to turn into a (1 + ...) expression.  I
> can't see anything that prevents us from reordering the SH_type
> constants, but
> 
> 1 + (idx == 1 /* l1 */ || idx == /* fl1 */) + 2 * (idx == 3 /* l2 */);
> 
> doesn't obviously simplify further.

But that would then undermine the cases where the function returns 0,
which the two (generalized in this change) assertions actually check
for not having got back. This would also become relevant for the l2h
slot, which - if not right here (see the respective remark) - will
become zero in a subsequent patch when !PV32.

Jan

