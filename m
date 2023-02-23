Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5257F6A0611
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 11:25:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500167.771412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV8mK-0004au-2v; Thu, 23 Feb 2023 10:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500167.771412; Thu, 23 Feb 2023 10:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV8mJ-0004Ya-Vo; Thu, 23 Feb 2023 10:24:43 +0000
Received: by outflank-mailman (input) for mailman id 500167;
 Thu, 23 Feb 2023 10:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pV8mI-0004YU-Pe
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 10:24:42 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe02::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 489227ac-b364-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 11:24:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9346.eurprd04.prod.outlook.com (2603:10a6:10:356::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 10:24:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 10:24:40 +0000
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
X-Inumbo-ID: 489227ac-b364-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ld/5+dwU0/TSqRB+1VtEPy+HpPUhfrIZu8GHw03uV+2we7bBj3CZP1NF6pkdgN/8TWfc4YemDPZhV8OeSGhnMMP/ljZmT/fqjskZ9yxI3KtNimHVbH/lBcQdO4Daf0DUZspYlj7YmLUIcB1BPKhCPasts2yw5EbpmZlrUBarbI87EY6A1ttozasN8rDRLXaclGMzRsNUO2w9XZm0oJmNpNMu1Fi8MJUxl+kSRntl+H87D+2eKPRIZBa6e3ZZ3uSpLdzmFQB+zyOH9KtgmNydrkk9/fckKm6JTDQjEu0HFhrOjOH2hdcKX4Y+m8b2PBOF9WJeig9byAwUfak+gJ4tow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdPmr0Ymv7jB+hbnKCLpkii4YUjDH6O4FoQfspvTSgY=;
 b=RTJRuhh2vmlsDy6vLZulPvwjBYCAkvSfEIK1565UH/q6YQFKsNQbwhCjVRk2kj1szh6qfwR0uvNQeaJCU316W4hbG28zp+a1QnDYU4Q4t0qVcYsoP60KYs3nzCi4LQlY9pxdALrZS/EOSxY8r/XNSwGE3za56r40+GvHfuhqy93QJyosqePFF41Mpfm1DuaMjKdfvE+AewHVZInQWuJ+CT5Wgrx3HTlMAYAyBFISYORKS46ZfV246o+TIdDj9QunQE66U4bQhQAoLRCg1oa3XzysIheqPN23ZR2UKbwKT0u4q8pSp0sbPdiTFaRf2VNdst2lwQtMv8/vATR7uLpEhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdPmr0Ymv7jB+hbnKCLpkii4YUjDH6O4FoQfspvTSgY=;
 b=OH+8h+AB7aoaxEK1Jpbjyq9q2KOSjnEi/qs76dg9YSjzFQsYmrsVDNBkiRP71ERv6AFgJCn65m8J2zOgz+TyYY5uvjtBH8txl6Bu3TPQE6oJBjKp0LGulA2ppSWeU3TE+1pCft0kZPJHMlAMYPzh++xDVBK/3wEfeQBkp7Y2Bhgb9/QONrmaGgNjWl8VSxBrt/IERZPWvdAUWqbRCPTQ8QjQLo146GqDW/4fg6kQk9/ponm9z4Ndku83KFwFxf1R7/8UIoc6mgIyvXp57ZLJOF3fcgBV2PN8Pz39sQYV1nyTmSq2rxbEdOE52c9EZM5eXQQhB9zyG/ufB+ZWzmSt+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6dd55cca-68e7-1bbb-54b8-7523a1e73b4a@suse.com>
Date: Thu, 23 Feb 2023 11:24:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/9] x86/svm: move declarations used only by svm code
 from svm.h to private header
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-4-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230222120023.3004624-4-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc406e6-6305-43be-31b3-08db15882bea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lkq96qZtLZa/itT0YkA54khqzJ7vTe2dUOllzHh9Y6rqWgmpXSp3/8yAibkyZwGrNAA45V/c5SFyqleZphuGAMUi7L/BfVkK2yZIcOwerhdDuqqa+cHRyDON+ekzgsoUkGHR11NVPm+ZNL25YgYTNBwzIPKwSdFtsi0DgcANfZPCPz77JmKpERTmrX5tiZgn0Rq2SClONz0+7VH4GK4gF/1BOpc2V3PoD8EL98EGB46lE6Xnp9VsNBDYo0pP/YltecVr6tBl+1hWUbCJhDX/2xAiiNvpyLLRAGi1NKEb6Wyl+xcO508Dv52M3lu4qWvGTYflxOL8TSXx8GjnkRiQegkUWV68Oud2GEGU1B09C4QVQEG14kBskr7wHDKIOOrUcvVG/5pmEHGFh2Aca8wYwaqHJu+dUDqXP+sDhGugYGp9adtS38/aBOI5NG8JhPTUoOg2e8NGbH6/ph31w7reyC+GXgz3z3vgiS+yI9CLGOkqddNm9vUoptqU13pUpizarGvQkGYIcx13aDBVKxv3L4wKAZbfNqpXVdWk1lh/JtiCX6V/ToQKkewWdHVJ2tZIAR2lfvRRKCETSi+yVHeYXyHB8TaqBHPt00tC1exB2b2qGgenjJlHsmrxohD+PSiCld/ak7F3SwMKH7CIO23fQrR8MhszjxIZkZzkhysZxgvyxkfGv+KwFcu2AXvaQuICUMPWOgjk1GIzMTEW/xNoHMXpREE3BgIAgtgITDYzWyY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199018)(38100700002)(41300700001)(186003)(26005)(316002)(6512007)(53546011)(6506007)(36756003)(54906003)(478600001)(2616005)(66556008)(66946007)(8676002)(66476007)(6916009)(4326008)(83380400001)(5660300002)(31686004)(6486002)(31696002)(2906002)(8936002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckEyQnYxUDFmcGkrTUk1bTBFVWhzODFRV3VRYWdUcVNFSWxldTNZUFdXSFNK?=
 =?utf-8?B?L0VMU0FMSTJ6STRpVnpNeGR5Uzl5ZTZMeS9paTRqOHVXdU0xUEZ4dlZvUHJ1?=
 =?utf-8?B?SU8reDcvZXQ2MVBzMTljWVh3RjdYZDdubGJFNVRUbTlsMzdZVThJaXlxWVhF?=
 =?utf-8?B?YlVLQmI1VnZ3M1F5aTUrODdJSlFLQVNNaGgwOVM1Mko1MUxnNlFzZ0VMclhr?=
 =?utf-8?B?dVB6dUppdzl0U0xoak1TK2ExdU5WVjkyMlB2MU1tWlJiY0JHdk9pZ0M4R1RV?=
 =?utf-8?B?YUhaQU9zZlliT3hqWWJEdWF4aXBBclJmdEtHVm1mS3ZUbG9MdWpKNnVvbWRU?=
 =?utf-8?B?YzNmVVhTdDdHM3p0N0FvMjZmYW5XbDliMU9nWTB3Zm5FRitnRVVlUmZFbEFq?=
 =?utf-8?B?RG9aQ3BLY0U4TWt2Z0k4RGFqVkNDSTRRZ0ZEQWFEMytKSWtPTVFTQ0N3Q3lt?=
 =?utf-8?B?dWxGektPQzZTN011R2lPVEVZSlllSnByakx5cGlCL0tvVTdrSWxreVBmUlpS?=
 =?utf-8?B?VEZCOWlMVXU0TzZuSFBHWnI2QVNCVWRFS0JWYjFTMGdxQUwzUldxcVRsbmNw?=
 =?utf-8?B?bzJxc2ZEbmkwRm5pdTkrR0N4ZERQbzBIakNyLzlVY2hHV2NSNUYvOGQ4QzN1?=
 =?utf-8?B?K2FSa1JFLzFoUHJxR1JzQXEyOGM3MStQNkM0VHBIdmNIUE9hMjMvbjZmaVFV?=
 =?utf-8?B?cnVOMVJXVndhdXRaSUNoK0ZlOGVmMkpuRWlxajZ1TEY1NURtVlpaSHBWNmZE?=
 =?utf-8?B?eUx0Z0VvWTlXNFcxNG9xZjZmSHpiYTNtVktISkFtdW5hbGhPZGZlSWZrMXhM?=
 =?utf-8?B?WGN1UnZvQ2ttbm5leW52VU5zU20zbnhsVHAxdWlaVGFJT0hQNlp3YjZzREd4?=
 =?utf-8?B?eEdBUkFpTjNSK2RFeGJwUE9TZmNReDJLdFRtZ2ZXL1JPdHIrcG1pVmRBaE9y?=
 =?utf-8?B?Z1I4aStrdjlRMFNtaFArVnUrcEFva2xmR21ocTRUY0ozSWd6TUxjR0RDc1dy?=
 =?utf-8?B?L0dHejBDNTREYTl2T3U0TTFHVnNVdDJ6T0V5Y0V2NkNPOU9aVERXdXZzWkRM?=
 =?utf-8?B?NWNiQUh5eG1aclo0NWR1NjNIY0h5WEJuZVovaXBoREZtV0Q3K1lEaW5hTUtM?=
 =?utf-8?B?K214RXcrNHp1OXNmZGtrcWdMbGJUTDNpR1ZwaVFLQTc2dTZNZE85T3ViRnNo?=
 =?utf-8?B?QW1qZjRJVzZhUFlJRWRETFRFOE4rNXEvN2xVS2xXSGJscldFQ1U4V3lVSTBl?=
 =?utf-8?B?SThsQ0F5WUsyQjdGTTI5bnlPbG1QMGk5Vmx3OGREU29ieDNiZENlQXVrQ0or?=
 =?utf-8?B?dlRQdG9DVU1EaVdycHdCbUZOelFxWWt5YTZJUlE4S0xkbFF5MjFMRGpNWEVq?=
 =?utf-8?B?b2ZsaGoxaHFMNGxZRkpOTHdrZ0Fqdm8xQlpUYVl5Y1p0V0ZIcThmT09EZmRk?=
 =?utf-8?B?QlM1WmpFbExMWGNIVlVDQ2QrV01HRlFuazJRcmxHK2s1N09JVnFIYVRoL3dI?=
 =?utf-8?B?WFphWnhRZmRWVUdwSGg4djUxaE52aXBabS9VelcxZmpla2lNemVacFVjbkQ1?=
 =?utf-8?B?SkZkSS84eXBoZmpCTHRIZVhzYm93RmdHdGo0cnlZK3B2dkYwK3RiMXJGc2Jy?=
 =?utf-8?B?L0FSUklBU0lqRjZLQXk0c0RCSmhNbTZHZzlNODFXKzhHTnRod1hKOXBQN2Zp?=
 =?utf-8?B?QXVYVEEwZnp5REFVejBSRHNkbDV4UHNBK2pQMzdyVEpDcEVQZE5uZ1FFSStq?=
 =?utf-8?B?anFnS21qMFNxODBFN1F1cFlJWWh4RGNabXUwRDVKbWorRnJwakRFc1hJbU4v?=
 =?utf-8?B?a050bjFwWktFQWNyMW5rWXExNWY4aVgvR2NGdjRRV29ZaHp5dythUG95WXlp?=
 =?utf-8?B?d1RieENLSnVndzVhZkJnM3JzQW9HemY3RnB1ZkVVOGxmMUtXS2tWV1g1a0Vp?=
 =?utf-8?B?c3JBaHBlbHE4RDVuWDRsVlZCcnFnUlBrbVhwczFGakRvbCt4Um5SaW82ejBC?=
 =?utf-8?B?SU0xbk5pODBleVBIeGMxU2E4NWpGakJyTnUvZVA1VWZvVzhuenBueVNNUmV6?=
 =?utf-8?B?bkg4UGJvTHhvME5GRExFbGFUZHJVWnFiODEwUS9lRXBxZmdtV2xGSFpMaFNx?=
 =?utf-8?Q?9CEMAtB8HMtU5hnJNFZb5PrRx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc406e6-6305-43be-31b3-08db15882bea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 10:24:40.0811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jkyou6+bmMeXnxsWvzKpGZh8eSg+Ik19us0RNIegnKqTtFgxb/ukHK7aBPqzJnbOo+TJnvCZzst3YtUJfOOWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9346

On 22.02.2023 13:00, Xenia Ragiadakou wrote:
> Create a new private header in arch/x86/hvm/svm called svm.h and move there
> all definitions and declarations that are used solely by svm code.
> 
> The function svm_invlpga() stays in arch/x86/hvm/svm/svm.h because it is used
> by arch/x86/hvm/svm/asid.h.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> Changes in v2:
>  - new patch, the creation of a private header was suggested by Andrew and Jan

Same remark here as on patch 2.

> I have not added #ifndef guards as it is a private and it should not be
> included by other headers. However, this is considered a MISRA-C violation
> ... I 'm not sure what to do.

Personally I prefer the guard-less form, but since Misra insists, we may
better add them from the start. Besides being a little bit of clutter they're
harmless, after all. My ack stands with or without the addition, but I
wouldn't want to add them "while committing". So I guess we want to wait a
little for further views, and then either commit as is or wait for a v3 with
the guards added.

Jan

