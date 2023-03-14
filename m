Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBE6B9019
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 11:34:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509540.785469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1zI-0007oU-JT; Tue, 14 Mar 2023 10:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509540.785469; Tue, 14 Mar 2023 10:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1zI-0007mI-Fm; Tue, 14 Mar 2023 10:34:36 +0000
Received: by outflank-mailman (input) for mailman id 509540;
 Tue, 14 Mar 2023 10:34:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc1zH-0007mB-IG
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 10:34:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cefe215b-c253-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 11:34:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6953.eurprd04.prod.outlook.com (2603:10a6:10:111::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 10:34:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 10:34:30 +0000
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
X-Inumbo-ID: cefe215b-c253-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGWt+Oztcu2t5JE3hSICYakMdZBCHCCPH3/z+7Q3iflp89YwAlELF2DM15asO7zEm1fdJZJR8D1wkY/0NboZYkYrK2HXHD1KZRJUKRQ6rEn39fR8b2oZFh8eNtZdcCzDOjFhc5aOszkHyJTgOlYSfIH91+2183obGeqzHAsdL+mEgRqFoS1yCbimsetm0VwbamYgNIUEqltiHsOoMGUnImVEZ9yG96lGT8oAv8cysxfSrcbkf8kmnaSoD42tY63bzxHgsO8bB7HojSHokBYgGUyNay94HUflkICnqS1r8vaeLan9pI4brnbmurShMQjuPM8QEeJWgepnspYnPCaRFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gEK99ufs4X8Y1dQpkdW4sjGYjhq8etKlpalffrtvL4=;
 b=lDBHIy4FMua0n8WwD8hSV0P+IXZpNiHrso0+oHQ2dss5ja/1iTg4sf+55p9Eg1vjJw38JtJ1lulPukuvsfXXKY8QT/x4owMS3o08Fj44qdhl+mhfnM9N1M7NluHBNY6sVF1nbUy6cW////Yr+cb3eBKgKxO51dTyBZ1xYunkj4wMgg+BqS+/7sTL2a8Jtx614jbsQKyrilkD7N2XjrHY4sT/K5Aup+NtpDbFCuEcWBulBFZO7XkBxEVmL5vOnYSDzD0gIDFDbEozkHkoCxMwZw/5mnwSsEThWpavTrKmi4g0rFHTVu0TxlUQJxjWaoy6SfA3khblrclXlIW+k4a2xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gEK99ufs4X8Y1dQpkdW4sjGYjhq8etKlpalffrtvL4=;
 b=3iKU8Cda97WQ+c1+H/e89+Q3DmmBGWo8Hpa37xZwf4f1GlBS22LfGztuTEUNaB+X/41GGcgbGJfgOD5PJ29EpOq10Xhrvt8beYIvcjefssJkdSJfebSwG6t1W+CKHmE7fBeesnfhbvrnWInvd8lXFqOeWAPl7v2ux6Hu9X3k8BRkUrKmBYWRulZw05P6KdMFh3ozRweHWVC0j/l+tgFx1LnbK0LnoEhwMiXbBkTDLf8J80GuMNoE2PAMG933lj+qfGat22zfi6vnmRANBDRC0Z/lFP2j1RRqVS8sFAwaMt6LTxCdvRan3ehmw0l0LDR6Q0x5MC6c5e1tUSdYWoZdoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <018fafce-21e6-5d51-00a9-6694c956198b@suse.com>
Date: Tue, 14 Mar 2023 11:34:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: API/ABIs: Re: [RFC PATCH v2 0/2] Add a new acquire resource to
 query vcpu statistics
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <90a551bc-ffda-6db8-775b-11c100bf6f52@citrix.com>
 <20230306142315.GA745324@horizon>
 <c40f1a4e-63a5-af2a-e5db-729b1af80708@suse.com>
 <20230308115410.GA1108824@horizon>
 <d0354bab-3022-6048-8d58-45f63aaf26be@suse.com>
 <20230309103825.GA1221165@horizon>
 <645fcd9a-755a-e2a2-f332-93c5e571b9e5@suse.com>
 <20230310105800.GA1285481@horizon>
 <84e0cf30-d4f6-b1d2-b99c-7a297f5c5c2c@suse.com>
 <20230314102815.GA4225@horizon>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230314102815.GA4225@horizon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: 31002f62-1c17-4580-e283-08db2477b1ce
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ePo/6PIVxOKQ+gMM5fGOndGwF5AytX8EU+5/hfy+l0zx2nf7cJ5XjdQDKkYVy7QCVcJGuPjx8/vArfgvw4BIQXXfIIQah8S+Uqcqj/zNUEB6wFSuPON56wOMoAOQ/MPvNRBco0Keh+1kSDdalEOKS0cjjlPNkX68M8AON5FSzb6NzcDaOHUHHsgZVaJO56AGbOouD1jwgnIzOt5zuGA5TnlqCogXHVbR2frIcadvRw0ZnuSxNtXdBl0+Ioqq/cHQBxcOwH0AFW5RtRV0EVPB4tbn3GcgOWVruXUARSaBN4gauS6i5Ikk6o17KJmnOftLU+yRwD2YvdS/njhUCUMoT/TewApSRA1LwEg1p6OJbLdZcLDoiWKtvyibIc4VLvHV1zBimf9ix8CLI4JGExaAAp75SBLhSux9v3M6xhrdKP6kXowhaE+dfuXTBuOPI7lQNzOZhd04YrYEd6HbpiR9UZMzUVPHn7yL8PSeTr7N0QLDpgmWiOX3TKqaC57LoWK0zUDLJvwY/B6pqNeMywWHs40qIG1zvO7kkqdYL5KoyLeVrizGSXUN2n73ufNW9lnlnJqkZCj/5S4gyqeG8aye7+VBPg9AK+exUPTeVXCU3THKGPtb5AOiEhuoInH1wfBVoAoG0I5J4wErBsqtDwND0P2S9eTtCp2KfFsg6ZNBjjt58FQlyv39Dgo6jeDDZHWgKmkIltnfVypzuHmI2PgrAEoWQAhiibGF02k3IAkvLgE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199018)(31686004)(66946007)(36756003)(478600001)(54906003)(316002)(66556008)(41300700001)(4326008)(66476007)(7416002)(8936002)(6916009)(5660300002)(2906002)(31696002)(86362001)(8676002)(186003)(6486002)(26005)(53546011)(6506007)(6512007)(2616005)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXkzL3VvcWUraEM0cWlycTBKQXJpR1JuOXlyc3plTXA0TmpNekhSVENTVGMy?=
 =?utf-8?B?V2IzVHZpelYvbEREOUt3M1FKUWxiWTV5MzZnRDIzRVppTkE1aVJDM2pYc2lF?=
 =?utf-8?B?UUhYMSsza1RFRWxBOG92MUZ3bnNEMW9YZkN5TXJBRlBCZCtNbGRITEZiMDBM?=
 =?utf-8?B?emxMemM2elZLUkI0N2ZKMWNQNzZXdjBrUFBOdXY3cy9kcWZCYU1HckhpRWNE?=
 =?utf-8?B?ZHZyNnlSZXR0dStBYlJTekZrTmdSeW4zOFZocnJVRlQvODhHTThhV04zNm5H?=
 =?utf-8?B?NW1zcC9DL1FCcWhWWEhvRHVsWkZ0QkFBMGxxUDdtbnhTSi8waTJPNndZc1hR?=
 =?utf-8?B?WGRiblNRNlZIQTZUQU9EZ3dnd0lnNk5BYUdYT1N2L1Y0S0JBYlltcklQS3Vq?=
 =?utf-8?B?M0hiNXBYY3NQSVVVVE50V0xIdHRzUWlNR29nVTdlOW5hS3JUenNsYTFvY2VE?=
 =?utf-8?B?bmRPaTJEc004dCtrZTZKeXV3YlI3WUtGU1VVYlp6ZWpYa3paTUlvd25TQ1lB?=
 =?utf-8?B?NFZISUFSZ1RHb2RXbjhZTGluREh1aGN3cGpsT0tOOFdidDJaVTFkL1R0ZDlz?=
 =?utf-8?B?Y0R2dDZ1NmZERnlnT0lFOTVqY3FoelN1RFdqRTVISGtpT3BhSFhRTGJwQTIw?=
 =?utf-8?B?N1FWa2JncmNDd3BNTnNDUXJQWUd3OU0zRkJYZHd1SEFzLzRpUlpsT3J4VkZs?=
 =?utf-8?B?YzhyNkNmS213dVp5cU45TmIrRXVIUk55ZzV4S3lTUy9BS3NJUWZwTnZYd0FB?=
 =?utf-8?B?blNOZHg0aXArdnVsQ0h0bWRvdHk2KzN1QlQxc21PY1U2bmxZSkl3SHZmYU00?=
 =?utf-8?B?MWRIQ1AzR0lMc0hHcHJxYWhoS0JmRnZqMUk1ZXEwcVQrNkZiZzN5OTlVSEJQ?=
 =?utf-8?B?NWNxV0ErT2pLNzhuNGtJS2p1dzlwd3pweUFYQ2R2MzZtQ2FBZXRzblJOM1Z5?=
 =?utf-8?B?NEVVVHc1SnErOW9KN1htaW1vcWJQWjdQRUNvVmo3cUdHT3dtSHBNQ0FpNjhs?=
 =?utf-8?B?dk5qSVVPTUpXWVVyYlFIREIzSkx4OU1BdktyeVVWVC9PWHRzWUw1a1h0aFYy?=
 =?utf-8?B?d1VXSVZ3c3k4bUVaMGliK3VjclYxemkyalRHcURRcEtwc05HUytva2p2Mnk1?=
 =?utf-8?B?a09IM0ptdlFqNHRJRmg5by9wSS92Z05ONSsvSDdXcXFlb1ErS0lIbjlZdWZ6?=
 =?utf-8?B?aTJmS0hqZXdudmljZ3JGU1U1b1FLRlgxcGdPSDZ5dW9RT2xoZzExKzRHaGJ5?=
 =?utf-8?B?WnZNNzlFUWxXQXltVmQxbEhBeU9jMmt5aUZObE9DYUVlQmNUSks3N2Z2MVQ0?=
 =?utf-8?B?ZnVWWFEzYmQ4RDNxWGlvWk51RmdWc21heEVzb0xxZDVnUWM5REZMUzA2aGR6?=
 =?utf-8?B?Y2ttRlFKNzJycDBhLzQwY2tybVpiRTVzKy9XM0t2dU9PN2l4VVJDQmxVMXdj?=
 =?utf-8?B?V09wQTc4bWd2aGVmZU4wdlVYRHdrZ2N0YmZmbWFiQXRCZ2JDTjdGT1VkR1pS?=
 =?utf-8?B?bVVQVk9YbnkxZUkrcFpydjdqRFZ2WnZBYlNCZUhZVmVuaFg0S0NhMldoUmhM?=
 =?utf-8?B?WkVoaTVQdS9sYm1vTmMzKzdLVEd4UC9maTdRTUlTek1MN010OTJYMTlkTXFP?=
 =?utf-8?B?MWZwQzJ5bnNuQ0ltUzF4M3ZFN21jdlR4YU9Ha3hSRWZ2WHNkMnc0U1VBandX?=
 =?utf-8?B?UFdvNVExMUM2MzZMM25UVUlxYnlFNTVDZ0Nla09TZEJ1bDNWU3RoSDNXUlF5?=
 =?utf-8?B?R3FFN2xJY2E5bEs3MENDUENDdDhUMXNzenVLV2xMNThyN3lIMTVjRkJyRTVD?=
 =?utf-8?B?OXBvOXZ0M3h6RWh0S2Z6VGJtYzFrMnV4alpIa2NCckNnNmxZaFZYTkZTaTgy?=
 =?utf-8?B?dFNMMjhTbUJUdTZkZkdtUDRNMkxiVW9XczEwNmllVW1PYk1WMDgyY0xOSmZ3?=
 =?utf-8?B?M0Y2R0xTVW05OGx6cWZ0bVpvOHR1WUxhVlZtRmtVR2h6Zk1sSGNGWkdwQTlG?=
 =?utf-8?B?WHVKVXVoc1NnMC83VzZVMXc1N2dHdk91UUtmTUNNSmVDUWxIQStyaXdRaGs0?=
 =?utf-8?B?V295cDJ6VktVR2c1blVDQWp4cW9PQUZBcmNQNXVqdzQyaTc1eExzYjNnQTAy?=
 =?utf-8?Q?7A+OeVj2AxIbIhwFbj9dqls9C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31002f62-1c17-4580-e283-08db2477b1ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 10:34:30.7297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oGCqPEK5ioOIckBxP0EQuXVpxZd+NdEv8AkNIr0B2P4LG8h6aduqpe5VNcOyo8pnzMo0ZctIn/akgAirjDGAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6953

