Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5312F6C0B8D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 08:43:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511738.790927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peA9l-00038C-UF; Mon, 20 Mar 2023 07:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511738.790927; Mon, 20 Mar 2023 07:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peA9l-00035L-QW; Mon, 20 Mar 2023 07:42:13 +0000
Received: by outflank-mailman (input) for mailman id 511738;
 Mon, 20 Mar 2023 07:42:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peA9k-00035F-5E
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 07:42:12 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b805c2ca-c6f2-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 08:42:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8277.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 07:42:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 07:42:03 +0000
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
X-Inumbo-ID: b805c2ca-c6f2-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJYIUMUa/50xCx6MNHPCewF2qNaCp7VxLTVrSo4uX3y48J1L8SE4a+ydHfwNL4sgnhdEeR+UJmZEtvq3J9vFFnKnOe+nEwc29ZqYMWkL3SSsnImmy2Req52PPl60/peEQTwq/n4F8WSauMQIx1JcgeDbyZE3M6yIHAx+EliRb4KE1dxDDTnTDCueqr3bCGgP/2yNT+oAWV9Fb4vRj/RJrhRURub3cun7luod/XMEcWMha+XBHPWyqRa/BKCuVqID0VK5G4vlG0zy89oZK7FbDAqT4rygdtxvHs0TZqoW9MpnS0ICvIRLnY8163IAC76hFpZKzRMZXteYQBji/WwOuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EajMCkr7SPzN6SUnrUxWhEhkAfE4DvCMO/YqoN9hak0=;
 b=XFqW/8Us2c8eE1SHKOEsLexrErvVDqZJrhZLa/NRZOw5pRKtEFLi0dPRJjapBbXB0s8kal3fWsDdJQjd2PrWYN/oxuHtTV41hKfiJGVWdk1bdLfbJ6wxAZuFOjfWreO46RjqJvUk4coaa2J6NZdjwl94EcPm8VdJyi0dvzPfFdtl2J8efNIVIdoS5GsOp2k0M9cGrzxxOS52Q+P3jiVOmi+oIouk1DN2qHah/coSpIb6HkBkKEYLvyhEEEbxcBkt1aRjKSh69kgdScJIo3ejUEyi5ZXAeQ+RzzvxkLx+Q7oWhbUm6RzmcWtKQyKu3u4ecXkNMsqZDsr7QRrG6g2bpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EajMCkr7SPzN6SUnrUxWhEhkAfE4DvCMO/YqoN9hak0=;
 b=luqQ39FHm3kNEvB+EIfM1PSo20rgVSkCq/RRTnzk7Z5UyccsSD4nbpR7MJyGvtDt9QF8OuNi2luLB2EM44/0Y5SNMyiGkivAwt7fhq0WmdVWds3nMrlx6J8ntwDEKarBxkVc6vZeuSZLJGuwErKIiv7scH8nHOEiIKwhr6ks0mMrzgMtDQKM3mCfw7+f+F6sbEB8gRTXE9lsgStZWmOFqWMXrEv6Lk0Chh35N+LlbWxil3mjEifX3MI9l5bFcWSSOrIC/KzNXuDbCh4JmdOPPsC3upQQ7jzEPwhecsxGvzYl9WGF0BeXiN5jb3quVuBuHr0yqdLEZRsj8DCNNBo6WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bbfcd253-59e1-9cc7-a69d-07c4f6756114@suse.com>
