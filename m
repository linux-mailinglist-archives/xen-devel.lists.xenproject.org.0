Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC7A6EDCF1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 09:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525742.817121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDK9-0002zl-J7; Tue, 25 Apr 2023 07:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525742.817121; Tue, 25 Apr 2023 07:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDK9-0002wn-Fr; Tue, 25 Apr 2023 07:42:53 +0000
Received: by outflank-mailman (input) for mailman id 525742;
 Tue, 25 Apr 2023 07:42:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prDK8-0002wh-Nv
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 07:42:52 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c80707eb-e33c-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 09:42:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9361.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 07:42:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 07:42:49 +0000
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
X-Inumbo-ID: c80707eb-e33c-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFHHp3zFG4JdgOWtNm6Z2cVRaMDg8dij1ZXCxRstriSgziuUDtRyjW3HYDnQ57Qnn6ox7tjGOTBeUYUWsJ14nyLEEJJB4yPG84VSjvUp2Ms3hWTQortCQFseeF2qb53BjJd90ejN7C+ptUNPve3u4aFFKEuVCOooX0LcYnv6xOl4pN6JjliwRyfiVOu0NDn7m8ah6IzJhYFE9jTR2KD9gkEJ/Jv7Ob6Wg1CpGtUHLiK94HG38LSz09Q7k5KxAVqyZ/y1G6N+4hxeBCCDHfC8tXtuoNxvhKS3qnqZ2EbW/igFq+0clB+/tVZ/KuqR0B3YjawoRQxfs72z4HleSqLLCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdxazYQaXGeErlEztRPxasszU1ZMO5YgXjTge+0NjuI=;
 b=bCuHrAZzIYBCLKBQ0VZVAng9/nkPFV6dZdAZYripnwjsInJB82MIZHNJnqyfcdZe5ieqhSoUMxg0WQ1NmWf8aOSJ260MLSZeN2xXDjXU0gViyqhuytKkT6kPmTD+oO2usJG2xv5BjeOHwgxEcz5po7uIhfeZ/2ZkNC83NCCKauRmfpLby1Qbgn34BhMF3Kh2xfjW7faV/2M6D9ZMm8mpV5EFfrHeClBJ68erbSCf9ZmL7+YSdHgpi9Eyd7f8RCOYxRmJZvfTCSStIgcmtvaZqP8fbXdS2WAa/m+oba/ONEutgHCm3vpzI/eooY/31Gx0U49SNwdHaQpDn+e4+ujr5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdxazYQaXGeErlEztRPxasszU1ZMO5YgXjTge+0NjuI=;
 b=iZYezDL4eqhfGQCh+xjOuC/A1HaFE2LeSDccUMYLAwwkVAQ9Kzeq02fNHBrXyF7pTWXvaojaGX5aAXnDRSSqOXk4zm5B2pyXAKiCkQBTHIcB2rVS6ZcPc7XG6ys7AIu7DsaAsgIJ4yc4nPz3ktTrvswlJ7b0+B41igEawIekHmZDkELA/Xm3SomzIIUCsb0HwY13+rzvPy3hGsLSuPGurVCLyZsJpf7Fb1XEWuMFs7fVocEd/3exZV+kBKX+SPHujHqdJr/a/uNheUiyqjdhWJCSey3tEN2kKkDFoaQz1My+iPtEydHQufcmU40fwp0ddq6rQBkcMY600D61h9lfGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fd1cde5e-a12f-85f3-1c21-bc41a483be39@suse.com>
Date: Tue, 25 Apr 2023 09:42:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] xen/sched/null: avoid crash after failed domU
 creation
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20230424210048.786436-1-stewart.hildebrand@amd.com>
 <16b10155-4dfb-6891-dc90-61a6b966ee6d@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <16b10155-4dfb-6891-dc90-61a6b966ee6d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9361:EE_