On 14.03.2023 11:28, Matias Ezequiel Vara Larsen wrote:
> On Fri, Mar 10, 2023 at 12:34:33PM +0100, Jan Beulich wrote:
>> On 10.03.2023 11:58, Matias Ezequiel Vara Larsen wrote:
>>> Oh, I see, thanks for the clarification. To summarise, these are the current
>>> options:
>>> 1. Use a "uint64_t" field thus limiting the number of counters to 64. The
>>> current vcpu_runstate_info structure is limited to 4 counters though, one for
>>> each RUNSTATE_*. 
>>> 2. Use a dynamic array but this makes harder to use the interface.
>>> 3. Eliminate stats_active and set to ~0 the actual stats value to mark inactive
>>> counters. This requires adding a "nr_stats" field to know how many counters are.
>>
>> While nr_stats can indeed be seen as a generalization of the earlier
>> stats_active, I think it is possible to get away without, as long as
>> padding fields also are filled with the "inactive" marker.
>>
> 
> Understood.
> 
>>> Also, this requires to make sure to saturate at 2^^64-2.
>>
>> Thinking of it - considering overflowed counters inactive looks like a
>> reasonable model to me as well (which would mean saturating at 2^^64-1).
>>
>>> I might miss some details here but these are the options to evaluate. 
>>>
>>> I would go with a variation of 1) by using two uint64_t, i.e., up to 128 vcpu's
>>> counters, which I think it would be enough. I may be wrong.
>>
>> Well, to me it doesn't matter whether it's 32, 64, or 128 - my concern
>> is with any kind of inherent upper bound. Using 128 right away might
>> look excessive, just like 32 might look too little. Hence my desire to
>> get away without any built-in upper bound. IOW I continue to favor 3,
>> irrespective of the presence or absence of nr_stats.
>>
> I see. 3) layout would look like:
> 
> struct vcpu_shmem_stats {
> #define VCPU_STATS_MAGIC 0xaabbccdd
>     uint32_t magic;
>     uint32_t offset;  // roundup(sizeof(vcpu_shmem_stats), cacheline_size)
>     uint32_t size;    // sizeof(vcpu_stats)
>     uint32_t stride;  // roundup(sizeof(vcpu_stats), cacheline_size)
> };
> 
> struct vcpu_stats {
>     /*
>      * If the least-significant bit of the seq number is set then an update
>      * is in progress and the consumer must wait to read a consistent set of
>      * values. This mechanism is similar to Linux's seqlock.
>      */
>     uint32_t seq;
>     uint32 _pad;
>     /*
>      * If the most-significant bit of a counter is set then the counter
>      * is inactive and the consumer must ignore its value. Note that this
>      * could also indicate that the counter has overflowed.
>      */
>     uint64_t stats_a; // e.g., runstate_running_time
>     ...
> };
> 
> All padding fields shall be marked as "inactive". The consumer can't
> distinguish inactive from overflowed. Also, the consumer shall always verify
> before reading that:
> 
> offsetof(struct vcpu_stats, stats_y) < size. 
> 
> in case the consumer knows about a counter, e.g., stats_y, that Xen does not
> it.

Looks okay to me this way, but please have this verified by another party
(preferably Andrew, whose proposal was now changed).

Jan

