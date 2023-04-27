Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 619B46F01FC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 09:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526895.818954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prwIt-0003aR-GU; Thu, 27 Apr 2023 07:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526895.818954; Thu, 27 Apr 2023 07:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prwIt-0003Yj-De; Thu, 27 Apr 2023 07:44:35 +0000
Received: by outflank-mailman (input) for mailman id 526895;
 Thu, 27 Apr 2023 07:44:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kqME=AS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prwIr-0003Yd-8b
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 07:44:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58721d90-e4cf-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 09:44:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 07:44:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 07:44:29 +0000
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
X-Inumbo-ID: 58721d90-e4cf-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgzDE6XyINxQ0eiLh2h7OQUzeVPr1ThWkiT/Na8Vn6QQ7AoR+D2JH0+nFTPcsS4XbXJzhz4bWELADafV3Km0zvn6i1WeoIz96tFAykhqbmtSHlo9GdRhaDkseyMI5he+AoPq2+3uOT7EFqkyU0u7QoRbEX2C83r30PRaAoX9A9tcechFSGtl9dZTRPfRhfw7Noua+shoNOV3PappJHxHCTZ9k9ecnvb82spqmus/vPcxLej2OSH9hkZxTIVA/AY9XoXMB3+rT29VBxkqTGPKd0SCTnjmDriFzYp7xLCG6eIhq8ug0dXOu4oq1K46fU/f0HZuYThZ952W61JNux033Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Il2FPybCc8VxAutI5Akbi8VvA9CAHwBY/A8KbfUNolg=;
 b=Rdsj8Y7xttL2j6KCNpttVzSZvmXIBrWWPnbDFFmYbtAOq5fY0qNeYEYAqHos1WnD59tKGPTHegt3x3AtwBx47CDeewXs+i5UEh4SX1DUgmXNzV1cD1jCqrrAUSpt4QZBjnJfw/5xRhexz1qe4uWiDH8v5cTmKUOoqYUz4Sq5+PXR4vFps4MR76xN9l83uvy2dqhkbd5MJzBkeNPkIXdJSfE1FouIMwRywPr8tKubsyOpWBizW7U3F0E1XcsWKsaZzkLg9VvqC/mwwCfIpght5detj4u6pvFDNaIbewMSNNruV/4GdeQ3EHQRylDbIs7bHs9AuMjH/Fq6zTxHsYkBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Il2FPybCc8VxAutI5Akbi8VvA9CAHwBY/A8KbfUNolg=;
 b=m6gAFnl0SIzFAWVAuBsHTR1YKtfM8CVJBSYR9ZQZJWA0l96wY0yRs7AH13EauNfPFzkONF+3Ptd0LjUPRzi+Z6TdnLhXJPCBpe5Sx2uo5ViKjbd5YtOFfUZFAAZLS86ZGgy534wmKq+v2+/hwUWlFhAL30WrU66Ny30e10jU7N8sYYkflrPw09aUeDKuwFBzf7+uyqRueBfFPPosoKA9yyjWBhvugXvZ2PLSNyycLlqXTM1NjS0PfvEqOCxBUzot6XfoCYTSdg8+VzI5N5N7GjLIUEutJmLRqPITrM7k2kohrdvzkHZAs4O34Jem5MSsStQXQKwEh/B+yyLhr/OjvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5cb69afd-044d-deb8-7f81-2f189e4a018b@suse.com>