X-MS-Office365-Filtering-Correlation-Id: 712dd57b-4d5c-495c-a4ac-08db4560aad9
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YZgptgTLT1SY5To4bqIHlJt6VhMHbxgysuMVNqKfTgULF8aPM8tfQAX6RJNkBFOzlIfgxxYSLqNgrn03J1erHoOTJQ926FJm1urngHp1G6/RK2Q4sdtlr3hjtmCd3/m0kfI8V926XNiZZYE6C7kjqEHR7tRWWfS/21D1FcvYDexP4bQYF52L0eOF231cKXybraunFLdNx2CyLfFPKzom8dWyD+btNa4BlOZCDKDBrIKLbKzl21IAmHwT4czMtSJWcKYXH1fIKt1nzyFGxfz7s88+uQYoIEnDpmNJWtA6or9xxBa+a341JOmv2MFd/4Phqx2syceelzu070NYfq79hum4nDPMHb7uJ/0SPE/erNxC3ZcqCirobuusUAMZzj75XABOMn5NHJDy03vSCr3EoY8y+uBzmBpoHwnWpmxi5Lgrq2f4kv8UvkjZ47DD9rT3oCa/8ekICdmWto9BqchvEsOPCePzxXCQvmFchT3Mp46zYzwGS0H9JCnzJt7QYVrchlMbi7nyFxavIRUBl22U+uKIdB1JuYelV3v1vXE71kD9fqYNl2VC356FaQXoJyuaPJLRrOpPUlPlLa3vLPSQI9k/qur2YH2HP5BqX/M0US5xiqJmayalip/tYu5zHOFKnsahKxTWZAz94mVZLD8n5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(2906002)(6486002)(6512007)(6506007)(2616005)(6666004)(186003)(53546011)(66556008)(66476007)(66946007)(8676002)(8936002)(41300700001)(4326008)(316002)(26005)(478600001)(6636002)(5660300002)(110136005)(38100700002)(36756003)(86362001)(31696002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1Z1UmpTKzVCRGFyUldrbFdPbFNBSDlSVTk0MURhM2FYRG9tR0F4SDMxUjAw?=
 =?utf-8?B?RFpmYmFKaDAwR2c2ZThFUFpmNnBqNCthUERpOWFWKy9Jc2dIZFZKVkxjL0dB?=
 =?utf-8?B?bEE0aHFPT01NUGYrT1JJQ0NPOGk3cjdvNHdwZG9vQXoyQ2c0SjRPMWYvTmRK?=
 =?utf-8?B?TFJpeUphd3NmOGdaTFFOb0w5U3ZWRTlqQkhaMlM3NjdaMlZQLzlWcTRGSTY3?=
 =?utf-8?B?THhqZVN0TkhDWVg3M1R4cGNxUUJ0cEthVHpXZTZxY3FmRnc4Y0E1QzFoTnNs?=
 =?utf-8?B?RFlLenZyS2plNGd4dHI1b0VWbnpJaDhIaUNwWlN0dEVBU0o3dnZiNWFBL2Zx?=
 =?utf-8?B?d1BobnhINHVWb1M4a3dIbmV3K3FFc3VBSjNPTHYyU0NjRm9rNSsvR1REV1ZJ?=
 =?utf-8?B?NnRmWnF4R3BmMEx3MnQwWDN3d0YzN3FEamdob1ZUanVsZWluSnZlMTdIdXRM?=
 =?utf-8?B?SHY3QXUyYkYzU0l1QzFBK29UQ3JZeHFOamQ0elRvYVp6dXc2WjdtOXVqZ0JJ?=
 =?utf-8?B?K0czQVVMTFRXSXJaT3hod2hZNG5UdHcwYTdPK0tTbm1iZ1RFS3JHeEhDUGZr?=
 =?utf-8?B?U2pnVnh1anBkVEhpU05sWEJSNkdKWVlCdkV2L0JIU0F3aytxZ1MvYk96aFQv?=
 =?utf-8?B?U3pHUFk1UWptbG9jYXZJMmJlZktaZlVsdGVmOHc4S1VzczlRZVlmV0JNQ3c1?=
 =?utf-8?B?UmtHMEVDRmptOFRyL2RGTnByMXhkZUNCNHBwWXlsbXB2SUVqWVZnSFRta3NX?=
 =?utf-8?B?RVV4TlQvbXd6dXl2dlRCZklqNXV5TzBRSXdIUENLMTd0cWVFdkt0OXY0UlJS?=
 =?utf-8?B?U3JZSDFhdjhMd3pxNTBLbmdzTkRSWlNpL2VTQjFwVkhQdkdaZ0ZxMDVCQzlm?=
 =?utf-8?B?UGpEOTQ4b1NDd1RKWDlBRy9BbVVNQVJNSEkxd09Qa2ppbHg2TkpLc0pFVzVr?=
 =?utf-8?B?LzU0WGZhTHZIV2pWbHRrb3BJa2hxKzE5SjNUZVJhdTdadFQrS1lOeGNqSTdU?=
 =?utf-8?B?Mzd4K0pUTWJjdmhaN2dvbDB6ZkZmWmt6RWF5ZTBsTStCNlUwT3dqczBMZndv?=
 =?utf-8?B?ODMzVVlSRjFqQllrRUN5N2hkNm9qb1VBb1RkdUVuZ1hJdHIxN2N1eklaVnZD?=
 =?utf-8?B?eGExOUlpQnFaSXBRazMrMllMTjUvTUJFbFJMM0hWMnJ4M3FCUHJZZmZoL3lU?=
 =?utf-8?B?QkJzVDhlSStsR3NqSVJ5NkN2c0h2alFHdnNjNmVyc2o3Ym5MTWZmYjRzc0lQ?=
 =?utf-8?B?RzM4bVJyL2cyczFScXlhWlpzOE9nQW5nVDhsWHROSklyNGdvVUhoT3hPbnRH?=
 =?utf-8?B?djk3U2RibHFrdEQvWW1RQlZoS1dycm5yL2JwbkFCeVh6Zncxc3lsakFOM3do?=
 =?utf-8?B?MHU1U2VuMlFDSjhhQjVMRlVFK1BuSVdibGdxVWZXVFl0R3BLUGxJclhyNE5N?=
 =?utf-8?B?THVUejRWNGRZRDBkeGJ5ZmU5S1JXalpGR3lybEtMUjA5cFZIWmtkMlBqK2p1?=
 =?utf-8?B?YSsyZS9kR1Y0WTNyUTlGS1lONEpjaE1ja3Y4MmxBRklWbm9aVHdENVlrV1lj?=
 =?utf-8?B?b3R1dWxxSk5yaHdqM3czemlwbnR1bzVXQzlCUmZ0V3RMU25OTnlKUjF2alQ2?=
 =?utf-8?B?U1ZjeEtsUy82cFlvQ0plalFyZGNOUkpFQW83aW01M2NIMEVjUm5qWDQyNzla?=
 =?utf-8?B?U2ZySXd3am8ybkIxcXdWTWw0QWw0NWhlZlhWcXZGNTI1TnFJVExtZWR5Y2o2?=
 =?utf-8?B?cnBlSlFZODh3d1ZWRE5NQnJsTWd3dythOFA3dEN1aTZRS3FIR2VWK2tzVm9m?=
 =?utf-8?B?SFdPRU16UjkwUDAya0k1UlJ3cTZwTWJXMUFFTXBwSUpVWDZCVFBuR1ZKNFZN?=
 =?utf-8?B?c1FIb2QrU21iamVCMWgvM0RoMFdxYjhDazRzU1dnZmNBeG9OeEdWRytHZTJU?=
 =?utf-8?B?YTRVNXpzeXJqajRrM2ZjQkxjem5mVmtWbTQxSUxFMUZscVRhdFBTeHJUd2U1?=
 =?utf-8?B?dTFrQjU5L1U1ODJ3bVdwMmJJVVpRYThNUndreE5yRjk0b2sxNlljYWxzZTRP?=
 =?utf-8?B?Vm9hWVJ4aWpIZXpzMWN5VUhtNjhkV2xHWkswTG55a3d4WFA3Vi84UzRsYVpR?=
 =?utf-8?Q?NUmOAyqkagzHY3tKrgyxkVn2Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712dd57b-4d5c-495c-a4ac-08db4560aad9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 07:42:49.0351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhefaHRC7M6DOyWA0Ly7tz7Vvfk/BmIFpup3fdiB3xgnzM1Ply4eu6e26EQ0dFIMfhNmmEcE75XF/+WKgJN8ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9361

On 25.04.2023 08:36, Juergen Gross wrote:
> On 24.04.23 23:00, Stewart Hildebrand wrote:
>> When creating a domU, but the creation fails, we may end up in a state
>> where a vcpu has not yet been added to the null scheduler, but
>> unit_deassign() is invoked.
> 
> This is not really true. The vcpu has been added, but it was offline at
> that time. This resulted in null_unit_insert() returning early and not
> calling unit_assign().
> 
> Later the vcpu was onlined during XEN_DOMCTL_setvcpucontext handling,
> resulting in null_unit_remove() calling unit_deassign().
> 
>> In this case, when running a debug build of
>> Xen, we will hit an ASSERT and crash Xen:
>>
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) Assertion 'npc->unit == unit' failed at common/sched/null.c:379
>> (XEN) ****************************************
>>
>> To work around this, remove the ASSERT and introduce a check for the
>> case where npc->unit is NULL and simply return false from
>> unit_deassign().
> 
> I think the correct fix would be to call unit_deassign() from
> null_unit_remove() only, if npc->unit isn't NULL. Dario might have a
> different opinion, though. :-)

Furthermore, even if the proposed solution was (roughly) followed, ...

>> --- a/xen/common/sched/null.c
>> +++ b/xen/common/sched/null.c
>> @@ -376,7 +376,14 @@ static bool unit_deassign(struct null_private *prv, const struct sched_unit *uni
>>       struct null_pcpu *npc = get_sched_res(cpu)->sched_priv;
>>   
>>       ASSERT(list_empty(&null_unit(unit)->waitq_elem));
>> -    ASSERT(npc->unit == unit);
>> +
>> +    if ( !npc->unit )
>> +    {
>> +        dprintk(XENLOG_G_INFO, "%d <-- NULL (%pdv%d)\n", cpu, unit->domain,
>> +                unit->unit_id);
>> +        return false;
>> +    }
>> +

... shouldn't the assertion be kept, with the new if() inserted ahead of
it? Plus the log message probably better wouldn't print a unit ID like a
vCPU one, but instead use e.g. %pdu%u?

Jan

