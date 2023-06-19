Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5FD734CBF
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 09:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550825.860003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB9il-0002u1-Sy; Mon, 19 Jun 2023 07:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550825.860003; Mon, 19 Jun 2023 07:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB9il-0002sM-Q9; Mon, 19 Jun 2023 07:54:43 +0000
Received: by outflank-mailman (input) for mailman id 550825;
 Mon, 19 Jun 2023 07:54:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qB9ij-0002sE-Us
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 07:54:41 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 897d67f7-0e76-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 09:54:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8031.eurprd04.prod.outlook.com (2603:10a6:102:bb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 07:54:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 07:54:33 +0000
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
X-Inumbo-ID: 897d67f7-0e76-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaQQKWoL1B/PDxzGOHXgYH/F54Fu1EJ04pQpkJBlBKuY2jrRIarlw1jOKpZ+VqYj27tyYSBE29v9ddnLP8IQNmP9YL1trLCBcQzqiST5uBjrn9SetTS7Ae3cOWKPhL5JZcF+9U5oRbE55PYKOnO99+XGDEuUm6meSB6v+jViM83YK3a2fvUqQjmPbnIev36Mb9ct3tiruPUTFnVHbBcXsWsFxL0aS+elHqj8KKYyqL5SOzkyLaMcf5takl5MohRKTQZtO3hwXeytzWH7WfdNvh+UXPN4HZiwUWDOS3hIxcuIvg6/Q2CbL16i9Y4LPunb3PyVgjeUYeKg/+ElFuK9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nv6eeySf1eJE47qwUYLN0zpNzhCE+Fc+xp/3uSNMKnQ=;
 b=GOejnxFGYa43IGT2ISKHxif1lnD+397Dj//L5TIqtGE9P+Uo7wPaDrI23LVMTXDZxTtYzplWL/Gz7jJgI0AD6swgnRYVuSzodRErzyPF3Z0XL+Q3Y7s/y/7r9F5VNRCo6tmXT8MNXrm+PlMbeL53hLC1l2UcfWYmWq92xddm3kE8xQv/3ecAYsbVdke3+2gT0U3fQn4RDDpLIr6MLOJdAHTTXIeMBRCsQm2usJim3q1tkcOaV0sduOUT+FDH3uDCTvxTmWB1AzqB1f+Tv9FvwhWG51MAlPCpSXBbB010O2TqeoMh0jzPMQeq7J8DML7cmBjSoPc9Z4rlDAhcPRvNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nv6eeySf1eJE47qwUYLN0zpNzhCE+Fc+xp/3uSNMKnQ=;
 b=Xy+Kb2XSJclYuOsLvGcUhU6B+kwN7CGZuj/R3z+geP+m+qx+cZaDqqyTqzdvtNiL/RmOkWmJmRu1W5fNdpoGKSC9BG20hk3CtfjwFfmZccnX2r0BlhsNtGCoQrawRRNFh469ChjSlTEgctJpWRudQ1rFNvv6OFMCKoNgddIXxJEeLo/vneq1j+H/HPEE4XE1gCFE1hupJdK+Wo3KuFnG6otH1JM+qOOOEMgf4Uae+O36INoB47S2ILTeAKUcpCajYeAdHmQ8iY1Jb88FDWf3MB2ODyYa+EnaAkRPRsYJC4/xZxBqEK4zVp4L6j7JN9Z9PO9MMDxMm9jlNaa7/hTeQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90eec636-7ae5-8e1b-1561-0de62e0bc799@suse.com>
Date: Mon, 19 Jun 2023 09:54:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <db6e7432f92657c1386a475895c3b334e1c53693.1686839154.git.roberto.bagnara@bugseng.com>
 <alpine.DEB.2.22.394.2306151444310.897208@ubuntu-linux-20-04-desktop>
 <3499c107-ea0d-3a74-4278-86879a9d80e7@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3499c107-ea0d-3a74-4278-86879a9d80e7@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0de4dd-f718-4bf1-95a2-08db709a6b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AKJDHXdE0VTn8YqDv6uLP0wHYj+kbsyyVmQMDpGxJlFc8dEDHGj3dSJ3JF+Y1CITFHL8Go7OYFVqoFjAhEKobFBP/UYdUeAuSO5/d0j2+5vyslXPmwVB+vYzNKYZDW3EhnXhB1TyoOIgtXrHKTyDdwO3unHzLtH03LgnP3m9aARRlkKtEYrlypvWqKGxa4DXCYWnsgT05sXgxEvmRc1EpYmvwjQRT7KtG+01HbQJKmbKWQ2hCQIV6fCm03RQzvQgElLym/AIEr/Z9k1M0qB4Ty4/0ri5yUjaRxmXrqyVVmNOyNI3dUfyiR/OLBFyMLI/9DExIXrcwzWxWQM+I6VnxDW3qGwjgogAxmdSJSl3cQZHuYSeaYH8tULAa+90DdIsjVQARL8CasoqSH7bnjsg/rMjCLco6ufg2eNgynW5ial3aSOsshtOrd6qa6cRm3NcC4/aU4Q6DgGigsggyiyh4H9TxAgkX1n49ghbTX3LUw0+ev0wo/PUgcNnz3Fk+IRAj1C5ims3Dm2h6vfactlIBnhIPbquWlMk7l6c3hH4ax3qfA6qFi4+JefORl4NK2S41tOQ58tSr4u7eRj+BIi3cEuLXCCtSDzrqVtQMserR8BYjn5EbYqg5dUoGeBZZdTp8vZL0rGKDWA9vIdpt28wsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(2616005)(83380400001)(4326008)(186003)(6512007)(26005)(31686004)(38100700002)(36756003)(6486002)(6506007)(53546011)(86362001)(2906002)(31696002)(478600001)(8936002)(8676002)(41300700001)(5660300002)(54906003)(316002)(66946007)(6916009)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3pNSW93SGdOall5ekV1dlY3ZGMrRlFkRTRaak51UUxIN3FFOXZBbXRjYUhH?=
 =?utf-8?B?cUF5SzhIc2EzenVCK3hFci9SMy9uTi91K0hHSTczSEM4Q0dCa3l2RXpya2t0?=
 =?utf-8?B?S013RDBRa2txc1hwbjBzWTdoWHErRkZscWZMOUlpS1RNYTJqTUlqK2tzSDU3?=
 =?utf-8?B?aUxaTXkxVGpOZUpEMmkzUGlrWWxnZTJsaXhLNGt4Vk92WHRDVENPemNrcXYx?=
 =?utf-8?B?WTJzRmxLeXUvMk5vOGdDUkt6MytWdnNvbyt4K3pvbC80NnZDZjZKalpibEF5?=
 =?utf-8?B?dlN4Y3NGMnJjQ3pXenhaeWZnaXh6L1Bzb0txbkdETklzV0FEVUtPbkVFVER4?=
 =?utf-8?B?UHVEMHVFRXVtMGpPZU9tY1o1anpodjE0ejNpd0hnYkkzdlF4eEVNMHZDdWRZ?=
 =?utf-8?B?TzVzTGdQQXJyUWtGWEVRNDllSW9ReE5qaXgvdm8vZDhDT0dYMmIxS2RKVGJp?=
 =?utf-8?B?eVFvekFWdiszVWFLUmJlVzN3V0dYRjhOaWgwZGRkc3VnY1RhTmxhNWFoSVdO?=
 =?utf-8?B?TXZtQ0F0dzNXOWRTdW8yQ29tS1gwcmk4cng2dXI0N25hQmF3aXBCUjNvWGVL?=
 =?utf-8?B?L1gvaDBxRDlERDhHb1hSbEZvSjh6d1VYeDdGOVRRclJhQk1CQmI5SGJseXBz?=
 =?utf-8?B?R2thcnF0ckFicTdjNkpveUc1K1hCaDhXek90VzNYTnBIcEs0RFlsL3Fpbzc4?=
 =?utf-8?B?RC9zUUZXSG0xQ0lxaERyTzhKQW93ZWE4cjhxdUVBZm1Cc21BRFNBQ2VEU2lx?=
 =?utf-8?B?MDdZeXdFVTlEVithY2hnMzlvVVROMkpxN252SXhQd3FLOWhnZG9EREhDYVI3?=
 =?utf-8?B?WXRNUlJNWUJjUDJZckJUbG1vS3VJditsdDd5QUIyZnZjdW55TWtsODl6RWU1?=
 =?utf-8?B?MVgyNkYyaGtxSkJWZm1UdFFOYlR3dEpCc2ZMVm95ZUNrdk0wc0NjaitGbHVL?=
 =?utf-8?B?MWMxUE44WFlCdkoxaENSaFRNdjh3RllpNm54UWNTbzFwZURjYTAycndVeXVi?=
 =?utf-8?B?Ykl2eHJMbTBmVTV2cUZDb3VWa3g3VjZZL2V2T2xxaFlLRXJTVDdXWWRmbUM0?=
 =?utf-8?B?by9ERlcxaGlvWmdrQWhKYkNrVE5RMGNQc1pYQXpGNzFNZTc5SWF1RUtKZU8r?=
 =?utf-8?B?UXpVL01WNXlVMndPSm5pcS9JeEtXZnpoTkIwZXBBSDl5Yjg5QlJKdHluNUY1?=
 =?utf-8?B?RE10UTRIZkhmUDdRbHk0Q3lJRVZyclhTdDNuU1YzZm81aVUxc2h4eUNyM0pQ?=
 =?utf-8?B?TEM5bnplZG9TcWFhcFBWZ1NMczd1UFZ0azJXelJlaTVTa2pGUXhNVkM1TTFY?=
 =?utf-8?B?b016WDJVM1g0RjdtWGszb1JNM2IyUkFROVcrekNmVUdCWHordHl4OFdMY3l6?=
 =?utf-8?B?aHF5NFRhQjU5NjJzb1pFbkRtcDZCVFVLdlB2OGN2RWNER0xjSWxsRCtYaEZP?=
 =?utf-8?B?ZzBVLzRRSW9vK1hkZDEyTkdwc2VkamMwR2w5eTVGeFRWMUR1UnJWMGc4UWda?=
 =?utf-8?B?dUR5ZlhGMEhrV1FjQ3Nub25wL09BVGNmc2FzMyttMHUvcHlqVHhqeWFSNDA1?=
 =?utf-8?B?VGU4MDA2RzdRNEZCRStrVjFnbzJDbTlZZFdEUnpjQm5XZFVxTGJpaC9WWVRl?=
 =?utf-8?B?aW9jUHYxbnlhNU9HRlpCUEE1dkhMRkhaK0txSVQzZnYxbHRCODh5cWcvUTVO?=
 =?utf-8?B?b0t4bFM5SlpTd3hwekwwOTVOQ0lQZWJpWVV2cHBhTVNJWGh1SnJRcE9ib1dw?=
 =?utf-8?B?TFUzSFk2WDhwVFBrTjBkTkJsRXcybEhlN0Y1cjdCME45SVBYa0FGU0R3NWdr?=
 =?utf-8?B?Vk4vd21BWUhRekk5WEMxWlN6TFJmUUVjOW02T0FKYnVxa1dzcGkzQ3BwajZy?=
 =?utf-8?B?cDVlS2ZRN1pudk1GNUdqSkg0K3dVYUZ5QWsyMGVuT1R3M0V4VklMMnJGQTg3?=
 =?utf-8?B?OXY5bE1HbGc0QkpZRFBZS3F1WnJXZWRYT0JUOEJkSGFYb0hhZWZKbE85WTN1?=
 =?utf-8?B?cTUzdkg1cnV1Q3hkRHl5KzYrcUQvWUd3WnFLTVAvY2xiSnJTTlJvWG1VR0wv?=
 =?utf-8?B?cU5QeUdNOElOY3JlTyt2MmppbWxBNnBLS0NUSzJJMjBuMmdtY0lJWHFId1pu?=
 =?utf-8?Q?LoTmCYhu/5MMXU/n0vWMwSsRQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0de4dd-f718-4bf1-95a2-08db709a6b3e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 07:54:33.0947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ig76IPWirpMayK0c/WGZS7abfFNHPBxiQYpoWos7Xuiaxm16ccmwM3GITeYQvG6VS8TSp/1ZQK7O1rWA9XpIag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8031

On 16.06.2023 17:54, Roberto Bagnara wrote:
> On 16/06/23 01:26, Stefano Stabellini wrote:
>> On Thu, 15 Jun 2023, Roberto Bagnara wrote:
>>> +          see the documentation for -Wreturn-type in Section "3.8 Options to Request or Suppress Warnings" of GCC_MANUAL.
>>> +       use of GNU statement expression extension from macro expansion:
>>> +          see Section "6.1 Statements and Declarations in Expressions" of GCC_MANUAL.
>>> +       invalid application of sizeof to a void type:
>>> +          see Section "6.24 Arithmetic on void- and Function-Pointers" of GCC_MANUAL.
>>> +       redeclaration of already-defined enum is a GNU extension:
>>> +          see Section "6.49 Incomplete enum Types" of GCC_MANUAL.
>>> +       static function is used in an inline function with external linkage:
>>> +          non-documented GCC extension.
>>
>> I am not sure if I follow about this one. Did you mean "static is used
>> in an inline function with external linkage" ?
> 
> An inline function with external linkage can be inlined everywhere.
> If that calls a static functions, which is not available everywhere,
> the behavior is not defined.

I guess I could do with an example where this leads to UB. What I'd expect
is that it leads to a compilation error.

>>> +   * - Unspecified escape sequence is encountered in a character constant or a string literal token
>>> +     - X86_64
>>> +     - \\m:
>>> +          non-documented GCC extension.
>>
>> Are you saying that we are using \m and \m is not allowed by the C
>> standard?
> 
> The C standard does not specify that escape sequence, so what is
> done with it, in particular by the preprocessor, is not specified.

Isn't it rather that gcc doesn't follow the spec to the word here?
As per what preprocessing-token can be, anything that isn't (among
other things) a string-literal or a character-constants falls under
"each non-white-space character that cannot be one of the above".
Hence since "\mode" doesn't form a valid string literal, it would
need to become (using '' notation for separation purposes, not to
indicate character constants) '"' '\' 'mode'. Which of course would
break what subsequently are string literals, as the supposedly
closing double-quote would now be an opening one. Which in turn is
presumably the reason why gcc (and probably other compilers as well)
behaves the way it does.

Jan

