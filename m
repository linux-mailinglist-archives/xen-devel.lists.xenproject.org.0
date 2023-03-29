Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4E46CD8DA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 13:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516226.800021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUNo-0003pp-CD; Wed, 29 Mar 2023 11:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516226.800021; Wed, 29 Mar 2023 11:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUNo-0003nE-8c; Wed, 29 Mar 2023 11:54:28 +0000
Received: by outflank-mailman (input) for mailman id 516226;
 Wed, 29 Mar 2023 11:54:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phUNl-0003n4-Uh
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 11:54:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7349dcbb-ce28-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 13:54:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GVXPR04MB10022.eurprd04.prod.outlook.com (2603:10a6:150:11a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 11:54:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 11:54:22 +0000
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
X-Inumbo-ID: 7349dcbb-ce28-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bX8MtrFvAur4wzUO7TrqTmwp2fW0u0U53DAlhs8YuXrO+lrdYfIAhQLpi6L10wnGOLCaD6fvmVOsLSFii4PSs/mmK3lXVr8NRFUSK4V/u0vcvEc9WUeuFOsieKRLNOb6SXOi58W65TUYiTV9AqjiUsyzkAInLBOlu7zoJRt4k1nFzcNsG4OJkoO9JlD4mObFTkrj7Jta0BmSFH8zg0rCDnk0xXKdpnJLpbBmDHqNQfAjVuzAiF9OnEdxfDjmDT+UYu3vqYjj4N5hvu8qBk/UWZrWfEEiQmB6/fipFQ2UEDwwnaotnZ/8dwaq5s/bqWlBosNlzDUKQiy6c5Ir44iznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yjruo/ZTxj5wgTIZ/6ZG/IoYP2xlo02q8YiOiFA4EYw=;
 b=oU9T/hwgZ7LheQdEjGLqFWf2UM+1gbuQshZRQwJE9h9GtCUWshqx4Yb21lufiXkr7UncYK8MVzsAp+AEzuxfdaH16OarY1LAuqONd4Zh2BbGZeszqzYgrRwM3GsG7OAyxdgZcZlol8/2VZheJ9mdBivjIMJ1ViDsGEapXkJ0Jrn/Zinf7CQPGgtzNjC2h5J779lfkpVrsYwalAY3uP8x96au6xVhbvu5Evur9S6ln1c2StmyGtTdxW4QGNVtCMj4yri/Qsur13Y/H4YmjdvHwnhEuqPh7H94Fy7QNzuJdCrjDCj8eRcfrpm+8enUhBnPpeq+Pg61ZlibaU2yRryuVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yjruo/ZTxj5wgTIZ/6ZG/IoYP2xlo02q8YiOiFA4EYw=;
 b=dTNP1d+mQhXVf0DEHEgb/WmwqrdF70JNOt85oy2IVF/2U/CZk3Ef/M6JYc7323F11bevy8539i2cbjSZrFglZmhhmDWLR9jOlbe+JHH8ci8yhDYzrgoYBCbiO7aruGMBrV8HsCDUq1+/KJRzhZL/ssyb6GRjGA2L3q2Dos80SDoAGGrTMwGATCVhVr1ghqjxaSKMdWjGOOrfez17jd9OSe2+GDoG7S0eK+ZK1DUPTMJoX+IARQhbNwmF+/CboYn+0lYRdr5kEonP0DDUxO77uAa6KemCf0nhAVeczzECEhss0uep6c+lABzJ7ZZPSqKJI6qxhIodADO9RdRydl9vMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7bcf8cac-1e30-7d9c-8bd1-9d7283617b73@suse.com>
Date: Wed, 29 Mar 2023 13:54:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-8-luca.fancellu@arm.com>
 <2846794b-8057-2f41-3082-4d6c6fcd3f50@suse.com>
 <00BD9D2D-AB18-4D23-8F01-7C8151E6F975@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <00BD9D2D-AB18-4D23-8F01-7C8151E6F975@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GVXPR04MB10022:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0c1ac6-444d-4a31-d561-08db304c5657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g3RD0GWeWm1doH7XgB5FvYC49U0gmA18E+DpJ+VMS8fLbtFmd0ewE+1SVRVZyfCRfX1K73ecqtKqe56q3OyraDEHPocHTN/ZJbjiSCk8VbXhzSj4oqdEASEYi+L9sSyfBNshHguiympylyBBf9v93mfV8WqkflkZvnREPjyQyK2PbZSkIcNL+NBzddoPVK6KPZrC9CavbDqTCEPZYHX1VOV2lc1BxSYyLOan/N/dTtQUoFaGSSQdffhaOWz8h7dX5oW7u155oA8K0Lpt9ghw7F7HzZ4GeuqyXQxQJMY1S6zzF5WzB3opghLQ4FBMd4maIU2ntlM/f5ODH2MUNFz2R1O+xEQJdKqABrMtcrzaayjY/C+KnLyrSfxvbpXieKJ5QZvw9JBVYvHspXo0DN22oNbR028SmchT4C8xkGnFR/XGdpmpTzKpoaXOBqCTv2ZxF2kasjS0TpLG+zOAipqysXOcwVVPjlzk7fTSZx/EnXEksY/0LtzM3Re7Ykra81YxQElGEJhh5sOHhOU2GlM//z2NYrGJH4u9yEIzObjGVyYf8gY0XsE4+BOi5Ipl6skBnxJ54VhOFRtsgkFc07ThSN22L8kAetSX6Yf6w1NJfK1/iIR7NyIel+2SSr146FwqE9Q2HCiLGAIOdnnxrzeqjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(7416002)(5660300002)(8936002)(316002)(38100700002)(54906003)(31686004)(6916009)(41300700001)(86362001)(4326008)(8676002)(66476007)(66556008)(478600001)(83380400001)(2906002)(66946007)(6486002)(2616005)(31696002)(26005)(6512007)(186003)(6506007)(53546011)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWxGQ1FsUnovemxIS0ZFWUlSY0pwc3VzWTArK1BkendLS3dXUGNDRzFPajF3?=
 =?utf-8?B?T2luTnJvSXM2NkVWaEJjbEJ3Q1ZUSVYzRmlRSk1CU3BGOUtxQ2N0eDZ2TVVT?=
 =?utf-8?B?Qk1jdjBNVi9vZFRseXpOdDB5Q0JYbDNmeXdIZTNxbWpsWEZrb1p6WnpFTHUx?=
 =?utf-8?B?dTlMSEhpL29VVFZoRkhQaXkyK2tQV0lqbmRuaGNIT0dQaHhMSDZBY1gvT3Fh?=
 =?utf-8?B?cW1yUmVnbnFUSHJhcjJSeVNtRnVGTWVJb1JydEI1TkppRnpFMDFFYnl1SWc0?=
 =?utf-8?B?MGlIYnN6VmExaStDdUNTYmErYTVnd00rN0l5WXd1UmtLdEpKZVZHV0hwS0hm?=
 =?utf-8?B?MDFLME1Mc0J3VnZhc2lqRjMwamZLNnBydXdqSnlmREdJNThpdzl2VW8wbU1F?=
 =?utf-8?B?RG05OGNwcFFDT3J0ZUp4dEhrR1QyWEYrcTZhL3pYZGlpd2VtMklTenRFaUJl?=
 =?utf-8?B?VHZCRjlFam5sSElWVXczOXo2RkxSdnZlRHpMcFVTWmhqVTh5VmJzU3FwTVlO?=
 =?utf-8?B?Z3djaEhlaFI2U2pTQ0N3NFRRY2k5cVJpeFo3bWd0dG82TEVuSDd0c05tT3hp?=
 =?utf-8?B?dCtwTmhGTlVySDJrUUtYTmM1REp6VGJreVd6K1Bzc2QxTTYxa2tRVElXSkZN?=
 =?utf-8?B?NFloUE9SR08rb2R6ZFBKUk9TNVBJcTFOaS9USW5hK2dZZFgvL2VxVGlSWnpR?=
 =?utf-8?B?R3JKeDIvUW0yR1V2ZkhWRkMvK1ZNZG5uWXJUeDBERlFwaTlLU2toYndJbUpx?=
 =?utf-8?B?NWJ2c1JLeXdId0h3MnpvdGplVDVHU1lmQW91NG1EM05YUXIvMkk0cVpDOHpa?=
 =?utf-8?B?WVV4QTRUdytGL2txRDZrYjVWd0Y5TTk4WjQ2eHF1V2xudDVaR1BDbnF4VW96?=
 =?utf-8?B?cjk3dEtPckRZTllnRzhnR2FTeHZVYTdmc2dmSGttcDVXY1BEa0t5UFpWUkFZ?=
 =?utf-8?B?SzRBeEM3V2FpUStXNXhKbVlKMjdnc3J6NkxpbC9NbTM1UW5nVTdKK0MzZ1BE?=
 =?utf-8?B?L2VQVU8zSHQ2MVlYYU50NTJkT05YbVB2S3J3Rk9WVXlBSSs4UUJ5M1M2ZU1l?=
 =?utf-8?B?bWI2SnBsY3dCejRuVStDOHBZdVdHVjlmL1NueUg3N0pjNytxQU9qTWE4Um52?=
 =?utf-8?B?ZVZ6SU5Sc2dmMDB2cEZTSzVvdVlFY0d1T2RIUnBydTJSTWpOT1VGcU0xai9j?=
 =?utf-8?B?c2ZVY0ZsbWtGOTQyMEFsSmVNckZVdnBYUHRoZ25KYnphWmhnMTRQRnN6QWll?=
 =?utf-8?B?T1RnT3Y1V2NjVnNSbEVRMXhpMEFoL2hBbFpxS2psR0NXV0xTTnBQbE5reDkz?=
 =?utf-8?B?ZU5ldWhLMStveTlKU1pVWlF1L2VsZ0JML3ZtaEJwSFZxb3FLUUhoY3puYnRa?=
 =?utf-8?B?ajhyMUZJRHpMMWt2UlpPVHRpUitveFdNZ0hqb1FadTBnSWlEWVZZY1B5aHNq?=
 =?utf-8?B?d05jb3NtOVN0MDJLUktDSHNXbHIwRExESHM3ZjVlNy9OdEdlbVFvckVtekZ6?=
 =?utf-8?B?OGVDWlYyS2JQeEdYRjRLTC9aSTZncXRuMVlZVllpSit3dkIxZ0NuMFZwZy9G?=
 =?utf-8?B?eEl0TlZTTXUzdGh3YlJoRHlnN1llSXJ6YVhZTEdXUGxpNWVGM0I3M20xakJC?=
 =?utf-8?B?aVJ0WVorOVNYOS80Q05lNjFHRTF3bGh3aEcyQVhsMkNtcm16aGlXNzNWbjJM?=
 =?utf-8?B?UFFFekNIYjZ3MmNSRlhXOTlIOHpwcngrRjRlRmJJVVJEZWk4bXRoNjYvbWZw?=
 =?utf-8?B?WjFuNzBLSkZJNFhNeWttSzRLNXJzOStMWUd4dVZacFlBaDN5M3NKaFZXc05k?=
 =?utf-8?B?emVyRTRhVUxLaDNibmUxOHNwb0wydFZoNDJDZ05abDcxSGlTTEROQ3oydk5Q?=
 =?utf-8?B?TVN4MEtObzlKN2ZzYmhoU3F1R0tEbWRUUHhweE1NU1hldGhLL2ZDcmJLOWhD?=
 =?utf-8?B?MlVPNmxXNXlHdk5va1dMV1RiQ21NSmJQaWRXTlhtTWxwZldCOUhPbDkvUjlo?=
 =?utf-8?B?Vm1waXJ2YmJ2SWU2QnR6aDhuRkNwZE5MV0tvUW5ibTd4Qzc5aWc5VHY3MlFP?=
 =?utf-8?B?a0xXR1c3bUZPc3hQZlFWWWlPeWVCTFMxT1FGWmlHSVNQTk5QWXJiT204cTMr?=
 =?utf-8?Q?bc1bgLK705kZG6A19A1egDTOO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0c1ac6-444d-4a31-d561-08db304c5657
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 11:54:22.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88Wgq925ZGEy03ljg9nPceWkOibUwLwAO9+x8v+JPsfW8urjkPn8Ht6j9qPNIHkTLDUieoxgUl231aJh2mFZoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10022

On 29.03.2023 13:48, Luca Fancellu wrote:
>> On 28 Mar 2023, at 11:08, Jan Beulich <jbeulich@suse.com> wrote:
>> On 27.03.2023 12:59, Luca Fancellu wrote:
>>> @@ -838,6 +838,18 @@ Controls for how dom0 is constructed on x86 systems.
>>>
>>>     If using this option is necessary to fix an issue, please report a bug.
>>>
>>> +Enables features on dom0 on Arm systems.
>>> +
>>> +*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain and sets
>>> +    the maximum SVE vector length.
>>> +    Values above 0 means feature is enabled for Dom0, otherwise feature is
>>> +    disabled.
>>
>> Nit: "above" suggests negative values may also enable the feature, which
>> I'm sure isn't intended. You may want to consider using negative values
>> to signal "use length supported by hardware".
> 
> This is a very good suggestion, do you think I should restrict only to one negative value,
> for example -1, instead of every negative value?

That highly depends on whether there's any foreseeable use for other negative
values. I can't imagine such, so I'm inclined to say that "just negative" is
all that matters.

>>> +    Please note that the platform can supports a lower value, if the requested
>>
>> Maybe better "... may only support ..."?
> 
> ok
> 
>>
>>> +    value is above the supported one, the domain creation will fail and the
>>> +    system will stop.
>>
>> Such behavior may be acceptable for DomU-s which aren't essential for the
>> system (i.e. possibly excluding ones in dom0less scenarios), but I don't
>> think that's very nice for Dom0. I'd rather suggest falling back to no
>> SVE in such an event.
> 
> I guess that with the introduction of a negative value meaning max supported
> VL, it is ok to stop the system if the user provides a custom VL value that is
> not OK. I remember Julien asked to stop the creation of Dom0 in such a case on
> the RFC serie.

Oh, okay. I don't mean to override a maintainer's view. I don't see the
connection to assigning meaning to negative values though - preventing
successful (even if functionally restricted) boot is imo never a good
thing, when it can easily be avoided.

Jan

