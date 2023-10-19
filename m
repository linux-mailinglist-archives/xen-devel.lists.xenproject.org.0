Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E727CF41E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:35:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619049.963581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPR8-0002JV-IA; Thu, 19 Oct 2023 09:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619049.963581; Thu, 19 Oct 2023 09:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPR8-0002Gv-EX; Thu, 19 Oct 2023 09:35:26 +0000
Received: by outflank-mailman (input) for mailman id 619049;
 Thu, 19 Oct 2023 09:35:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtPR7-0002Df-DV
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:35:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d43bf530-6e62-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 11:35:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9506.eurprd04.prod.outlook.com (2603:10a6:20b:4c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 09:35:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:35:20 +0000
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
X-Inumbo-ID: d43bf530-6e62-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REtYofH8Mnxq7IqBubSzbgdAM78iLBfJ1BqUkcY0HYGcwRbBhZU+ZP487LKLS2Ep0L5ND63TlByziuB+m5DNjuDrtL8mLpAy8ZttLovWFM3nRZB1YPqXnO0pVBc2NGPTHeR+LZcZ0J9bQAgHkiDPSm8lpjgrSGsCxt6QASUrHggl5X7HAp9zs4vKrki1bzCyR9hPesDtwmQpzlzmfO52AVKI2zCG9nyMdE47LeK8/AMkflwgeZVfpX1IbHc9HL+H/TJzGZ/tSioWh1dOBT3FVQ5OJy4qVnotr20rv7Zg8Im4Z+JJu+bS22z1uzGNHIJMViNbh6/NWVAkHogqfp7S4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pv+kPGT/Jmzqr4TLzPAXHp6uYmmXls4E8Q7d8Tt1sjc=;
 b=blgRzAHYm9OsK6CsL9j6SL5RDkos/m4yZ5+0qB1WUNq/I+GJaYLRdtTBQkAhblGqmjNRwC+3rDmBUp2THGI42fmAQ8VVCXleAgjR2tBb9xYVYbJ+qNH+cely6/YhdgC++kRnXcfphhdjSHZUM99wOzvoG6pSr2atNo04ig194MXfh2rhYI+tRYZLeDJhtFgFspcWOqvNultaajgYkQFsv8+CXaak0gSnTxvYS8fDFIaLfZ7gkr9YV2UCd/OMxQYJW83/fwLu7CrGCD18bp0kvXLoVyohAN9Tje4YApF9h1qZe/xydjvuVn+BkadycYSpBkICzMBElWuU4MwGLXH7Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pv+kPGT/Jmzqr4TLzPAXHp6uYmmXls4E8Q7d8Tt1sjc=;
 b=1dEVMeH2sFAUsoHf+rozMmrEnsKOk8YpQFNwDFRgaSm14Xw8NKQfjwCcJmXU7Hk1awVUHQKO0UZgFXg1IBvCgZCQzE3Gu2rIiV2TqoeRSEYN2DUuEtXJTK6P23eJHvuZm2zWuw5VFn5X2rjwnrmukU3oCRwJJ8/VDarbCeu74aa/sq1IZbmxIrO+o+KJiq7UiEefdCQC6I5zEqesGR2vGKGUiFc/54CRIj9+F5300fBVQaahWWu1v04aKMSsFNK/ZPxSZuNO/pVcjuq4rjWzAdHalYTqRJN12uke0Gr77wBLlWsuxHoEIUKc0SUjyFje0cDgkcFfLXjksEk7M/bG5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <78a7b73a-fefb-6884-90c5-abad2860a521@suse.com>
Date: Thu, 19 Oct 2023 11:35:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 4/4] xen: address violations of MISRA C:2012 Rule 13.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <1e0f12095bcbc82ae3585c9fcf57bec7e324049c.1697638210.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2310181803351.965337@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310181803351.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: c1dfe822-8422-4dd8-5e33-08dbd086b63a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JMIW7+DlHlafd88Lx55P28Oj+hcNrNpye70oR1LRTnmz5jRfIB2e3RTxX7wuH0lU9loePaRO8Z/nC3uG/DxK4NBTX5PPRUrApxuNOtyQSZ2gHbTwxGp7GMIOgTu4/vlTJmZrJsbweSqIS7Derg5mq1eS3U/JvRkdoR000u6c/1/Egvp0rKEFst6g84Xv437BuqlsVTjUWl7iO2XuBX7L7nrPqJkcbYxX9Gxwi227PS3VaJoJfpcMx0DuVXGnmFnj1KDlHfEATrGNJNvlLGtGeFyhQOt4EHG4DACUPgBZoYQTZRrxWMtsCwc30PJVX7nIhwwrP3g3ilSu688Zin0GOJm2ZJkRZKZy9NGhWJ3dvh7lpNghLD0mFBMKNWGZPUe4Cuh2OT0BMqNH3SFOypRCBne6QyT6JHb5Jy9CXvUsHf93KXvCgZHH6UT1sC+cBt5xUkARzpv377XAJouzMDUS+OwE3k0DFH6edme+dvJvTGAp0KHQ56+q4JVtLx7XXGE9LS7/Peln1eZyWv2SpHIR8xXndKXR0JOYzwPjCZDFVtXFOnTM1aO41KeJsTnf5yLfHPkQVv/t3NAhcDJWWm71pSbeUJ+kxJ71UuU2MxyLnzIl1I9ReO5yLdsbvHa0sPg+beuMRdQnXvH2OpY4bTzQ4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(396003)(366004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(83380400001)(31686004)(4326008)(66946007)(41300700001)(110136005)(316002)(8676002)(8936002)(66556008)(5660300002)(54906003)(66476007)(31696002)(478600001)(2906002)(86362001)(6486002)(53546011)(6506007)(38100700002)(36756003)(26005)(2616005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFU5ZU1TU0x0UzJyM3FWTFIzNCsxRTNwQkowdzI5cXJKRlBab3pOam5QaHcx?=
 =?utf-8?B?bEd6SDV5cDRuVi8zMHhXakp0eU85QUZTRVllTEVzUklWUGk1NWt2dWVBdkZE?=
 =?utf-8?B?eWhVdkZycVVEY2hXNWFOTDlROTVaVHlVSFFiWXg5cEtCNlYrT3FoSWdsakl1?=
 =?utf-8?B?ZGc4aHVnck5raDBudWlzVHFhK3FWWnREdU5NRnV4cDBhNVJmWXZ0djZzVE51?=
 =?utf-8?B?OHpxTkNVa0hGT3RvZXhqb0NZejdrUy9Sd3ByNXhMSVQ3LzZWZzdseG5rQjBM?=
 =?utf-8?B?Y2pWb1VrZEpxcm5Xb0t0UXZUVHNqc2w0bnpVZjladkRURFB3L0FQeDZKQkIy?=
 =?utf-8?B?bktXOUpyc0ZyaG02cVNvK0lOakpHSVpMaUhtYm90VWVHbDlaS2JEVDFjM1lz?=
 =?utf-8?B?OU5OdFBJeDRVRGowa3RhQm5PdHhSdkpad0kwQm9hMm9DOHliN21RU3Qzek9x?=
 =?utf-8?B?LzVsMFBzREtkU1lOTVhPNTJPdEJtWldSbHFKR1EyK2lXTy9VYVNiczJlR1BQ?=
 =?utf-8?B?WTJUS3I2MlhRWlJNOUhGRUVvVi9CZWQ3NWRldHZwM3l3b0hwd1lsUFRzNEFr?=
 =?utf-8?B?N1ZidVlPNmdwRFd4alR3WHRiZ0FhUG83WEU0ZE9NSXAvdERRM0RIMlI3YU1l?=
 =?utf-8?B?dERQeEFTRzRxU3V5b0hOMGE1Ukpqb0t5QXg2aGRxcTdhZG0weDI4UXFwYzMz?=
 =?utf-8?B?dlJnNDhPalo0S0hBTHNxT01WSWcvN2piaXF3QUZJVnUzR3BIaHBQZVlpYmNQ?=
 =?utf-8?B?aUFHOEV4Zk0rSW12S3duV3U0UHdhVC9PamdsSEY2ZE1XZEFBdWlGMXBOYVNL?=
 =?utf-8?B?RE4vcTFYeXdCWVc2TVM2RFdFVUI0aGN1Q05iUndtb085RCtXR1RNZDZqeTYw?=
 =?utf-8?B?blk5ZW1pZDVqNURaQlhVUG8rYmRJUzYxTG0zdExBeUY5SkdpdWQ1ZjA5Qm8z?=
 =?utf-8?B?Y3ZNTUdzRC9ucDhsR0MyTXVXRkNVdFhsWjZnTk5BS3pIS3pFR0ZmRjF4aVVF?=
 =?utf-8?B?aWV0bGs1cVg4UzMwbytXZTYrellRUDlTSC95TFcwTXdZWmJRTXk1OStKcjBu?=
 =?utf-8?B?Tm5BRkxNSm9WM3Jhd3pQWmM1YXpPK0dScnh1a2lsQ0VOcUlxb2hTdlUvT1B0?=
 =?utf-8?B?NUNVWkFsZnI4cDFKbS9BbGpTS2lQY2lqQUpmMXdhMVVEU0k3SDhJWSttWnVm?=
 =?utf-8?B?ZUlQTlZ4MlBFMzJMcEd5Q1NDQjhXNTFIRkZudUhRN2JYU2tjcFZxL1U3NzBt?=
 =?utf-8?B?R1VqelJsWkhvZE5qT0ZobUUya082WE44RkowdkhoWGJHRHhDdUxXNEl6ZWNX?=
 =?utf-8?B?bnFob0twbXN1TzlqNk5PU0wwUGIzdjBTRWRaRUxka3FJSkxGTmdjVkU0aHJV?=
 =?utf-8?B?cnM2U2cxZ3hKbDVWL3ZKUVMyYWpieGdIRkNVMWJuM0Y1QWlRNmFSMXlXS296?=
 =?utf-8?B?aW0zbHV0Uzc2V2dOeDhLVWVYZWlDaFlxOG5hK09XeGE4ZFl6cnQ3Z0pEbW45?=
 =?utf-8?B?ZURBeWxGaEsxb2pJVzVxNDJjZTcwaGdidUJtNWcrV2JlS2R5WUtMYmFjbi93?=
 =?utf-8?B?aGVtOHpKcHlQMXB1REdSVHo2RnhCKzJ0ZkhpMXdiNVNoRVBTbDZFNDgySGVz?=
 =?utf-8?B?MkdsclEwdCtCVzZRV1M4NmorSlRsbXF0ODFIWUh3Nk9IUHpWQUhoZUFseGF0?=
 =?utf-8?B?bnZxZWsyVWo0WkZQMjgydEcwS3hOSlI4UmZGK1FoYlBnYWpQc0xZWnIzaitp?=
 =?utf-8?B?VWYzVkFWSGQwL3N5VVRDQ1VaU25kUzRIZ2NpM2x2K2ZQc2dVWnRORFZKdEw1?=
 =?utf-8?B?Mlo1V09kUSs4Mm8xaTdRV0JLTlZOeGJ6Z3FYem1IRHNDMlpnUGZsZng1RnVm?=
 =?utf-8?B?MTlRdDdENGttSXhkK0JLWTJzTmk5cWN5dmlwdnZOVjB4UEJBN0lyY2NURmlT?=
 =?utf-8?B?UE5QV3k5WHhwMUd5VFhGNEo0RXpyc2IzcWg3YUsvbkZYZnFOYS90RzcxZUdp?=
 =?utf-8?B?aE1ua0VLRFE0ZEcyUkN1STZuUDhWTlF4TXNYV05mOHk5cWdNcFFQcFByZlFa?=
 =?utf-8?B?eXVPOHZqam8welROTno3QXFMWlBwUzdBQncxblJnalpkL0x1bTRZOHRUQTJY?=
 =?utf-8?Q?7KqPSzEQIfLn1+ukBA7yv0gaP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1dfe822-8422-4dd8-5e33-08dbd086b63a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:35:20.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 008aM4x2Qrb8TAq0OyeIgjJfZ96xlLs6r4kdlzA/Uj6D4AGrJ3V8sVJNWJpx7Cer2U8GIC2+F6Q9xqy58vvyJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9506

On 19.10.2023 03:06, Stefano Stabellini wrote:
> On Wed, 18 Oct 2023, Simone Ballarin wrote:
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -1504,6 +1504,8 @@ long vcpu_yield(void)
>>  {
>>      struct vcpu * v=current;
>>      spinlock_t *lock;
>> +    domid_t domain_id;
>> +    int vcpu_id;
>>  
>>      rcu_read_lock(&sched_res_rculock);
>>  
>> @@ -1515,7 +1517,9 @@ long vcpu_yield(void)
>>  
>>      SCHED_STAT_CRANK(vcpu_yield);
>>  
>> -    TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
>> +    domain_id = current->domain->domain_id;
>> +    vcpu_id = current->vcpu_id;
>> +    TRACE_2D(TRC_SCHED_YIELD, domain_id, vcpu_id);
> 
> Also here it looks like accessing the current pointer is considered a
> side effect. Why? This is a just a global variable that is only accessed
> for reading.

Not exactly. It's a per-CPU variable access on Arm, but involves a
function call on x86. Still that function call has no other side
effects, but I guess Misra wouldn't honor this.

I'm afraid though that the suggested change violates rule 2.2, as
the two new assignments are dead code when !CONFIG_TRACEBUFFER.

Jan

