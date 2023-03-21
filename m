Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631E16C35E6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 16:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512812.793057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pee5V-0007rF-UF; Tue, 21 Mar 2023 15:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512812.793057; Tue, 21 Mar 2023 15:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pee5V-0007oh-Qb; Tue, 21 Mar 2023 15:39:49 +0000
Received: by outflank-mailman (input) for mailman id 512812;
 Tue, 21 Mar 2023 15:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pee5V-0007oY-AV
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 15:39:49 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bf4c803-c7fe-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 16:39:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9469.eurprd04.prod.outlook.com (2603:10a6:102:2b4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 15:39:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 15:39:43 +0000
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
X-Inumbo-ID: 9bf4c803-c7fe-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DymPyIb21amqI4ak2d9TE446Au1vh9RdRUUkSFedHEVzIhL1CR21rBmU6mbCVAdYfmvCVzmMtnpeJnRsEAaISAuXK6PToxUPeedihH1X1CgS7rV7wQ5mv0P9oDC6UMv9+OxW8XNRBOpSSyEPuyiR2O88A4didaxaUMwdOY+eQ+UHWxY8QehllyfH9F75uiQ7N2Vc8Nj1ze0Rlrsl/juT/7yQCdD1njwRLcYscBd7m9I7OhCB0A3fommS/XbIg47Ss0eCggBJnxc5spumup1u3MQpxTsaDG+i9Rr8yb3AWl1/ur6b93WtwoBpI0mpjFPZBk56oh5PNuG9qb/N8HYw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aPeiQ9ffIgYgvyxSUaYaydPyVm0vnc9BWpICLVdN78=;
 b=WFIwAVxvE8x5FmLveJv3XSD/QIVqtr+VOJzAbuf+cK+6Q+9GOWWWqvyL/WUdnB2+kTQ0xKN0K9yNSsh26RQ3zRyVV2QFn7HJcFqV6RP2wjh3gwwTtjIRoMEnSgwIUMlrXYTOddKv8WWM2RoyTXD2aXBeOokyEB82Kk/oZct2yu5yGVsnmZ4bF/UHvYR1QVwxmNmAoN9qtq4a7WvhvPkV0RKWfoJJ+PucnDVqHcEnBbAyeZzgt7jv2w2v7DpEgu1e1jHOnIIQkhZq/NdgxN8R6Qx6hD8lza9HIDwtoG8DQ0C1oTZBU7DwggpDmCLnKdW5o4EMD7Drf5XlRWnV4224Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aPeiQ9ffIgYgvyxSUaYaydPyVm0vnc9BWpICLVdN78=;
 b=WcdJ2+9EPUj6Mak3JDUmCh80J3CgOvcJVnKG01D8JxJqKnzmM82xabAjGi4dryrsbnKUbU/Q1l4etwpy5cnuIdamNwqQ78U2I2TeNyPtzdLtt+8O/p8AnPdvz1CCs8V/WZgO+pNdFSxpACh++jqCaFRgfwRB2SHpLj8J8BBiDN4DjiKFeR3O2LAWEsgN1ldjblnpZCWQYlfXbtk485MthpS/r8sXS9uasZg0LKrarbs/mCk/Z0F0hwEvNn0/z7Mh3W3KvU4BBMJ89oLfRp8Ey3JDYnuMNN1gIJX6/PkAac9nnaXiNRTbZXNiWyGdIvnNCUYX17ic9UtYThGBVV1IAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f42e0638-b4bc-394d-25bc-317657b0d581@suse.com>
Date: Tue, 21 Mar 2023 16:39:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] vpci/msix: handle accesses adjacent to the MSI-X table
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20230316120710.38817-1-roger.pau@citrix.com>
 <aa9bf8f2-5ff1-27b0-bc41-b7b639648e85@suse.com>
 <ZBnN1VRLBtuoO/b0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBnN1VRLBtuoO/b0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d50bea-bbe9-4030-2a03-08db2a227e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	opKOkKxGFIx09/cDDMqnh8MfPsn/6vIJ1LSOiGOL+CpkMBYDkucIxiA9oij9cQTfdxeUOF6Q9gzl/yENE3U8ETQfILS/xqoyxLVlj4mN49EmsS10XqKJd6N2D+Qb0plzEz7LVfYoVbDBy+nvKo2uWkr2vZqX+uqoW/aIb732NM8GH1u9E+nTOyTaFjauwxs2AfWK0pmBPWrnEznakMrmFyjRLnSV+dSi3IYYWrBZNe5M9LrftUqELgr4Da7V1IW1bkTcoPJ/o6T3pDjIv21QLcPNr3ZvGhDmjY86I9s8N1pSMA6gJF6vpR8pReNSOG2/ZHPVX1N3c27yaMT+HLxzj+sZ11eupQyJoTMaapFsPPe0ibI8Tzr7CPM93v5NKanh1gHs8aKZ9OJfnSqQvGE4atPzaEfGAmyVeDAwNcxvtElStladPa9SplGzBK42Znz28rBUMaFYuF/cZ2o5ITUcvewztSYZ5GDm6fd7Z2rI+RBUCJbvvYXm2NY2tdUns9Q4qJ1n0x+fUzanKjEfgnRtbIilo01VoNopd1tGm78K+yUEvacJJDFMuDLiP7hWtpiN3GlYaSW1xdS7mB3rERRcRZuMMU3cOn5YbDEblG9KYvNHm9QvFj8t3xvRVdi/3Ae8S1JMlHJbmw11oCELbBs/MkwL9C/nKsOzROMVZj1XV8T9xUr8rjbTNW3m5LtrvR8HNY2TNor3uZ6UvVtQvFYI2Rm5PbnaUCGdh1kbc38LI3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199018)(2906002)(31696002)(86362001)(83380400001)(186003)(5660300002)(38100700002)(8936002)(2616005)(41300700001)(26005)(6512007)(31686004)(6506007)(53546011)(478600001)(316002)(36756003)(4326008)(6916009)(8676002)(66946007)(66556008)(66476007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDRtNU1FQ2lOZWQycnZMV2NXYnU2aEM4RlVNbElhV0p0ek5Vdjl1cHRUbkFk?=
 =?utf-8?B?ajl0R2phL2Rpenprd2g2SENzRmNWY2JSdHNVcVAzU09BSmFrSUkrTzMxTnhx?=
 =?utf-8?B?UmxqUDlocHdTT2ZNK3lVNGRURTdlT3FtTzd3Zm5UNkVSQ0pJb3RXSncxU0J4?=
 =?utf-8?B?YktkK0oyYzlTTDk2T1N0cTNyMHNuRkFDUmh5SGppQzd0S05oV1E5T2Q0N2xJ?=
 =?utf-8?B?bVh5WVkvUWxoZ3pOVjVvUzd2Z291MTh4Nk1FVkp3SGYvamx3Wnc0aGNrZGlT?=
 =?utf-8?B?RStaYmZjallTcXVCNURvTzZlejI4YVdYTTRKL1BvYmhpVE54MmpPY2dYS0Zm?=
 =?utf-8?B?K1RhcmFKL2JDT2grU1FaN3hnZzhHMDhsaUUyZThUeXNKanVFbDZSZTd3d2hO?=
 =?utf-8?B?NE56N1hDT1FacjdKTFVoa3pUazNvSEJOUDBZVVFVM0g2K2JRZlFpNmJpak5p?=
 =?utf-8?B?clVISUQ0WUwxZFBEK2V0M1p0eEg4aHRZZGhZRGlrRXQ1RU5GRkRnck1Wcjkv?=
 =?utf-8?B?VmgyeEFXbGtjSW5EbWlWekxlRXc1RlE5a0JDRnUwTVhRM3ZJVEo5bXIvbjM1?=
 =?utf-8?B?NWN6OHRSc3ZTMnJOdGtsYWltTm5nL3U5WUw1SnY1WTVaR1RvSVh0UzU3ZWlM?=
 =?utf-8?B?RXVvSnNvTDd5eFl5bE5wL0NndCtITU9vencxck9ydmw0czZkNDA3K0VYbXRM?=
 =?utf-8?B?SHdDY29LbnJwRC9vSFF1bTJ6Mi9KRko1M2h3dVYvalA3SmJtRUlXSU1ZRG1J?=
 =?utf-8?B?d3BEaWswY0IzbHUrK3F1RHYvSUJHM0ZQMG1JeXpFN3FsV3VZTEcrVmlQYnhx?=
 =?utf-8?B?anlaWGd3dFl3RSttZ3ZHeC9XaXFhNDd4UXNUOUdYb2dldEplYXpqZTZocTkw?=
 =?utf-8?B?Szh1WUU2SHZWelJCY0JsTFJTSCtHejhpQTZBSmhoc25tMFh3OXUxZmhCWG9o?=
 =?utf-8?B?R0Q1eUdHQmRGQlJwUTZYSDU3c29FbDRuOENwQ2NWODZkWVNZK2x0S0RWdXp2?=
 =?utf-8?B?TXU1bTV6MzhjQ2hjV1ZvcHJiSXkzcW4zbDZEV2ZtR1cvNlVsZEpGcGFWSWlp?=
 =?utf-8?B?WjdHSXRIVUVYZit0U1BkRmRtRDZwSHE4T0o5eEJ4d1BBdmFXQkVZS1NKczV6?=
 =?utf-8?B?bC8zT2hnSUVUNE42dXJpb3JGT24rVDJqM3Q0cTd6U201VGcwYi9pSlFWaXFp?=
 =?utf-8?B?azBZNUs2bUlSSklIM0lOZjlUWmcwWlMvaUUwWmxKdEVFSjRwRkdKU0NVRUw1?=
 =?utf-8?B?enNZVTFuK3haQWJ3NzJsU2N5NWxBdnZMTDI3VlJyaHgxemxDdERBRWx5SGNz?=
 =?utf-8?B?ZzZrQTFlWkFiOVZ3MzM1dDJiOTQwZW9TdWVpMWZ3WkxLcmc5R1JCamdLWE0r?=
 =?utf-8?B?d0hlN2xQT3hoOGJUMkR3TjNCSFlOUi91aG5NOUVlT0o3VXVjRzhDb1B6SkJN?=
 =?utf-8?B?YWl6WjRLR2hoRXAyZE0wU1oyQXEzSGgrcFJST2VZM2ppZ09VVTlBNWkvOUFa?=
 =?utf-8?B?MjNmVUswcWt4cVFsYlBFVlBxcVIyR0xFcmYzWnlRNzg5OHFBdWsxUUhsMVBR?=
 =?utf-8?B?UlNkZDZIc2ZUTXZBelRxUzQvUHZWN3dYT3BTbDdMSG1ZRWM5ZUxyV2QwODNE?=
 =?utf-8?B?WjNJcTlYbVA0SDI0WFh1Z0pEUWppWDB4NUhwakk0aURJMGFTTDdmYmNtUXQw?=
 =?utf-8?B?UVpFWDkzSktCTGFtK3FMekpLWTB4VEQwbUozc3JKcnJjN3FSbTF2WExBQ0xM?=
 =?utf-8?B?L09XK1pGNmJxZ0l5NlRVZVFzOW9hNStaMHRWZEtHV05FM0YydERzTjlxRXRt?=
 =?utf-8?B?UWJ4QjlMYmdsT1lDa1VhS1paZlphTWVoeDVyRG54VFdrOUJ4M2tndk12SnF1?=
 =?utf-8?B?RS8reDVrTHo0RWFxemVqSmowaWsvck9pdi9GUjhzbXh5M3ZsSW9RVytibktr?=
 =?utf-8?B?M3lUSGxhQlVJSlNWN2J6enAzVk9GT0kzUU84RzdPVmRpcFg4YysvN01hMDVP?=
 =?utf-8?B?R2FGQmViQVBSQTR5S2YxQzQycnpaZHpTbHg4NEhNR2IxNFE2dVlLV3N3djhx?=
 =?utf-8?B?SCtZVktGdHFMdzFjSU1KTVA1N0h6SWhKbE5hMHlzdFZKaXB3b1JQM1FWM3lH?=
 =?utf-8?Q?JqGYf5rXedj4NXWGF6ClasVGR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d50bea-bbe9-4030-2a03-08db2a227e29
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 15:39:43.8344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLPyKsYJs3SQU9GxcKwS73yo4fOTr+0tvSIB8khRFcTBbq72h8r6Lo1rGkcVD8YeaU2/IfQd26wSkj+hNbVwuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9469

On 21.03.2023 16:31, Roger Pau Monné wrote:
> On Mon, Mar 20, 2023 at 01:08:48PM +0100, Jan Beulich wrote:
>> On 16.03.2023 13:07, Roger Pau Monne wrote:
>>>      {
>>> -        struct vpci *vpci = msix->pdev->vpci;
>>> -        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
>>> -        const void __iomem *pba = get_pba(vpci);
>>> +        unsigned int i;
>>> +
>>> +        gprintk(XENLOG_DEBUG, "%pp: unaligned read to MSI-X related page\n",
>>> +                &msix->pdev->sbdf);
>>>  
>>>          /*
>>> -         * Access to PBA.
>>> +         * Split unaligned accesses into byte sized ones. Shouldn't happen in
>>> +         * the first place, but devices shouldn't have registers in the same 4K
>>> +         * page as the MSIX tables either.
>>>           *
>>> -         * TODO: note that this relies on having the PBA identity mapped to the
>>> -         * guest address space. If this changes the address will need to be
>>> -         * translated.
>>> +         * It's unclear whether this could cause issues if a guest expects a
>>> +         * registers to be accessed atomically, it better use an aligned access
>>> +         * if it has such expectations.
>>>           */
>>> -        if ( !pba )
>>> -        {
>>> -            gprintk(XENLOG_WARNING,
>>> -                    "%pp: unable to map MSI-X PBA, report all pending\n",
>>> -                    &msix->pdev->sbdf);
>>> -            return X86EMUL_OKAY;
>>> -        }
>>>  
>>> -        switch ( len )
>>> +        for ( i = 0; i < len; i++ )
>>>          {
>>> -        case 4:
>>> -            *data = readl(pba + idx);
>>> -            break;
>>> +            unsigned long partial = ~0ul;
>>
>> Pointless initializer (~0ul is written first thing above, i.e. also in
>> the recursive invocation). Then again that setting is also redundant
>> with msix_read()'s. So I guess the initializer wants to stay but the
>> setting at the top of the function can be dropped.
> 
> I'm always extra cautious with variables on the stack that contain
> data to be returned to the guest.  All your points are valid and
> correct, but I like to explicitly initialize them so that further
> changes in the functions don't end up leaking them.  If you don't mind
> that much I would rather leave it as-is.

Well, such extra code always raises the question "Why is this here?"
But no, I won't insist if you prefer to keep the redundancy.

Jan

