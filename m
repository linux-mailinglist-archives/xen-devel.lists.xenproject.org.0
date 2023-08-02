Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4998E76C9CE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 11:48:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574848.900465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR8SV-0003I1-Tu; Wed, 02 Aug 2023 09:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574848.900465; Wed, 02 Aug 2023 09:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR8SV-0003Fw-Qw; Wed, 02 Aug 2023 09:47:59 +0000
Received: by outflank-mailman (input) for mailman id 574848;
 Wed, 02 Aug 2023 09:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qR8SU-0003Fq-Dl
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 09:47:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2089.outbound.protection.outlook.com [40.107.7.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8ab1ae8-3119-11ee-b25f-6b7b168915f2;
 Wed, 02 Aug 2023 11:47:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Wed, 2 Aug
 2023 09:47:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 09:47:27 +0000
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
X-Inumbo-ID: a8ab1ae8-3119-11ee-b25f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiwyOlrehs8Xq5TOXigJ3qKPE2QnCX2+lWyZLN8xkJlIKyPUuzvT0+30dgnOzkRu6J1wXo036y55XkzuyweRnp5ODHuzfCG3VAKqedVlhkBAYy5iqsQSJCWWdALDseD2UX3oIsV5SRSbMQu+D3j577zilYAmhk7yuCMUQwD7zl5K8DoxZQd35CsDzhTFgJPi5BE6HIyUylSpxmG1SH3LcYmduIIxVORGSFZvuAhORPsFqqxaF5rEDRLVo35hQySsF2/VhBtudBLjirCcdWUbJiqDG2N9cPRQrSD/yqmM+kCRex1E+RugNqZrnvNVG/IK1jTxNDJoohiIEJ1Z4aFFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPHQI3HV/ISYU//I4owjCgl9bftVPfSPRgtTkcbD1a4=;
 b=ejHHr0kpLipgxDxhZGoNC425P4F+SWhi98ZP9tQ0PNOy+mPoZxdM6CAO5v0zS9IJ8Uk9vlrh2Phm2QV/J8GQmLjpjKMiBDUSDnIV2nzOtC5RzRF4zRqkXxZi9ayUlAFZTahGskQNyVtSQD9oiwdSEQmq62g2bMPFAXrOOUszm7XW/P4TblwxFaf9hKxj5SxBB2exBiqcPtUwsEuMXdde0WlsadfX+4Tjf/8gegjO5S2+GoJQ5wRL34XFr/zBxZLZ0DvRLMkYvOTfK9qf5GijfohJslbBbC/0O4gNNN0MhfCEiy5F/51lR5X7OUxmWNfuDumcjZE9aK/Qvv/Ljr8U0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPHQI3HV/ISYU//I4owjCgl9bftVPfSPRgtTkcbD1a4=;
 b=HzF/HckZPqZ5OKtUxZ5uV0P+0M3pw7LVHMAuhnXEOig+h9kKuGO/rMBowWIdId2SIQC6uqsAL5kZNao+245yCvC4DJcNX9AY6f0F7MCEMoM4qAZ2xI+1Jwk1Cr6trIT/lhq6Zr5UuaX5qOsia0fPpGor9pJm1iN5MJu9dJ/1ypmcG9Fq3jX//vBgM+p4zucZ+VKTcS0rE2uPx2vM5mOfo5nnN58sh3CDzR9pL7FgWE8TYOBqVtJLp4bMcVdXmNhviFKtNj+L/4qm5fMw0lWwyuRDTv+McjGJ0VBJ70+56MK/yTE1ufjxo1/s1CgFj7d6myXpI8EU0aLpdeo/o/ymgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ff38731-fed7-91eb-c933-28d191fb429b@suse.com>
Date: Wed, 2 Aug 2023 11:47:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v2] x86/cpu-policy: justify a violation of MISRA
 C:2012 Rule 1.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <30fdada8b08b2060c6f1ccc2ecb06d418efd97b0.1690966632.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <30fdada8b08b2060c6f1ccc2ecb06d418efd97b0.1690966632.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8646:EE_