Date: Thu, 27 Apr 2023 09:44:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] ns16550: enable memory decoding on MMIO-based PCI
 console card
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230425143902.142571-1-marmarek@invisiblethingslab.com>
 <ZEjXNLAVCixClGyl@Air-de-Roger>
 <b41e8eb0-a776-8924-429f-8abe7e70ead7@suse.com> <ZEm3O2PL0NLWqoMk@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZEm3O2PL0NLWqoMk@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: a9142d45-1d5b-4a47-067b-08db46f33b71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	02q/3MxAsLozCX8DZzgY3o0zXIpFNR6AgdlYDRNaiA/2pZ0uLbn5tIvgq0CWOcScWwKR2pF8RxkByx1LZZUXOCYSp6Lo2AdNTwaSakhdklt5kJRmBuN6o1dEa2FJEZqGDBESA2BpYASX0x5j3SBmVUItZW2QXRJr9bYCaMPQNKkOTagrRphL7F+FdETK+LlfmBW4Vh5SrJtuoaXa0/9I1VE/6hc4qbhuNusYfGDEXbMpFSuIK5+ZaDCkxJdVNn7HkTSf9mrovjTgrRYRHr3U5YBOoyq4CJJLNQNg4GJeVsgK72h+d+YumYc8mFfWnZoGr1oF6Uzp4KmMOoZZMoTOiBYdF7b8p4hfW9JUgHNj9vOLWVEBi2mFSI4DtY6RcmAVpaEAd5vfQEPhsfpFqoQ5nd0YgHsAm4pSA5GStGxGZzHxQp8EQqLB3k0S3FBQsat+/ifoEB+VxZJLpnGeYpqcpkqHGRI/m1gmI8t7hXR2JL9zGY7x3b66iU7MerH0LrTYKJ2rzTGO/8WnnzCOXkjZb/Wa4Q0o2HQnxJbth6L6LNizOb1FTz3yc6RosqZeASiIsLGqlGdno915eAF157EAY4k4U7qaliDs+MUe0u1noeBsb25uiKDKFXA08cBVeLx0UxmwC7/SBIVGysar9wjR/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199021)(36756003)(38100700002)(83380400001)(31696002)(66574015)(31686004)(478600001)(54906003)(186003)(6486002)(26005)(41300700001)(53546011)(8936002)(2906002)(6506007)(2616005)(6512007)(316002)(4326008)(86362001)(5660300002)(66476007)(6916009)(66946007)(8676002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGZUeDVKa3JGTllLWkQ5Yk1wQmtLR3ZtQlAvVTc1bGM4SXFVKzBVcndVWENM?=
 =?utf-8?B?USs3VU0vYUNWWm5wWlI5QXdKQXFsbXMzVXF6QVBhMGdvWU5rRUkyNEsxUnBq?=
 =?utf-8?B?VHZrNzJISndjdWFleWwxM0g3dnhEVHFmbTRSaHVIK2ttLzA5STdad09YcXZ2?=
 =?utf-8?B?blVXTTFuQ3laSTJ0WGhWY2lhaFdWR1VoY0paZ3c0NGJqNXlsZ240M0VMZDl6?=
 =?utf-8?B?VFB5RVVocElWNVBvMS90NDhVMHJKMTBzc2xvTHpmZlpiRnlXNms0STV5RUhp?=
 =?utf-8?B?S1BlaldyMmZxME93czhxWXBKeklhcXNFZjNOcmNBWFpGN1dMVXFkSDA0QjIv?=
 =?utf-8?B?V2o0cmRlQWNDVlhLSTF1cnova0RWajVxQkFCS0NVODVaTjd0c2VjenhIbjAv?=
 =?utf-8?B?ZjV5dVN0WCtSbVFRWVJkZEFDTyttTHRmTXNEcDJWdmJBdURXK3ZtcDBRVEcr?=
 =?utf-8?B?RlF1VWRLMGtWWE44U1FXWC9xR2ZCWlhLYm1GUWs3ZEN4bFNuZTJVd0dmVzVl?=
 =?utf-8?B?bEZxc2svWU5NeHROc2V2VG5WSUZCc1NxQzlXRnFrRDFoWk0yekk5U29PWldn?=
 =?utf-8?B?VlZGczR2ajEwYmgxd1RuV09UdFhrRmpQakRCZzVhb2VkMlhQejhSc1dBQjRM?=
 =?utf-8?B?SHgzV1hsYWVtSWR6K1FLVTVCdXEwOFpURXloQWxoK0V6WjlhM2ppVlhTM1Nq?=
 =?utf-8?B?c3lhOHRKTlUwKzh0eFl0bkVva1NlWi9lckNnUWZNZW43b0hPOXNuY3R4ME0w?=
 =?utf-8?B?VllNUnJrcTdHS0pQTTF0YmNkUVltVVlRZW93aVFTcXFGcHJDczQxS2Z6R20z?=
 =?utf-8?B?RWcyeDRNSEtVWENzN1JoNDhxSnhWVXJSckIzemdjMXJkSloyekZVai9QUGpW?=
 =?utf-8?B?WnUydkxKQU02LzY3OW11YzhBdWluYXlTN2t3bng0UkhUZndIWU9iVlFxWkJs?=
 =?utf-8?B?d3pmQkZEazk3QTJVY2VhdWtMeXljNDBpaEtWL1BOUEVXOWNHQ200Um1XNmtG?=
 =?utf-8?B?cVhSaEdBSlMxeVk0T3ZNa1hLbFlhSkI5R3I4VWY2ZkU0cDBVTjQ1L0NockdB?=
 =?utf-8?B?V3ZnMHRLVlBMQWdlUXVrbVJHLzEzVk5xdi9PZEFxMUVCYU0wRGttckJPNXhH?=
 =?utf-8?B?bGRUL0ZwbmltVXlmUFQvajBCSktZZFpIU0xxSHBLVGFHN3FvQU9zbHBweGQ0?=
 =?utf-8?B?SUFPYWg3TUhFOXdnR0JZV3hWa0dhYmFzNytzeHNlUytKSllEVi9MWVVtRHBp?=
 =?utf-8?B?a2hORkc4Z1VqOEpTK0xoRDU4VVJkYVFRTGJMaENlNHVlbytNaHJTRVo4K09r?=
 =?utf-8?B?QWR3SkVNTGN5OXYvS3F6VzJhWjh6L2JvU1BvekRvQXg0MS84bzg1KzlXMGE4?=
 =?utf-8?B?WEtNN2p5M1RDWHUxVGdDUTMwUFR3TTVaWUF2MlZldGFhOUZBVUNVSmE5MkIx?=
 =?utf-8?B?SFVYaHdZRFVjaGtSQU5SYU52bFVDNXFEQlFCWFZ1RVpjOGpjZEFVMUlhTndx?=
 =?utf-8?B?SUNHTnJUN05LYSs1dk40Z2hFZTl3dDZuWk5yWWJqZHcwNEVjSzFadmxNM09B?=
 =?utf-8?B?L0huY29FSjk4YkJpRVRpdVh3YzlXb2krbzlRUTVKQTAxTHhLWDU0c1h4TkpU?=
 =?utf-8?B?cjQ1RDZYSkJiL1Q2SWozTzczdEt5Q1ZITXdtUDhTc0RsL3ZpOEl5VGFZY1Iw?=
 =?utf-8?B?VFpPMjBQV2oybHBIY2NHc2FsYjRTZFJnalo5VUVxZGhtNnEzNU9ZaEdqTmQ0?=
 =?utf-8?B?U0U1ZFBFOVl1QTBiN2ZpQXhnUDdvbXZDRU1QTlM5OXk2bnBLdmp4b0Y4R05i?=
 =?utf-8?B?TGg3OGVvY2NLYXF1K2dkZTNrdGJhY3NBdDJvNENEQWg5RzYzUW0xK0VvdjNW?=
 =?utf-8?B?TnZxRzI3WGdRRi9PZjlneU5WMEVjV0hRUVhON0k5dHIxT00ra0pTTXFCZTZP?=
 =?utf-8?B?dnVkSjRmNE5sQk14ZlI1eWZTM1kxdlQ0NXRzaVdGWnEzTFB1Vy8rN1kyelNh?=
 =?utf-8?B?eG1oSzJSRWFmK3lYc0drSjh0d2RuM0JwRlFoSWJUOTQ5U2U3WC9TellmaGl6?=
 =?utf-8?B?NzRWYTRIcE1MbEpBejZ0VzJTeVp4YXR0Y0VxdkpBTkVWcnVOMHlCcjlCcjNw?=
 =?utf-8?Q?KM23tLkyKiV69IqlaYJwUIYmY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9142d45-1d5b-4a47-067b-08db46f33b71
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 07:44:29.2702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6ASQVHZ7+BiRfCKP4Z6JlrQHBTcf11spqphKKfxXr6iiu6jJ2iVYz/s55gInOpNA8lVbkp2eEJd+zNC3dUqmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013

On 27.04.2023 01:43, Marek Marczykowski-Górecki wrote:
> On Wed, Apr 26, 2023 at 10:24:28AM +0200, Jan Beulich wrote:
>> On 26.04.2023 09:48, Roger Pau Monné wrote:
>>> On Tue, Apr 25, 2023 at 04:39:02PM +0200, Marek Marczykowski-Górecki wrote:
>>>> --- a/xen/drivers/char/ns16550.c
>>>> +++ b/xen/drivers/char/ns16550.c
>>>> @@ -272,7 +272,15 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
>>>>  static void pci_serial_early_init(struct ns16550 *uart)
>>>>  {
>>>>  #ifdef NS16550_PCI
>>>> -    if ( !uart->ps_bdf_enable || uart->io_base >= 0x10000 )
>>>> +    if ( uart->bar )
>>>> +    {
>>>> +        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>>> +                                  uart->ps_bdf[2]),
>>>> +                         PCI_COMMAND, PCI_COMMAND_MEMORY);
>>>
>>> Don't you want to read the current command register first and just
>>> or PCI_COMMAND_MEMORY?
>>>
>>> I see that for IO decoding we already do it this way, but I'm not sure
>>> whether it could cause issues down the road by unintentionally
>>> disabling command flags.
>>
>> Quite some time ago I asked myself the same question when seeing that
>> code, but I concluded that perhaps none of the bits are really sensible
>> to be set for a device as simple as a serial one. I'm actually thinking
>> that for such a device to be used during early boot, it might even be
>> helpful if bits like PARITY or SERR get cleared. (Of course if any of
>> that was really the intention of the change introducing that code, it
>> should have come with a code comment.)
> 
> I have mirrored the approach used for IO ports, with similar thinking,
> and I read the above as you agree. Does it mean this patch is okay,
> or you request some change here?

Sorry, I've yet to get to look at v2 itself. So far I've only looked at
Roger's response.

Jan