Date: Mon, 20 Mar 2023 08:42:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4] x86/HVM: support emulated UMIP
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <581a90d5-a168-5445-6a6d-ab20cc43b944@suse.com>
 <ZBR5T57tSqs2o/Sl@Air-de-Roger>
 <26bf3408-4585-e8fa-a434-56a0d33abf2e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <26bf3408-4585-e8fa-a434-56a0d33abf2e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: b5fc1e33-c675-4324-ba89-08db2916989f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n5Fxh7htiMCSitbvAI4kXVKRAAZhbGN4FfsSLJYB7fsyknDFagMv+T3ooKRUGMZlNtWmGVzKRzjBl3C+oSpxobsovvc09TIDl6wiYwK9nwvtYGsun8FxU2JT0hQyQ5y7SdX07lITYBGyfPmaHzmROw0TbOc5oA2TTVAWb1IKeMn/zVokBnVcH5hxn182LMaoY/CygQzBp3JWrhYYEg4Fw5WrrA35NVxEg1y9qJFv+2brT6H1UVWVCiTrtTRYWIMrCpESX/FGPINZ7dh9hcZYHdhT6xlB/XEG55UhXzan7SbVttdyq5VAVNGc5U5YfbQ8Z3m8R8GHg2UYk/W4g8Qn5cNDvmpdS/oN+WLd9TkkVf3OBBxvVbVYVJcDLYjJffw2Rt/RS7dZaPN4y+Pw2PEyl2PLYOrA4RNNn4DzgUTxZKhBfBHEali7lYMKbKCxBb+WHSdSeUQZBepyaircctgApjCxUnMtHT8XmSjILA8HuhMpn/w5GLkALMNzV/wxV4dV1mInmpGF6pCuwQr86+mTHgpoI41tlyR50H9yG7k9mgqQna5lXqPysqBAzDZnd4QJSRo3yqD7ilwbjtB6ZLk9p8YMBulzz6qEo5+00EyLcqyGTVCezGoxE5dgwPzRXVWmfRiO+xvTYmW89JLL7f5IS95TnAtrXz3+03j/ga5uFosb7QpSDlRVRSdeEa433TovEmEWq0ldhXpe4MnBgCdL04QDdpu9BIcML8tBOQt7nXU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199018)(54906003)(83380400001)(2616005)(86362001)(38100700002)(31696002)(41300700001)(66946007)(4326008)(6916009)(8676002)(36756003)(66556008)(66476007)(2906002)(8936002)(5660300002)(186003)(26005)(6506007)(53546011)(478600001)(6486002)(316002)(6512007)(31686004)(66899018)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVF5V0lYcUNUVGZoQVZWdmwyWHduOTFDMlAzM2JYb3Q1amN1K0F6ZFBXdU44?=
 =?utf-8?B?bGVIemNjRWoycG1lOTNJL0tuRllKY3VlNmRwSGRkUFhwYktqOGZjR2lqL25J?=
 =?utf-8?B?bUNqN2FOQ2JFVkRqSEVaSTFGWWtPVzhDYlpTbmd5TWpFNUl0WlRDYlRPM1ow?=
 =?utf-8?B?bExkeXo5SlFmMThHSDgrSC9kT01ZRnNFUkpNT0VWdkJ5ZFV2NEx2YkdMUGtY?=
 =?utf-8?B?eVZYRzdCMU41T05lclJxcXI5dmhpbmR1WHpLNU83dTY1L1hxcjRDL0hCeXM0?=
 =?utf-8?B?UExNTm1YYTQ0eUZFazd5T0VlNHEwdkcrQVd3R01pM0JQL085SkZKWVlLWllJ?=
 =?utf-8?B?MmlNdHFnaHR1MUI5NHBWcHdCZkY5aGVKb3owbUkzN2ZFY2ptUkdYc1VadDZw?=
 =?utf-8?B?TnBRdFI3OCtuU0Mzd01QeGhhbTEvbWc4TTg2WlJhZHhiL1l1anZlblFpUWxS?=
 =?utf-8?B?NHpVRG44VDZYV0syQjRvUlc0bU9LRFhUQTZBNWJPRG1OeXBLQ2ErVTd3a3Ft?=
 =?utf-8?B?a2ZsVzk5eFpad01IaGJnaElKY3dQMjRYNWJoVFRYQ3JZTXRzcW05Qit3ckZS?=
 =?utf-8?B?VXVyVUhuQkwxRFQ3ZVRtQUhkQXhpOHdmZWt4TjQ2TjNrODlrRmNOeXlxVU43?=
 =?utf-8?B?OUQ4TlJZcGR0NnFKVE0zcWVPc0xiYTRkSGlJczV6aHRDVW1McmFMVWFvbmQz?=
 =?utf-8?B?TURnaTlMaHhicjIxN2xTeEVxTDNpNEVBTTlSQ0JMVlJTRXY5RlNxS0d5MWFw?=
 =?utf-8?B?bXBXV2ljd0IxZ1VFNE1tazNyeU1GWnBSNXBUKzZSZml2ckFoaC9pN3lIcTFv?=
 =?utf-8?B?ejVPMGJaSHRnL3dWK2xnLzF0V3p2aXVDcU1ZNWIrL1E3V1pHK0tqSmFkRHNG?=
 =?utf-8?B?N0JUbmxLSDJ2M3JHbG1yTU15Z0hCM1BQWm9JQjE4ZW5yZTA1RENGZ0Y1MGtW?=
 =?utf-8?B?UmtmeGxBalJWTDRwV0ZkWGIvUEN5YnNsTFEvT3VpUVRiVlcvWXhLaXZFbWVk?=
 =?utf-8?B?NURMT3ZKQjN0WEwwZTVXbkdBeHFWR3UyUGN6bkw0akZOc0N3RDQ5aGkvZkNO?=
 =?utf-8?B?RTJYQmh2MlR1U01WaDZqYWNySEZLTzM2TEZ1WGlNQTgxcERJMVdkQS9DVHEr?=
 =?utf-8?B?czU2UzA2MW96cmdEZzFaN09KK0N3NHU4bVVRWmVUZWZiRWtqZTZKR1NjKzls?=
 =?utf-8?B?aUpBaFNYN2xsZ2Ivb1lJYUNMKzBEam9JSFZQMjlSSW04czZjSTUzWTQ4ZHFh?=
 =?utf-8?B?dTlqM2JVcUlnNlhGV3hRcUhNekgxTmtSbnp6MWJocmxHNzI1OU44UHNSdnE0?=
 =?utf-8?B?THFPNEs3ZE55c0FxTEtsV0I5M3pad2FJNU9TNFU5YWpNSHRBRE03SG14MVF3?=
 =?utf-8?B?aEtneXNDbzE5dFZpNFRiZUpnZE1UQ0Y0R0RFeTc0WFEwZmYzMExjazkxN1hL?=
 =?utf-8?B?eTNFMG8xTEV3Q3dXUldZMllyQ2M0YmVPZ2h6RXh4Q042azVQcGV0Uk1HZG5j?=
 =?utf-8?B?TThEZXBMZHYzWG43eW1GYjZRN01uUVF2T2RQVVR1NTdWdkJyY2ZIb0hrR1dV?=
 =?utf-8?B?WXJKT0phQjlROEIzQ0t0Rks3Wk8xc1ZwZTdyS3RxN1J5ZjI5dmxtMk1Pb0Iy?=
 =?utf-8?B?MnhNOHdGdWJ1UUtxcjVodzYzSEhoQkQyaHJOYmdYcGJPMUM5ZVVBZUJXTExv?=
 =?utf-8?B?NGpBV2R3bHhvNzdxcFZlSENLdzBMQVU2am1JU2FUSzVmUTZ2M1Rtams2L0lG?=
 =?utf-8?B?T094aWZkL1laWXRCUGpCalR6NFFBWGhjNE13NXc1a3lHRit5bjZlZ2drb3Bm?=
 =?utf-8?B?UlZOWHBUcTNVdHpWTVo2ZzZNQXFsVllDcHRZNkIzZ2dxbjJOckpCandra3dT?=
 =?utf-8?B?RzE5R2pBWUhlczV0N3FiZXhWalJDZjBKOG9oYnpiK0M0dTZSaUFKQStMMmN1?=
 =?utf-8?B?cVdsUUZmVGwzVGRkK1JEUTdPRWVyT3M5WVpsblhoZmpoZ3JPUFVDeGZ1dUNk?=
 =?utf-8?B?L1JwVG81cGFxcXBBQnVqYytUb2VPRGRLTi9iTnIwdm1NT1I1aVRMNjlMYlZK?=
 =?utf-8?B?YTBxU2RxaHRLOXJ2TEN3b1JoNm93N1RkeCt5Rkt4TVplNHVjVmpweGEzRHVD?=
 =?utf-8?Q?Cd5xTckuiVLmyt0MSMtvb3sYi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fc1e33-c675-4324-ba89-08db2916989f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 07:42:03.1399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwTC/8FI4+epWcFg1Zj0pjinADA65RUvbaQdWhlmy0VZmmrRDihXRjYvBoc9cEvpBeR+d49lNhPAixwIUOB8MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8277

