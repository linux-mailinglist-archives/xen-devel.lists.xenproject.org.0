Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3655C75B282
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 17:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566662.885783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVXB-0007B3-Uo; Thu, 20 Jul 2023 15:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566662.885783; Thu, 20 Jul 2023 15:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVXB-00078G-Rz; Thu, 20 Jul 2023 15:25:41 +0000
Received: by outflank-mailman (input) for mailman id 566662;
 Thu, 20 Jul 2023 15:25:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMVXA-00078A-TR
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 15:25:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7d00::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aeb505f7-2711-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 17:25:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB10024.eurprd04.prod.outlook.com (2603:10a6:150:117::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 15:25:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 15:25:35 +0000
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
X-Inumbo-ID: aeb505f7-2711-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSX56l2HT+GVQb50RrKTZ8qUFbllW/k8f7Ze3xaC+rlXlxySRGzigB5ComUf4iwP/B2yPMyTvbN1azN2C34ffEk76ul5S2qrYDz1ZSRqCkNMK6IWJ+uQ6GjJlSr4NQAu5j8a9DitU2NeuMZEJsgAkJLYLsqNGuzy/pr/5cht45rJHPk8EvTggx2lFZS/aU/HyrH2ildG11t/v3npn9W1pBUmfGKWLdr/e85uzwg/VOaklSCBVVmG1MkVfSFGjunCEstdK3ywyvdPY82PUbQxBFKHCqX2NwN4AdesmlwGH8bY1gyOvKtSr5Lc8coTCwiYk2bymF9dJZjFeGilcBkbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o72YJS/1sdXQthRVTF0KP5aExV/SVHvJBGL3szoa2r0=;
 b=eAluaNGVIW0iM/iIxTWHAUwFwII4DUyNWPzfq3IHonCgcnXflEk8N8WMT3HWGHUqi4u66waoRGjvgqez7lVsW03P9/mTnkjGDfCh7O8tl74pG3JTB73xzeXZ08XK520KeuBUkViIom2Xm+YRsz1y1QzgAgV5FfuWZ27vvtJvMYquZ2MvplsMdvnNp5TD23iHzLdimBcI3MGXt1sQlzmiFRDm/5y8nppxgHbh/xuLEowy5mKA8vDmEIHgBVMA4M+fPjwaGPFRXwEqceNN1CJKb4eNOsMhgLUC1THOoPSqP6kmWndX1DOUCqBSsMSVlcd0QiI0YPuAHNtsNtB2kEzdSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o72YJS/1sdXQthRVTF0KP5aExV/SVHvJBGL3szoa2r0=;
 b=5e0iDR3Aw+WEfKiL8Y2jnAHK2lH5LFYkJyVExNSL5ThVKGUQElCaU6qx564pKVTWfA/10T5rs/0zHyx0BCqORDsC6nABa0pqqRn1quRSdsbIliBoHry2d4KIYRMYymrqivto/19nK0DzVg2EJEwEW4F0SYD7Ams5sjY0dcXOLDBUw50iTamHzuRLIRIWf1JIRTgNYNJ0F8Q+YOuxJmJPCvOF1d52FbQV+thBy2V6GSjWoITVFxDhQIsKs1S6ya17hNT4En5WSlaKhtDMgNwsllIuWBBJpfYPjaoGLAVtWTDVKauG74qH0vj/Qjnm+C5fIMco3W+0/TEuJQOTZ5rZVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a92d70e-e3f8-c6aa-a72c-19e9849e2836@suse.com>
Date: Thu, 20 Jul 2023 17:25:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen: address MISRA C:2012 Rule 4.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>
References: <378f18c287cfb65d25b42209c85645a2a10ff9b2.1689763253.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2307191723090.3118466@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307191723090.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB10024:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f736d0-8242-44be-3dd7-08db893590a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RZN0xNQ4xM+xCFYFkGJh+KNKZR9dAGWyvzl3Tv1yVvGs/mFDUZqP2fN7kgA3oUtDyVvCTqfX7lyXRwIzpsAyE58Y3xvLpwcy/+fhmnWujhkm8mSUCttGQ6Nk9ZFZsVG/CKisoVdEyDJhJgyJbaDwE6wm9a/XYbWXDuE0wix4lW/v8n40XjeockSeSetqEaHMSmscKcw1TffzwIBLxkdgKzKZNtz7Q+B5tSWP+GIM00LO665Iqlosese9hXOm59ryHmhLh15O58KmIuCImwgG4gI90c193eJPo8Jh7WzbvTk6E90o0fcD5nv3sfAf5vHyTke2Micq1p2i94Ub277PkgqI2k4PukaJ6mubPrEoCh1HLZxwuPFj9nolOeXDbjgFDdN7mz+5HapWQswPtOugmoMJNW1FfpOW1FY8qxTB+vnWzm83bFXm9mRJMp86T9pBBDyJeV8tJJ3ZCFqfHg8QQr9Ife28DG2gU/J3oAPW6WGRGrA0KhG57gRMpHvVIVcJ/70lZSFgA9TiGPgSR2q8la/Au0Wt2/VIgAjXFYyoWBKuO1zHY7KT0AjnYtVv90b1vRsxZrnhyxzkdwerFr3Z9MA0U0PKR5VT1cDpV8BijkoTRyckrqcjV0/k951pQpqEXPR9NtuR+/5AVH6jaGjhEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(31686004)(6486002)(4326008)(6506007)(66476007)(53546011)(26005)(54906003)(66946007)(478600001)(66556008)(110136005)(86362001)(36756003)(83380400001)(2616005)(186003)(316002)(41300700001)(8936002)(8676002)(5660300002)(31696002)(2906002)(6512007)(38100700002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZURGR1pNYnlrVnJpM1cxc0RMTzNaUVE0MWp1OUF0Ump2eGtaZVlWSXpjNElZ?=
 =?utf-8?B?YzRPVjhZTlJrc1FNL0g0MDZTQ2VuSEE3eTlBdEV3OVFJNng3R05oTmE1VkJW?=
 =?utf-8?B?Z2VQaGRHYXZwdWpGV0tRUm9MZFFyd3NHWWx5OVFZVzA4eXZQUWZGTTFPdlp6?=
 =?utf-8?B?WjBjU3Y3WlRQUXQ3NXpOckdtMElrVFNEK3BacWcxejJpb3hPcllmYVpQYWhG?=
 =?utf-8?B?R055YUtvaXJFWWxiZTRHeFBydmV2TjFTei92TzFmaEhQWXBXUURmS2F6NTJr?=
 =?utf-8?B?Qm9GSFcvY2xobFU5V3hJVnNKSGQzSytnYnM0M2tqQnphRi83clNpanh0NUsz?=
 =?utf-8?B?cm9QNXpBb0RSQmlHVDc4c1gxcjNNWjVPVVhDSkR4NWJFMU9NaUtqa0JPV1Zt?=
 =?utf-8?B?d2Jad3RMRFZxdU9PU2krT1o3WkkzaEx6WTJCZ041bGxxZzRoQ2dicFBDZjBJ?=
 =?utf-8?B?TUNwRFBHUUlSbFQ3T0VzN083NFFJdWlnMmQvVVNIVFQyWWhwRzB4RWpKWFRK?=
 =?utf-8?B?QVJOeVRpSU1VbFJYTG9wZ2ZkWnpmaVllVjlPa2VnSUVIOTVueFhkUWhVY2ZW?=
 =?utf-8?B?UElkMjhubnk4TmJOTXl3OXdJWGFHNnQyeCtkSVpKSFk1UTVrd2RhUGJac1dR?=
 =?utf-8?B?VmRVd0J0dGhmN3RuVjdiczhqcTdkek16R0VtZTVpQkFMeG9FSWxrbHQwSTEw?=
 =?utf-8?B?NCszWEcrYUxkbkM2ZUZUOTdlcWVSME5kRnVtRE9EeHlHTkFKUWFmdFpSdkJi?=
 =?utf-8?B?SFQ5KzVoYlVscDdYSWNNTzMzVE91bGs4MEFUampEWEw3dEp1Q0RnTnRJNEQz?=
 =?utf-8?B?OXlqWjVUclNFQnBiWXRoTkx3TTU5SVpyR2srdW1xMGlUbk0zRFlOeVRVMVJP?=
 =?utf-8?B?cXNRZnllYUhjT1lOS1BrcXhqLzRIWkJJOFlxcWllOEM1c2d2andzaDcvcEt5?=
 =?utf-8?B?a2x5TGRYL2UyUnUreDh4eHA4TTlvQ2dUeVdQUEtBdlMrbW9vY3NKSWdPeHhY?=
 =?utf-8?B?WVU2VUZKVlg2K3dCMnE1eG9Sellta3pwbm5TK3FwTnBUL2xmTE5JTlJndmFr?=
 =?utf-8?B?QnlrN3RBTzVnZkVRbzBhTjYxZW1Kcm9oSVVveG5WZ3FpU1I2WnlsQklQYUVq?=
 =?utf-8?B?RWtnQzZ4aXl2UXhXZlpPNlp6bUdSbCtIWkJsYUEvTHJ3OEFlMVZMM09MRzBC?=
 =?utf-8?B?bUk3QjhpcEN6UTBUSVl3NWxKd3NsaU1ZbXR3Y0FJUGRYSjFtc21Sa2w4a3RO?=
 =?utf-8?B?M3BXWWpaS2M3MVZvV2cwZU9SVS9kMUVndmhVZVd0YnpRM1YvcmFLc2NxU1hS?=
 =?utf-8?B?NWJ4RVFYcDZFdXB3UU56L1I2aFV4c3pXTmRNV0UrT01Lb1FSZ3EwVU43WHBJ?=
 =?utf-8?B?V0lTSnBLYkdUN1czUnZvMFFnRTF0SGJIUUtrdkNEY2ZtOVNTTzZRL1ZmcWh1?=
 =?utf-8?B?U0xZalhwcjVIK3hTUXREVVloN2ZVMmV2YVlpZDVQZmp6TTVnM2UwVG5BOGQz?=
 =?utf-8?B?Q3VtN204RVhHbDY3eGdsaTk4NTlPTlpDZDZEM05EdUhLYWxxWDlQVlZ3dkFq?=
 =?utf-8?B?clpWTVlabktKTWU0Q1BsdUJCRWlPN2VYc1Q4S1dqM1BmclJGaWFxT1l4QXRr?=
 =?utf-8?B?T2Y0MGowVzU3QVc2ZzExM3g2SDUvaG1ObDl3R2hmRWNMYUIveVY5MDkvMjJ1?=
 =?utf-8?B?SWlCemdyUGIyRXhaV2FBcjNGTXhxQUsvaWlaL0lFMURjQ0ZoeDNkY0ovNlNB?=
 =?utf-8?B?TER4QjdiWjB6RmhzMkdsTGpRd2hpZkJ0Ym9lZXI1b3h3WWxzUFhtbU9td2Vq?=
 =?utf-8?B?eGQ2QS9FZ3FFcCtGSUIwVkhuMGgzaEFUSkFDaU1GM0w3U2luYStpTGhCQjFh?=
 =?utf-8?B?djhhQ0VxRDI0RkxUSVQvTFJ0SXh6VEtMdTY5eERaT3NLU1JWbEI0QVBydlBW?=
 =?utf-8?B?aDhaOEV6VWNodWdJcjFTbmVWNjkwQjgvcWxnWks0eVZoYXJ3VENFMytBN3I4?=
 =?utf-8?B?aDhlMXRLeG05U0tCMnpTSCtxbFFtZ0N3SHQ1cnBINVRFbUNmZTQ0V3FLNjE3?=
 =?utf-8?B?SjJSVFBOS3VwWXI4dE0vanc2Z0wwMzgwL0JCZk1nTFR4SVE1S0J5OW9NRzN4?=
 =?utf-8?Q?0OXkenSK0jz5swUXklUdNBBEu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f736d0-8242-44be-3dd7-08db893590a3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 15:25:35.7515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfuiYI67O8b/otGzkyBpUvuUbTd2iLQexhFizxI1Bbmu6pA+pXquhCt/bkVW3nR+5DpnHnl0A2m3fCzvSGFhqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10024

On 20.07.2023 02:23, Stefano Stabellini wrote:
> On Wed, 19 Jul 2023, Nicola Vetrini wrote:
>> MISRA C:2012 Rule 4.1 has the following headline:
>> "Octal and hexadecimal escape sequences shall be terminated."
>>
>> The string literals modified by this patch contain octal or
>> hexadecimal escape sequences that are neither terminated by the
>> end of the literal, nor by the beginning of another escape sequence.
>>
>> Therefore, such unterminated sequences have been split into a
>> separate literal as a way to comply with the rule and preserve the
>> semantics of the code.
>>
>> No functional changes.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

In order to get this off the plate
Acked-by: Jan Beulich <jbeulich@suse.com>
albeit I'm not overly happy with ...

>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -3853,7 +3853,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
>>                                          cs, &addr) &&
>>               (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
>>                                           walk, NULL) == HVMTRANS_okay) &&
>> -             (memcmp(sig, "\xf\xbxen", sizeof(sig)) == 0) )
>> +             (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )

... this. Imo it should never have been a string literal here. But
I'm also not really up to making yet another alternative patch.

Jan

