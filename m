Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9C36C2E1E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 10:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512278.792160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peYVI-0002ia-AU; Tue, 21 Mar 2023 09:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512278.792160; Tue, 21 Mar 2023 09:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peYVI-0002fZ-7D; Tue, 21 Mar 2023 09:42:04 +0000
Received: by outflank-mailman (input) for mailman id 512278;
 Tue, 21 Mar 2023 09:42:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peYVG-0002fT-Sb
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 09:42:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1484807-c7cc-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 10:42:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7914.eurprd04.prod.outlook.com (2603:10a6:10:1f0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 09:42:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 09:42:00 +0000
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
X-Inumbo-ID: a1484807-c7cc-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQZiM5Pcw7mo+yXvW8A4n+gpI0GlTK6IKkibvEYPSMpAudXewQuFUjNGcWTFOPZm1DLPgqHUrafju+aNcUYo+eG5/YYmf1UqySXcc6N3VdW+g7yowx9aNmyrQXEagP9d5jxQwX/cBlNTUzq7nZvDifbWS6ijDf7RMXpWnypTOweAtLtm95RGe3cPoVg7aG9J4CJxATu0WP6JPf+MRnSGzQJ9pikoEnoYZA2Ls/mkoXAC3Q5mTpOBHJWcJd7E/tyfJf+YwEWGJrSdvgdqg1pJjMtFBiGoTHWT+p+31TsUUrnfZLvRpZgafjRU2jfgLPJViuXK7Tug9sQF9Y01KCj3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRLETKrmPFmeuv6Msyzw0vYfmB3716cf/eITO9505cc=;
 b=aB+2Aw+BWvX5TNGKCqkWC34dDiCVWKdeTmJfWwVja/ufbAjgsoZkrQFWohBJcvjIyo/kEAG/08fSPH51P2dhIrbIWRWcPpYQEI0oMf7hL+qzssrPgRbDP38ucdrRvLfpMAES3MH4c8WxOGnuPFYDrABwy2BOETibI2mRBo98vyr/EMEgwJ0nm8uoen/q2YK85jz5WQaVz82XJpHgytCFOXWCDtvA7RUQaSnvOpjcbRQVAsvx7VmrcDj5BCRhqsMPs7hBIRPy5oDay3dw/kuFaG4HXoCeCktKeHisf208PP0zIBulyvK+ebDa9Dvn4loNwAZ+DQDRFGZih1dmWGitPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRLETKrmPFmeuv6Msyzw0vYfmB3716cf/eITO9505cc=;
 b=PaGdNBE0EjydYjpXXHH2yBBoZnWE08qwgQ39FfySNmHGKUchTOIg6sYSLMyuiqzEcNFjWfYzfYWBVbabH/ZyyxnXItAX7DbPgS2w/ViIh36v5vCBPe30wvitiZ8hDB2QkOlT/+cQcYnA1CGdcu9Uy1EfzEUBoB6ZilT550uxgBM7hEYghScEjy2nt4tkIOC8ksugDKbC5ghK91/rhSGgMS3fPlh6I65wVSXrEnx46RJPxjc/AVs6yzUd8kykSluBWC24OLA8mvl1QbmmDIBR/ZawoWvVmwHp8SbnsDh18WBs7MaA1Y7qfaqkFNnKQXI3Lzb9zDTzPh4f+o19BgW7bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ace92506-fd86-9da4-aeb2-37a80094d02a@suse.com>
Date: Tue, 21 Mar 2023 10:41:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC XEN PATCH 2/6] vpci: accept BAR writes if dom0 is PVH
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-3-ray.huang@amd.com>
 <8adfeb57-1ddd-255d-6d93-24a74b463f59@suse.com> <ZBl6iU6T1CsWqVx9@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBl6iU6T1CsWqVx9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b5040c-0253-4362-9cd9-08db29f08471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kTklTb3Jr76GkjlkNDIV/2oJA3NTd/e4meIO+VDMJ7B/CJ9UosgVnqDY2lfTK+siiOWfyOtmQ0YIchJRlPqVUKEjPm/YQum9xz70+VMFoQff0qWeeQxCriO5AVx6arwSwqqyehwhIPzhAp3mod/U6gfzrUApvKkWoDAgmTj+DQv7XiJy8xToUg1CUr47lXMzohVG/KYGly8kqK1O6Co2+GzwIWT9hM2OM1fZEULjXWzq/dzZ4eA6OoNszznyBldUtfowzt5r0+E7eE0mRm4tnE1+Qs97ao+Mjb3dVDFskyrfvBhBaCJSLli9vPL6DfkfkqepftxxsDAVy3i4P+qcoXQn/QVzdE4B2SovBYwn9jnK/n6aGELVTTkpPLL8G8envsUaYyoqCEyohGVEregmF8X4jr45YdyxwTKygGWK6hQzELSvzs7G10+PWMsQXH7rv8QWOoahJOUl71td/d75wDvb5qdDpQ+iKyai7c7PZQKa67cvvenc8VBZTatoHxJ/G3tbU1OZ9mfWT3aoiNwdFHTiFU/sHUH3nE31BY8BaXYoUnqLO+nqle8oDDJ1BjUtWK6yrNNUtZxNqGFz4zz6qENTY/LGHhNy8qgGzRWnkipcvBrAD5Nd15snivtJVXWvM9KaPYbb0JbtyDz0yq05WxcKO9pbOp02n+FsHUFbzNLINBaB/x5WdWBWlnUobrg49QiQ24DjlWnRCXJzsXPqRM7yeixNUiDs36s1SWUkmzg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199018)(31686004)(2616005)(83380400001)(6486002)(6506007)(6512007)(316002)(478600001)(54906003)(7416002)(26005)(6666004)(53546011)(186003)(31696002)(6916009)(86362001)(38100700002)(2906002)(66946007)(5660300002)(8936002)(66556008)(4326008)(36756003)(66476007)(41300700001)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1RidGFtUDZ5akMwOURtbVJrZE5lSGUzcHVEZzFqYmdyTTFOVW9vclBsZ05N?=
 =?utf-8?B?OTlaOTYvV0VWV1JqbGVOYmRHQlFLTlBCQ3R3dzh5TTRWMkRpYk1hZThnNVdm?=
 =?utf-8?B?K25zcG9odUNRa1g1YmRvQTZXbjR0SDYzVnVxcWdvaW1OWTlaN1ozMmtJT1da?=
 =?utf-8?B?a3ZiaDRoU1hCNndQeUVwN0o3QzhaVTNodTYvQWtRMHJrMDdHaS9xVk1RUEFr?=
 =?utf-8?B?MHQyL01lTHg5ZmFlNGxEcFV1U0R6OTdaNTE0bEJGR2NkY2V0emgxb3Q4VjhY?=
 =?utf-8?B?bXBNeHYzem82WlBycnlyRm82TytLdXZ4MlA2ZmZ2a0NrODFXaFAvZUc1cGNm?=
 =?utf-8?B?MjZYQm1kK0FmUzdtelNIVW5ZQk5idzJzQ25xZzJYM3czMWZJSGNwZlhrRGZP?=
 =?utf-8?B?WnRNbWFlWHV3L2hiWW1Ra3JWRnB6T0RXVzMyR3JxZHdoNTloRXd5a09GWkNq?=
 =?utf-8?B?MUI3WmtRdVNVbnVobDB0cXdXUDhpMzdtcGxjOHdCQkR1YlNwajFCMDFSRGkx?=
 =?utf-8?B?ZXdGZVNpVXd1QlZJQnVZK0R6d1MyL0tUNVh2UnVZZWRTOElVc3dPRjBncmZB?=
 =?utf-8?B?eGlJd3hFckg4Y1I4aHFBSXNudzRtanRFU2NzUVNWRUJMcmMxZ2RtaVdrUUI5?=
 =?utf-8?B?R2c0a2VmWEE4VGtmV1ZQL1EzNWlXdEpIQ2tpR3JzTFdudHQ3MnhmOHRQV21E?=
 =?utf-8?B?b0FEMW42VExHSU0ydXhwekhIUU1nbDJrbTBZRHVoUld4MkdnZnNqcjlQaG84?=
 =?utf-8?B?MWViR3dFYlBoVXYxOGNnK3EvejdwZDB0R2VaTmRCYml0TGV2enRpRHcrY0pq?=
 =?utf-8?B?VUdHblZzSFJ3c3B0Q0FqczZZOTN2QVZ2ZGJDaGJFZ25wVFJCMTQ4emx4ZXJH?=
 =?utf-8?B?dTdGTFZSNWFoUWhLdUU4QlNFL1JiUGNUWGZzNWl5NENGRTFuYURtYk9LS3Bp?=
 =?utf-8?B?U1lmWGowWlU2aG1xVUNrdVlveWdzbkljT0g0WFd5YW9wYW4zYXI2MDExSVI2?=
 =?utf-8?B?dDBLL1p4ckpJSUp6bjR3aGFkV2dtM1VJamVmQmdmdGZyYnlKY1d4a3BTR1VR?=
 =?utf-8?B?Y0gvZmJlOHpMcUxQNXdJVnNPdWRrTDIzTWxMN21CblhiL0Vad1d5aGJCOWVx?=
 =?utf-8?B?QmM2UHprRER0Rzk0MkI0Si96MFBRblEreU91RE9nUmIyUit1a2JSRnBEdy9W?=
 =?utf-8?B?N1hsU3BzN1VScUJnYUEwdHdmTngyVXA4WWxWQklISElySVZMRGdrZFVSejlB?=
 =?utf-8?B?elNvQ0F3ckM2S0J0RzRlU0d5Tm5uMmdabHpESE9uYWJ4dGpMeDVseStUd0hJ?=
 =?utf-8?B?N2xSNHltbVZubVgrSkJRU1BxN0xFbDdTejNDNTROR0xBWGVoR0RuV3h2OEtt?=
 =?utf-8?B?NXRsM3E0bjRyOG1TRTg2bE5kWGdyRWY5ZndsMGhvVnE2N0FaSlRra2QwSTZp?=
 =?utf-8?B?eE9lckFHSWxkeFRDWWU5YjUyWklZcDF6eFhzOHpiWTcvaDczdUhUTFRNUzV0?=
 =?utf-8?B?V3l6QSszMTVUZGJPci9zdmpPaDRNZVlMS3h6SHhhTDZ5VCtvVlVIM0FYcFpy?=
 =?utf-8?B?c0NaR2liYmQxZktQcXVGR0hYb1JCZmlZeWZWQ2lwMEhwMUF4Tm1OZGtoaTJ1?=
 =?utf-8?B?WGRka0ErMnpndUI1QzN3TEdlSmZqZFRBcmpRMjNWc3Z2SjBRL2FvRS9FMmZ2?=
 =?utf-8?B?d1NJVkFVMTZ4WGpXTWFhS0NKQW9QbDFNcTdaRmE0amJJd1JwTGhtdFB3YXNE?=
 =?utf-8?B?T0pwQXhGbGJpZWtmMmkwdk5Bd2dZb29qdnZXZnVSbHl0eGdiMlljUTBqbmZu?=
 =?utf-8?B?UGQrSjk2MjNwcmNmNXRXaVE5emxIZlZickRFQ3VLRVhrYjlMQi9NUWdxM3Q1?=
 =?utf-8?B?L1EvaThlUWM5WktpUzlTSSs5STYwUzVyVDJvcVZEV3c2am9ldkN1bklQN0Ns?=
 =?utf-8?B?cXdRRktZZzUrTFlIcU9DRGpOa2Vwb1RDU2hPaHBHb2wrb20xSHlkTVdYRmVo?=
 =?utf-8?B?KzMrVDVPeXhyckplMDUxRmJDdGc4cTM3eGZSNExtdXVLWVdMVmI3clR6LzJj?=
 =?utf-8?B?RWp1Yk9CUi9INDlJM3FTaHRkT0NSWmlibmU3cWltNXpKejVyd2RkdzF0Lzli?=
 =?utf-8?Q?FuRvSsdCvYTCsyndlbngO5r97?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b5040c-0253-4362-9cd9-08db29f08471
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 09:41:59.6485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9nZDQLIPCRsU8DGkUH8Aj97SsiTB6A5hFBzDsmXAzxQKE6OSciJ5/kaxpoUFPbuqkhafb+U0W4lWM1oUZQSxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7914

On 21.03.2023 10:36, Huang Rui wrote:
> On Wed, Mar 15, 2023 at 12:02:35AM +0800, Jan Beulich wrote:
>> On 12.03.2023 08:54, Huang Rui wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -392,7 +392,7 @@ static void cf_check bar_write(
>>>       * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
>>>       * writes as long as the BAR is not mapped into the p2m.
>>>       */
>>> -    if ( bar->enabled )
>>> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
>>>      {
>>>          /* If the value written is the current one avoid printing a warning. */
>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>>
>> ... bar->enabled doesn't properly reflect the necessary state? It
>> generally shouldn't be necessary to look at the physical device's
>> state here.
>>
>> Furthermore when you make a change in a case like this, the
>> accompanying comment also needs updating (which might have clarified
>> what, if anything, has been wrong).
>>
> 
> That is the problem that we start domU at the first time, the enable flag
> will be set while the passthrough device would like to write the real pcie
> bar on the host.

A pass-through device (i.e. one already owned by a DomU) should never
be allowed to write to the real BAR. But it's not clear whether I'm not
misinterpreting what you said ...

> And yes, it's temporary workaround, we should figure out
> the root cause.

Right, that's the only way to approach this, imo.

Jan