On 17.03.2023 17:30, Andrew Cooper wrote:
> On 17/03/2023 2:29 pm, Roger Pau Monné wrote:
>> On Thu, Apr 15, 2021 at 11:47:42AM +0200, Jan Beulich wrote:
>>> There are three noteworthy drawbacks:
>>> 1) The intercepts we need to enable here are CPL-independent, i.e. we
>>>    now have to emulate certain instructions for ring 0.
>>> 2) On VMX there's no intercept for SMSW, so the emulation isn't really
>>>    complete there.
>> Then I'm afraid we can't set the bit in the max CPUID policy.  What
>> about domains being migrated from a host that has UMIP to an Intel
>> host where UMIP is emulated?  They would see a change in behavior in
>> SMSW, and the behavior won't match the ISA anymore.
> 
> There are conflicting opinions on this.  But the truth is that SMSW only
> leaks the bottom nibble(?) of CR0 and that simply isn't information that
> is of use to an attacker like SGDT/SIDT is.

No, with a register operand SMSW can read the entire CR0. But I dare to
ask what's interesting in the value for an attacker. Hardly any of the
bits will ever vary over time, once past boot.

> So from an entirely ideal point of view there is an argument to say that
> UMIP-but-can't-block-SMSW is better than no UMIP.
> 
> 
> Except, I'm not fully convinced by this argument.
> 
> SMSW aside, emulating UMIP on hardware without it involves emulating the
> guest being able to set CR4.UMIP which is reserved so we have to
> intercept #UD, and intercepting all #GP so we can find the
> S{I,LG}DT/STR/SMSW(on AMD) instructions and fail them in Ring3.
> 
> We went to a lot of effort to not intercept #UD (by default) because it
> exposed x86_emulate() to guest userspace and caused us a huge number of
> security headaches.  Similarly, #GP interception is the source of a lot
> of security bugs on other hypervisors.
> 
> So there is large security concern with this patch.  Which is not a no,
> but definitely is a "need to think about this more carefully".

You recall that this concern (not just here) is what we've introduced the
"verify" hook for? Yes, this doesn't entirely eliminate the concern, but
it reduces the risk quite significantly, I think.

> This logic isn't useful for Linux.  All versions of Linux which know
> about UMIP already put the IDT and GDT on read-only mappings to prevent
> SIDT/SGDT being useful to an attacker on hardware lacking UMIP.  I don't
> know what Windows does here, but I would be amazed if they don't
> something similar.
> 
> Therefore, this logic is only useful for guests which do know about
> UIMP, and do not have any other defences against SIDT/SGD.  If this
> isn't an empty set of kernels, it will be a small set.

Well, okay, I guess I'll simply drop this change then, and consider it
merely a (past) useful exercise.

Jan

