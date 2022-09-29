Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28A45EF46B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 13:37:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413671.657469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrqi-0008Vo-3c; Thu, 29 Sep 2022 11:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413671.657469; Thu, 29 Sep 2022 11:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrqh-0008T3-VJ; Thu, 29 Sep 2022 11:37:03 +0000
Received: by outflank-mailman (input) for mailman id 413671;
 Thu, 29 Sep 2022 11:37:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odrqh-0008Sx-9e
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 11:37:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60056.outbound.protection.outlook.com [40.107.6.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04bed8e6-3feb-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 13:36:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7259.eurprd04.prod.outlook.com (2603:10a6:102:8a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 11:37:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 11:37:00 +0000
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
X-Inumbo-ID: 04bed8e6-3feb-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VM+3TZtINoasvtGEVEYpAboIUZ0ImJ23DMTp3RJpU+Y8LamuYjhgsYIW+4IS9t36a7vanb7kLCh6i/PHUNDW084v9i8ABO1udnFAnTIDsO393nWBJXci5BFe21d1/CWYgVCat65Zo3q+sEztj1lfCXi7MwS1U9ksvXV8qFyw53bvLaqqTkw3ufXGxqr4gGZHn0ZnLeiySuvrKprqGkVIqDPVKBV4gSxZr7mcftoNNoXanUX0+vgxAh9mUVem6wW2Le3a6Te92g5qX1xdA51BqBokv1JmH7gKjmq6sDbYtCw/xHWHGisZHoAwCfpyEPUFfp+EOGgdl1EEc28h19VpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgKbuTtxwB5RtkrPvwUQF0tbEkL00g2FQRFac3RiNEk=;
 b=MmN1S+FkcQydi9UsqlVAiBelzOsaHPXhXcYH/uRJYhp7lIzV2j4A93eIPHkCpBLUweSR4ZGq+o/1ByVtLLapU5KvE5vmMOgIz6KVX8Kr6r+B3NPP37zJFMcSkFrJINVZkRtHD2qVDu6Aveukeub5UhbW8iCHK5RCxYO2lK+dFpfNxcIixGj7a8FNE+Z9VV5BX+dWBiwNYOoquxdXnukoJRT7z6m+BP8K9KYQzk6tNuNt6BSbjDkLdpmawRgnt0ITDwI8cGhFV5jUs8lysqZXwHbLFu1iBzkSZRiH8HQRkntPLyoa9B4I3M3yeweb7mGmfMULg84n4hnLCSrSLO6lkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgKbuTtxwB5RtkrPvwUQF0tbEkL00g2FQRFac3RiNEk=;
 b=pVSHPGRjP+TqLkOfnX5fhlLIW7Ier3ItNuWjXgNzFWO5kYGUF3+20ckevbSRbR0AdrFOoIpCvJbtiTesZKIRsAtA3Yk5xXqVh4RVNe0lIZdxwBaOKzkOz8LTBh30WsajQlHsjxbaXOvjV7yaul8jqXzh9zqU2Ygcekq1aEJvAR3k66d3FMU85XsowoKPpNhHzn4fnJxhEV1Y4IfYm8di557oxxH91fpgV7dTdQjNIackMiVe/24q6mhOYIZmvGFIDb9l3EXiwnyrLPOZGlvQsbmfBuWBDmwv1LvUuVy+Ay6Zrdr4McErBe8smyN0nimWY5O6tdaxqQDpOt4UmrkFLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0ee61e8-f052-67b3-85bb-b9966f01f2d6@suse.com>
Date: Thu, 29 Sep 2022 13:36:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: For 4.17 (was: Re: [PATCH v3 0/2] Move calls to
 memory_type_changed())
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220928141117.51351-1-roger.pau@citrix.com>
 <d7a14258-713b-6fc6-5da5-ce4fd56202c3@suse.com>
 <YzV6UNneG0jOrvQJ@MacBook-Air-de-Roger.local>
 <AS8PR08MB799136198FFB5CF1F1B71A9392579@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB799136198FFB5CF1F1B71A9392579@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 981535a3-8b18-4e19-b7e1-08daa20eec50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	weIY4XDxtM2B3QhhAueqkAVY0EMb40NdBtmgZ+rPQ/6gSXTuk60+tQx6yfap2Frq0xTCtOAR7v34m2pLS0T64d+L7w21q77ICj12Le86W/7WOckmxRYE5A5MKoPXja+G8PWMvRvwWe8ZDt86n6jgc244YJNmulXKtCBcFYrpwDgol/YfHoH+HovC7+zeVw9mK/NI548QshTgJ19FCa3Vq5XyPdhR1dA2hTJN6usHpeMENCTvy8arB/+pDTLLzpGBjUebqbcuGcv+mc9tz5wFi0IYG4whT23cHzlWjoPskR5pPA1hQDiEoz3iEIhOwtNID56UgM7NwPjEJhDdMXETnl67PhJ0i9N1jyvqA5rzBlQF+4qUU7rqhtRNkrdoX4p+ybtCW9FP33lRLpAcoOHqXzOQ3n/PQVdyMW6iCYdQ/Jzps3dNFLyziEkjTi+uREmeGoOH3OkPrPco0vr/0zUXfJQ/OCaS4g0721tsC2WIBHmQaq7DbRBNPD14TiXB/OZG45vL0b5o/TFp9V5149C8CK72fh7uyG8Zzlh4CzKZDPXG0zeI3+eRS9Pb2LpvO36xxE4n3V0wbaGI3ly/EhxoQHbcIIRd7hJrC0/eioxAPjDKZYjYumtC07e/TkKYfsKweH2z9C04UIY6WGn9HIbnLtDepJrKz9wwzA/c5WYYzHzW+JQToBTobrH/51t/bOadaHNFaTXnxCDvN1DQ/Qo9knZcPEdCcsStAHUWo+Kd0M96xFrB6vYGRA++2wbb1DIRJ6iDzUnj+ouTD7slJZLU7MMUaOThh40Nn+K6ryjgVq0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199015)(31686004)(2906002)(7416002)(5660300002)(8936002)(31696002)(36756003)(86362001)(83380400001)(316002)(110136005)(54906003)(6512007)(66556008)(8676002)(4326008)(66476007)(66946007)(41300700001)(2616005)(6506007)(478600001)(26005)(6486002)(38100700002)(186003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1RQQ0NVSHM0MVlVYW9iejdabzBVb2FuNjZQK082eERJNG9rRmRvTUU4enpy?=
 =?utf-8?B?RGtPdnNXenBUZzVlVHp4MlRjenBrYUZEa3RLTWVpUzV4ODhsakJKRU9XRzI2?=
 =?utf-8?B?Z21SdEVXOEVDSGJFK3JBcmNXcWVVcVdpeEo5S2ZaeVRDZlJyTzZ6TE1sSDBl?=
 =?utf-8?B?U01wRjZIWGNuVFNmN3hiWjZyczhvUTQ0ZWVBWFhqS3dwRWJyUTg2K1RmOU9l?=
 =?utf-8?B?UTEvN0ovYnlxTkpFSU1zSy9rQWpidk9VWmIzVm4zcGNxYytKVGhoNTF2Wlc4?=
 =?utf-8?B?RjYzZkpyUGcycDBTNDM3aHdKanZmS3FjbWUwUGQ1cEVWRjRLb0Fab2Fsay8w?=
 =?utf-8?B?ODlpamlDNnRaMkxCdmpGa0ZRaGYyVTQ4S3FzeFdscG9abTV2NFpGaW5yQzZU?=
 =?utf-8?B?bGJDV3JtL2dSdWlTam8rd1Z6T3VmdFhWQUx0QVFSTjQ1cUduYlV1RmpwUDFJ?=
 =?utf-8?B?b2JVQmFiUktnakRQUWNFWmFwRFpJUEJ5RHhqaVcwS2ZGcDlMY0lhVTBqZGVP?=
 =?utf-8?B?dlVYZmNVS1JSdExacFNLUytaNEcxaHkxNitkUTlmdGFRbnhUZXFzeFh5RjJO?=
 =?utf-8?B?S2FtaEdRTDd3dDBLMEJHQ3dBb1NsRzJleHJUc08wYXVaamdrbzBnTWRZKzIz?=
 =?utf-8?B?SnRKNFMyU1psVXp2RHVmUVZIc3dDeTFtWVJSVWhtV1A5cnY4N0J6OFIyZks3?=
 =?utf-8?B?dEkzbk9sZkNQZzJjaDhqZHNMWVZ2R29POGg1aEhPQktYUzFzejZxdGxZZkRq?=
 =?utf-8?B?dXdwcmYyVVIreVdkakxJVGtneWNxSE9rU1pQU2R4aTVHeVZHdlk3Ui9CNkh2?=
 =?utf-8?B?M0l0SUxNSmp3aXlxNGlrR3I1N2NpTUdYenpkc1pRbmk1VUppNDJhVDIxTG5k?=
 =?utf-8?B?K1lEcjBsYUYvR28vOU9yRm1oQjNKMGFqZTBlODQ3Wi9SYXVzQlRxVEVWSWhz?=
 =?utf-8?B?Z2pKSDRaN2ZTeEswR0ZzNWx0dFE2M05GWXJwbGpDNnBibE16QmkvUmtvalN1?=
 =?utf-8?B?SE1uSU5peElzb3dmRitnWUtHZzdCSVBVbGVyOXV1VFhhZXlWM2tvckV3Vnli?=
 =?utf-8?B?RjN5RTNCUzdQWjhxOEplTWZsZk9WREpuU3hWTEc0Sk9iK3F4Q3RLWEpKZUVj?=
 =?utf-8?B?VDUzRnlLaURqSzFXQTZLQTZXMTBhT05kWCtrRDRobE5SMUZURGNDcm9aQnJC?=
 =?utf-8?B?VUZ3a2lsNit1MGNZQlU0WmQ3bUZtdGc4SHgyZlNRdUNyWm12VWNUU0Z6Zmsz?=
 =?utf-8?B?ek1GVUVXaWo0aHIwQXVDdTUyTS8rYmdBMHdGQ3pkcUdoaSt3aDRMdUNuZEsy?=
 =?utf-8?B?UFgraFdvM0QwTlF2SmZrczRZODhGZXlzQzNQWFZybHRhb04yWVRyTVpPRnlH?=
 =?utf-8?B?b0YzT0VsSkRJMUkrZEVXTm5NcjY1UnpVTVZaVk5RSFZtbE52b29ndWxGeENE?=
 =?utf-8?B?aFFvZWtnbzUzSVA5cG0vLzczQW1VN0dGeE9wQWFmbTJLdi9mUmpWaHFLQVdm?=
 =?utf-8?B?R0tEQTA0aGp0d1hNaEt3akVydEhtVVB2L2lxeUR0OGxUclFUL2cySlRDTXpm?=
 =?utf-8?B?TWdhRVJrS3VyWVhnTWZ5bFQxb2h3by9uRHdteXVROTc3bU1mYkV0bFpicHhH?=
 =?utf-8?B?Q1J1eWVMeDRXdEVDZWJiN2U4dldHOUl5dnBYVDN2MFZ3NXlRc1lzLzdtb2hl?=
 =?utf-8?B?RHdBQlFaa2hpK3ZKR0NMZTdwU1c3UG55ZnBCTlNKaW0rZmhoVnFMUDAvN0pl?=
 =?utf-8?B?emQ1dWpVWk1ibGNFK3RZcnB1a2FjK1Z2S210WDlsNU92cUd4WHJzT3NRTEFq?=
 =?utf-8?B?SUMrQ0ZjZUlhYjlsZ29WakFTdWF5RmJpRTZQTTlrTHF3MzRQS0RYUHNranJv?=
 =?utf-8?B?eW5FSy9qL1lkZXVaNmwydVVkUXZWSGJKcUl2RFdmcDhJME5GdkNSMDIzdFpF?=
 =?utf-8?B?T3lEVDlaTytyVHNWZUZlZCtvK2dSbWJ2M3g2WnAvODFiWHpKV01ad1hBRkNq?=
 =?utf-8?B?SHJSNEY5dUdWSDVBdW0yVGxRV1VHa0N6WG1BbkVUWW4zWm1ubnZPYWNnK0hF?=
 =?utf-8?B?MnBDZnBaTVp0WEdjdUMrWW81YlJHMlEwY2owK3FuMTRycnVpUXFpT1o3emMz?=
 =?utf-8?Q?jOAIcLBGq2BMDA35pmZcQ7ga5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981535a3-8b18-4e19-b7e1-08daa20eec50
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:37:00.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PW2UqR00YxRUTvF1IA09sb6C5063lgagmyAMuBpvpLVjPIPjpn2mRAUTERE6THc8ZA54MMJBn7d2mLV13mLcsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7259

On 29.09.2022 13:10, Henry Wang wrote:
>> -----Original Message-----
>> From: Roger Pau Monné <roger.pau@citrix.com>
>>
>> On Thu, Sep 29, 2022 at 12:14:10PM +0200, Jan Beulich wrote:
>>> On 28.09.2022 16:11, Roger Pau Monne wrote:
>>>> The current calls to memory_type_changed() are wider than strictly
>>>> necessary.  Move them inside the iocap handlers and also limit to only
>>>> issue them when required.
>>>>
>>>> I would really like to get some feedback on the Arm change, since this
>>>> is now a prereq for the actual fix.
>>>>
>>>> Thanks, Roger.
>>>>
>>>> Roger Pau Monne (2):
>>>>   arm/vgic: drop const attribute from gic_iomem_deny_access()
>>>>   x86/ept: limit calls to memory_type_changed()
>>>
>>> Are there intentions for having these on 4.17?
>>
>> I wasn't sure.  From XenServer PoV it's certainly a bug fix,
>> otherwise some workloads related to GPU passthrough are simply too
>> slow to be usable.
>>
>> I would certainly be fine with it making it's way into 4.17, let me
>> add Henry:
>>
>> Cons:
>>  - Changes the number of issued memory_type_changed(), so there's a
>>    risk I misplaced some of the conditions and we end up with wrong
>>    cache types in the guest p2m due to missing memory_type_changed()
>>    calls.  That however won't affect Xen itself, just the guest.
>>
>> Pros:
>>  - Removes unneeded memory_type_changed(), thus making some
>> operations
>>    faster.  It's effect it's greatly dependent on using a set of
>>    hypercalls against a domain, which doesn't seem common in upstream.
>>    It's possible other products based on Xen apart from XenServer will
>>    also see an speedup as a result.
> 
> Thanks for the information and the detailed summary!
> 
> I think my understanding is the same as what Jan has in 
> "x86/NUMA: correct memnode_shift calculation for single node system",
> - we are still not in code freeze but in feature freeze, so properly-reviewed
> fixes are eligible for the release. For this specific series, (to me) it looks ok
> and I will not block the merging of this series if maintainers want to merge
> it :))

Thanks. Then, according to my reply to patch 2, the only open thing is
to have at least informal agreement there by (at least) one of the Arm
maintainers. There's no guarantee this will arrive by tomorrow.

Jan

