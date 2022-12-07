Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B66B06456BA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 10:41:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456101.713805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2qvR-0004eW-I0; Wed, 07 Dec 2022 09:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456101.713805; Wed, 07 Dec 2022 09:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2qvR-0004cV-F1; Wed, 07 Dec 2022 09:41:13 +0000
Received: by outflank-mailman (input) for mailman id 456101;
 Wed, 07 Dec 2022 09:41:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2qvP-0004cN-KN
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 09:41:11 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20612.outbound.protection.outlook.com
 [2a01:111:f400:fe16::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47e99c32-7613-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 10:41:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9375.eurprd04.prod.outlook.com (2603:10a6:102:2b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 09:41:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 09:41:08 +0000
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
X-Inumbo-ID: 47e99c32-7613-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdKr9S46yXlcswAuNviYRmf9P7AjjywmLs8o+kVptuoBdMWvvVwlM6BCvxgzHwCovUrR1fXQmhGqIcEHCHLOexHtplE0ouymJDvDid09LLq23I0IkMWs516cAYu0wsKSRQB6sO1DKoA/ycLcv5SR0Uk+CpPoip4X3O8zE0bsE6SdHf7gqPHtpbhvxTtN4GcSYizJJSj0wUbZWhCHUTDRQOs5YLObDwoifcOTpZXdwuQIODveNvbwJaZPTnUBqGXqBS2ar0wU79fn2rUE+c4V/SG7srismh5L+0aY5Ppqrivi6ZLECOrkZOA8KFQx13D0z7y5grHIoTRdW0QG8KOIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKSEHUhX2jtai0/iJM5juOrzpSze192SuhzIki+6c6Q=;
 b=Riync7m2t/Gnk/pEJqPj6MfcoP7mpmlC1FNt2AkySXwinXX7oSs2vHh6y2VzvnDyO/6dQ6U48I4SMfZ+J7sv2Jv+QZgPsG8rWY9kH/SF/6fODCuMW23PRb8oPQNc7NzanUovx93xi7cvtly8T9DXelvn0xzeTvNA5zyKZxta5aeY2npE0etLn0mllkPXsjeUVjIPRCfHArTxSECSFrWYbCfZ2nOtqywePqECqZl75dwgmlpL+zk2Cmj67yK1BFt0oNnei37Ena8VQyocxgNBULFeYRGSUU+Jbu3nnOBHRps+tDTGzCOwzw5CsWGO0A8nT+HWRpXYFbFn/g5d+8VrVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKSEHUhX2jtai0/iJM5juOrzpSze192SuhzIki+6c6Q=;
 b=ShmpZ8BJVp+0mEat31y1vj02d9Zb8rzEQBefOaxw0CQJvliSQheJErfagqS7skhJUNZmG26bhmwuxcfu+2Sq7wX0BVOlLJYwaIGKWaTN9YaxY+/dt52GaeepEeWnKtzky9QsC3xeVftf36VQb9j0C2RCvrU5U+1K6yyoUn5wm/jboDYwi00W54e0dgUPEhaCNIcf7JwwtuhXCYXPGoMGpuiRUIuLwcCZ4yka7k4QHiKBuDKPFfyOXAauzA7rc65cyUKHQng0dOkdcONJWvFFNAD8fWrqq6/2dXYRCZotmFfk3B9FNfAc5PA7LGhPs50QuC1jhX9f77XbXnoJ2/1lBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <775a5d15-b3f1-ff82-0970-9ecfe7986f90@suse.com>
Date: Wed, 7 Dec 2022 10:41:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 7/8] x86/mm: make code robust to future PAT changes
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <33f3896ba4cdf50ceb0377f071682ac5d3f576c4.1670300446.git.demi@invisiblethingslab.com>
 <9bb20bca-34af-bff6-b9f0-0c2ce38d2a46@citrix.com>
 <Y4+CKb0slxo9hJW3@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y4+CKb0slxo9hJW3@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9375:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a423e2-8ee9-4ee4-9e1d-08dad8372b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dlJMgCW8jjzOaLXh8+gKx3FXoBvZScItXXOXQ98AnRjNpWEdzd96SuQkXkkiZeXuREYLQltrmFI+3ruKWu5CWXwBMT0qQxBtmE6HCmtOCQ/fQ2Z0/VTyFNQg9UXgFd73STh9jEdt8ZLCn7ESRF5ft9LbxCvcZ0RUSVExej+OYZvfHzEu9BgFhW94gE7QhY8IALquUkU2epjJoMHnX/2tJHvqsm2OMBYyOuJOojtPHmzXASlOYLRmbumgNzjPD42hGS4pEnldhnCDhsYwRR1VPFpT763Ag2OdBCSxFwSNVcZL6GUAovxVSoRcWiaJP/Yi2Fd9Usv8QQ/NcPbgCe17m/a1TZIGi0ZqxVcIOGjiSOD9rZnyahUB0AMxlPTDu7cPBBxQwwIRDjTx9sYQUKC0UE23ViCzD9GjtQBHdS3zJ2QkxQBbK42OjDN98bh7k+jLxgh2YnwwRiz11yUm5hUFUvXJ70AKbPuOReDJr/+B8fVXQvEFWlzosozKhw7kQRp6RtOj5ZodtAwWf94HxTzdjiDwQlnkM9GYU9OC/vDi6ptebIZCV70nqPoNWN5bDt/+JyCSn879CYtPbrg/DCH2iFzzBJNDQZq3MQ1ELohvkkO0yDaWeIEE3Gc7nGU8lhj/DpAQ1vl31cDga08ppuY+8vECp1ck+VpRddO8TWMDTObWVWxxNHn1oek84c74QZdwIpVY2KQV697Wuv9DGDSad9Il3X5ln/DJHSTyPMcT6bE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199015)(83380400001)(6486002)(5660300002)(8936002)(31696002)(86362001)(2906002)(4326008)(41300700001)(186003)(26005)(53546011)(6506007)(478600001)(6512007)(66946007)(2616005)(8676002)(66556008)(6916009)(54906003)(66476007)(316002)(38100700002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzlxL3dqdW1SWngzYlV0WTBhUzYxR1hnSjZiYVZSL29UMUZqWVFGU3puZm1k?=
 =?utf-8?B?NzRYQXRXY2NHbm1RdEd0RVNQRU5vbzU2bDNTOUkwNVAwK2NFeGQ5ZDc1Z1d5?=
 =?utf-8?B?VWxseXg0RHFqdGc4WWsreXBiOXZCOGVGOUJtd3dQMTFtZnZVRlZDL3VoNGNx?=
 =?utf-8?B?R241M3Y0N0FNVUNNK0VKS3JzNGk1UEVBUENyMGVSTnBIQjRiWkp2eHNSWUlN?=
 =?utf-8?B?cFZHeXgzWkdXTmlOc0tnUXlJU1Zid1ZwWVk2d0tFVTIxQitodUh2cmJSVVpL?=
 =?utf-8?B?N2tCUkszUkN4SzRweFZHSWY2L3NvbnFRMG9CVzhaVEptT0ZWYk9qUG5WYVRV?=
 =?utf-8?B?Vmp1cWJHN3lodk5kNlhhWXN2eVBMZTNMWGZ0NVN2NHJPZHEzaWVTVzlFMEky?=
 =?utf-8?B?MjRKOFhsV3FBQW4zelk0WENzMHdFSU8vT1VieU02Qnc0MzhZUWIxanlCbkV5?=
 =?utf-8?B?bnBzbTAyUFhDZGQwcC9mMlN0WExTYUd2cE9pWElMVXdhdUhzcUpNdDk4L3Q2?=
 =?utf-8?B?QitFenJUZWc2MGdOZ1NBd1ZNa2lkMEFDMFNXakl2VHNkOWNvMzB3SDZWelFz?=
 =?utf-8?B?NmxQYUZQbHRWVlNUVzNtWjY5U2hEL3M4WXF4MC82d21qUFdoWXlqVjV4Um0y?=
 =?utf-8?B?ZUZEQUF2a3FNWE1QaTd6YnViTFYwY0d2OFNWaTV1SEZvaU5vdDBFd0psYkJE?=
 =?utf-8?B?MkNMR2x0ZkxTeVVlTEVZdVpLUzNIRWQwN243ekt3MzdHcE0ydUp6UE9hTmZt?=
 =?utf-8?B?YW1aOWdDZUcvODAxTjZhbHF5UGVJaXZLVWRBY1BCMStMdmtUamRUZlF0cTNq?=
 =?utf-8?B?azhWa1pPakhZd1ZVQ2N3MzBpMm9tZGlKY21GaFNYcStNRUVHNlNBd2ZEci9j?=
 =?utf-8?B?VHJlMmlkYThvajlPcHNkWERjUi9BQ2MzVzA4R2U4UUNZT3BwMWd3WkM2azFx?=
 =?utf-8?B?ZndkVGRkdC9HZkdWN0pvb3BrUzVGTHgxNEdNMGxEelNnY1poRk1rbndvUGRi?=
 =?utf-8?B?Nk12QlNIWmhlMXFzMHFqVXQxY2h4R2dRQ1lhazlpR2tlM25SNFE0QXpQVmFl?=
 =?utf-8?B?c2Vod2VVYjhScS9aYkkyeUw1d3ZvSGs3OENzL2lZUjEyOXlhRGhqQzJ5ZTRP?=
 =?utf-8?B?VjVQM0ZWaHloeGNEejVYU3p4dkZVN0FLNXhkR1c5N2R3SHY4Wmlrc3JZWVpL?=
 =?utf-8?B?eEdSYmVPalZ2TytHNmlQNDhDVDhvcHFWRXQ5NEF0cVRPcWx1UTBhb3lXdUxC?=
 =?utf-8?B?ZHgrb01STUlOM1B5Nk1maDNGaDFnNEsvTm9HV1NNR01TUW1wRUU5K1BRaTMz?=
 =?utf-8?B?YVNoSmNtTEFmV0daNnpWbThvWHFUM2RQUWtDbmJERG1hKzJOZi9mMHBXOHVB?=
 =?utf-8?B?NHk2dlBNY0dPRklGdTBWTFZhSGFGTnhUQlhRdEFsNjRjUVQrVVoyMEg2TzJz?=
 =?utf-8?B?bXEzdTdXKzRWVWU3Qk1RNjVRM2pMci9oWVdZc1lNR1U5WDJvRWkwZ0twQS9O?=
 =?utf-8?B?aFNDRVI4YUlHSFQzSVpyVlJCVy9USlNZczZvdFdyVXdDbEFYVzM2enNJMGJ5?=
 =?utf-8?B?VXFTSEhaTWVHOWFmdGI2ZTlOL21DVkNjNE5hc0xEc0tHQUJuQnhjZExpbnBH?=
 =?utf-8?B?TnVLNEh4bHB1dWdBdVlhMGdaRXE3aEh6S0tNRUd5WHF3b0RIa1JOdGlZRlA2?=
 =?utf-8?B?M1BZd005TkJGVjdaMGlKeXViM3g5a1QyQWYvNnd4NTFNbHdnUEFRb3EvZFFG?=
 =?utf-8?B?cHdGNFlWV242Y0dIcWtFc1B6UGFhOWc5UllpSHk3LytMQmpPRXV4ZFVXU3M0?=
 =?utf-8?B?Mi83SzhubURJaGpUSVUwRmhQMlZxQ1U0WUtCNkxmSVBiTU1xbXJvMk9sNlZS?=
 =?utf-8?B?RDJEZkFIbUR0WGIrdkU5am9RSEtDVkR4WkNNb0o0RTNIWDFzajN1dTVKVnk0?=
 =?utf-8?B?TFkwVVBkOFMzLzVqMHY0L1dOb1RxT1VtN3RLeUY2RnZsMGRyMWVTYU5IQlBn?=
 =?utf-8?B?Tll2bFI2MG9YaVNMSk5rNWsyZFZlNHpQc1JZYXpnbkMyT240aFJxOG1obWVx?=
 =?utf-8?B?b2tTa1N3SFRjMTV5cGhJRmJTK0NucEZmeVQ1Z0ZvRU9STGdXUVYwbFp2VnJv?=
 =?utf-8?Q?bM5lY2MwJnRYMqzjhbYM8hmoo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a423e2-8ee9-4ee4-9e1d-08dad8372b18
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 09:41:08.6055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRppbEpMEeFmVUqDidLyiUJO64orK+2nTXTZvnu+g8SNZxWNYqst00CCJLXeUUQtIVqkjds/ZoDZlfaGK/wWDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9375

On 06.12.2022 18:55, Demi Marie Obenour wrote:
> On Tue, Dec 06, 2022 at 12:06:24PM +0000, Andrew Cooper wrote:
>> On 06/12/2022 04:33, Demi Marie Obenour wrote:
>>> @@ -961,13 +1000,24 @@ get_page_from_l1e(
>>>  
>>>          switch ( l1f & PAGE_CACHE_ATTRS )
>>>          {
>>> -        case _PAGE_WB:
>>> +        default:
>>> +#ifndef NDEBUG
>>> +            printk(XENLOG_G_WARNING
>>> +                   "d%d: Guest tried to use bad cachability attribute %u for MFN %lx\n",
>>> +                   l1e_owner->domain_id, l1f & PAGE_CACHE_ATTRS, mfn);
>>
>> %pd.  You absolutely want to convert the PTE bits to a PAT value before
>> priniting (decimal on a PTE value is useless), and %PRI_mfn.
> 
> I’ll have to look at the rest of the Xen tree to see how to use this.
> 
>>> +            pv_inject_hw_exception(TRAP_gp_fault, 0);
>>
>> As I said on IRC, we do want this, but I'm not certain if we can get
>> away with just enabling it in debug builds.  _PAGE_GNTTAB was ok because
>> it has always been like that, but there's a non-trivial chance that
>> there are existing dom0 kernels which violate this constraint.
> 
> I chose this approach because it is very simple to implement.  Anything
> more complex ought to be in a separate patch, IMO.
> 
>>> +            return -EINVAL;
>>> +#endif

As to "complex": Just the "return -EINVAL" would be yet less complex.
Irrespective of the remark my understanding of Andrew's response is that
the concern extends to the error return as well.

Jan