X-MS-Office365-Filtering-Correlation-Id: d95b31ab-3168-4b82-a6c2-08db933d7b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pw09r5ais+37lVtH4pr1aMBUQkmQmQxhYOzpaQECiPxWk2SF/odSruzdxik0hUZYsU+Xxcpbg6b8sgULq7EqR0oSrJnZgVTWV6T4RHMPrRGJWowNWLfpar42xcWK6SVhvjCiiiMajev6l3YIBPU7nSYX/0eVX79JrenYi5oGFQUHS7YNjO3JmieJHMUX/FfvH+1Z/eBKMioL76z91HqDUvpxCDOavhW/pzQWruY73hwrVigkkEGWSJiSUyHmT1/c2mx/cB4iY4wxnCyrX9ATDG2ychRDGRZTr1QDP/LQPPARfijftPqo8fw8n+iF4Bk5P3H6NM5QdLQGh/YQ6kHLLTJJm3z9UKWz0uR2nmcim71deZ9MB7/qQt4GDWwcfxDOvr/zZUjtTHoyrV3tyliWbtieSHVntZRPghD0egLdI61T7NTzm2TKMMY17SsOfy0BMBuU2Bu/VYitPf731UmcIaUYJZKDDl+iThkaciuM16Eg6fWL4pHe0aYRbUTspwXEoe+9qSdbfn7EqYmkZLaDicwULV+yYcgFxmoRnn407BY4lEFc4CAzv1F/c6SDD0Oh3NgX4oh0uT9pl7oWfsNuWW1tud+fvqPwDsRywGqQDizYnczaikUvv/+5pAGc/eKf4MRJOOjftBi4pem2n1awUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(4744005)(8936002)(2616005)(41300700001)(8676002)(5660300002)(86362001)(2906002)(36756003)(186003)(7416002)(53546011)(6506007)(6916009)(4326008)(66946007)(66556008)(26005)(66476007)(54906003)(6486002)(38100700002)(31686004)(316002)(31696002)(6512007)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1RoVGY4Mno1UXBhM3FHcDZKb1dBbjMxaW1WWVNXR2tCWit3SXRkMXV1YVlE?=
 =?utf-8?B?K2dGbFZVVXN5dXplSURlZTUra3dnM2hiZGFyWXlVS0lzbXZXcnR0QlY4ZjJQ?=
 =?utf-8?B?Z0hWalU5OVRjYTVmNzIwU1NLN3l4NEpYczlVV3RoelpBN2pSU1h3aGFKbDBT?=
 =?utf-8?B?SGNJR05uZENBM09abnhjSUUvNFdUSUJzWkJpUFVVMlMzZVBlUE5tZzlDNnV5?=
 =?utf-8?B?RjhXbTMwZXJmVVVRa0tCb3k0b3hGYVlQYjNyVXMxYy9nTGpUd2ZIcThEeEVM?=
 =?utf-8?B?c1BuOUIyRDgwaW9qTFYyMzNLdzl0MlIxZUl0MmR6V1UvMXlKeGc3N1g1VjY1?=
 =?utf-8?B?SngzYW5TWkhmaDhWQjdOSFFFeERUc1BSd1dqaHdaRE5ET1BlZU5jR2xyMTh5?=
 =?utf-8?B?NGxod2F5UFRTcWlVR0lFVTNJL2V5M09xMFYxdFFwMTZtY2k2T0Q3TldiZEtQ?=
 =?utf-8?B?RGtpUE1Ic1YwZENkWU5SV0lPbEpKTVo4eE8xT0pHbXREK3laOUN2V3pCNkJQ?=
 =?utf-8?B?RnNzM25nU2w0dnZuUnU0QWkvMy94eU8rbGphR01lWnpnYmh6MUQ0SVBtZlRK?=
 =?utf-8?B?RGU0aE5IYnRwOVc4Q0ozVmpsR1lNelVIRkdPM3JIYVM2ZTRoKzFndVJWWnp3?=
 =?utf-8?B?OG90UTVKbTNhZGlUTUY0RzFxUnZacG1iVE4xZTNESWZpZDdFRUFySWVLYTh1?=
 =?utf-8?B?bGJTbUc2TE9DL0h2dHNXVFNSY3FlWWppcWJRekVwbUlVUW5uMUx6SVM3OXFy?=
 =?utf-8?B?akE0bWNWWUZhVk1YemN0TWZrblJFbm9RcGEzWm9MVGk2UVBtazJuVTVQdDZx?=
 =?utf-8?B?cExzNXpxRWxIYi82ZVNvUkE0d0hJelNwcUJaUk9HcVM0TkdaamhTUkVXQkhQ?=
 =?utf-8?B?amJpWGFqNkFONktUUGJTTFdBckVhYjZOVXBHeUZYUWtyTHVwNTdiOTlPSnQw?=
 =?utf-8?B?NWpWQ1Bkd3dRNFUvMkttOGlaLzI3OWxPRTZZUElEckg4SDYrdURJYTVhWmQ5?=
 =?utf-8?B?emM1dFYzMUxpdTdIYTc0eVBNdU1RNEp6cGx5MVU4dTFrZVFBa1ZsN0liaUph?=
 =?utf-8?B?dEFzMlNTT2IwekY4NG1VaUZvMlZLc0hZWFIydE9zckQ2SU1FRTBWczNGZEZS?=
 =?utf-8?B?M3dIUFpMbTdDUjNkRXExclUyTm5JWHpCNUt5dXVIWG1YcDlIb01sekF1WGx5?=
 =?utf-8?B?VlRzNUlrUlN2M3VKODhadVVQMWttQUtHK2NvZmZmaDNpWUdZOTdnZTcvWGx5?=
 =?utf-8?B?OE5qN2RmSzFyY2t1UXF3UEljWGZWMnZORHFVMnh4RGd1b09ZZVRjaWNWS01i?=
 =?utf-8?B?TWtzRnNtaWNFU0JXWHdIeUFxVjdnV2h4QXd2aDdvYUVWbEZFOEMrVXVrWHg3?=
 =?utf-8?B?ZHZUODdVNW9GYzFtNVROUkhRaGF3UlNiUnJkcXFRZEgvRjVSVjRzQUYwSUF3?=
 =?utf-8?B?ZTRxRCtqQWN6VGNXRXc4SHQ0Z3Z4eXU3QzRyd05Rd1lQQnRqbHc3YU9FRkQw?=
 =?utf-8?B?MUZJUFF0bHJURG5kcDdFZHZOTHJjc3drZ1hNWXMxOFBBNzNQdTcrT1p6NU5t?=
 =?utf-8?B?eVhIaDQ1QSs0WHlQQ2JDNVQrR2MwaGVUTS84c0NtVG9EUG5YSmRFcUdZbVJE?=
 =?utf-8?B?THo1REo2bTBtcFFLVi9FQ0Y5YjQrMThsaWo4YlJobXp6dzgyNWVjaEJ0NnVQ?=
 =?utf-8?B?VFFxVytINXJWbjdFdlBBWHdUd0dBOWFKUG96SE1hWU5GMzlCekJuZmkvWVFJ?=
 =?utf-8?B?VWVTLzJiZUtCcUIwdFNoTXV5bHFhSUZ3bkcwNGhzNHRzOFIyejIza2d4VlVY?=
 =?utf-8?B?WUxQbjBxNk5RMHMwazloRVZWTzNVa2U2OUNjNXhraG0wWURLcVNaL3AzT1RP?=
 =?utf-8?B?S1pOeGxaS1JzN3FBWlZCT0Y2L1lpc3JscERBUDM0U0tTYmc5UDBGR2EyWGhh?=
 =?utf-8?B?SnpUc0pZSi9nR1dnaWs3NUliNmx2ZmpBbmsyUXlsRGRudFkzM1pGSGRYcXBI?=
 =?utf-8?B?N01qZnE2QkJPOVlxa3NsMnA0Qy9OVVRJWjVLOVZOQ2psVWR3dFNvbWUyNGJS?=
 =?utf-8?B?ZTJ2TUE1NU1DUVVOeFJXQ1JseEFDMGo0Ui9hdkI1cTBLR040YThVNXlFTVhT?=
 =?utf-8?Q?Ei7EfPCzyK8d/Xr3koIHO4cm1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d95b31ab-3168-4b82-a6c2-08db933d7b5b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 09:47:27.6135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4qNlHU7T3GI/N718nWUucc1wMMaU6+eb5hb0RmyjcUrzVDo/IrpJEIWUWzUW/gWrH9cLWTpUtvKH8816TaMNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646

On 02.08.2023 10:57, Nicola Vetrini wrote:
> The empty feature set 'str_7c1' in 'tools/misc/xen-cpuid.c' causes the
> struct declaration to have no named members, hence violating
> Rule 1.3:
> "There shall be no occurrence of undefined or critical unspecified behaviour"
> because it is forbidden by ISO/IEC 9899:1999(E), Section 6.7.2.1.7:
> "If the struct-declaration-list contains no named
> members, the behavior is undefined."
> 
> Given that Xen is using an undocumented GCC extension that specifies the
> behaviour upon defining a struct with no named member, this construct is
> well-defined and thus it is marked as safe.

Especially after realizing that I was wrong here (I was under the wrong
impression that we'd generate a struct without members, when it's one
without named members, yet [to me at least] only the former is a known
gcc extension we use), I've sent an alternative proposal. Let's see
whether in particular Andrew considers this acceptable.

Jan

