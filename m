Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5728A76E745
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 13:47:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576274.902232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRWnU-0006s0-OV; Thu, 03 Aug 2023 11:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576274.902232; Thu, 03 Aug 2023 11:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRWnU-0006p7-Ke; Thu, 03 Aug 2023 11:47:16 +0000
Received: by outflank-mailman (input) for mailman id 576274;
 Thu, 03 Aug 2023 11:47:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRWnT-0006ox-Dm
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 11:47:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2041.outbound.protection.outlook.com [40.107.7.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d4bf67e-31f3-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 13:47:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7214.eurprd04.prod.outlook.com (2603:10a6:800:1a6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 11:46:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 11:46:44 +0000
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
X-Inumbo-ID: 7d4bf67e-31f3-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0EbneWhDqO8Y3Ja3Z0VNLIpnOD5Yp/gUHt9lbI5+EI6tJS6bnO55IyugVFrCtevPDNYOYV0FrIBg6/3+ZbIgH9bJur2WvBZtvMleSfh/O8alaultkuHk8SG0wZqmsUSFwV4lPh2+KfqEkI/fmcFk0QcM+Yhe5Ndm3hPmFXfyLfFi39olOVt8PDtxESbBGvlYoQiWLxCl7g/WrBCQmT/1YVHFG+MdwRVCfhFx6V8OnCG1Eg1oNJjGhaepHnmVXCQhDMIVp/7tHbtslKxKhMHvJjj52UPbC5GljTpfFUqpWd3c7+hUblkxQ9h256XnGhC1So7bbOx8tz8p9au2U89CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYY449ATC3SaIKZ4g81JfOqzjstBdmRXd8vP3FsgYLU=;
 b=NnQ3d+wswwprSlqJV2Zs7JUKxUY+4BXwxqSW9qmf9bNhPEnT+gxzoVYWNzKVn1qmtNnCVGoEqaH3OlvVYPxIMWBSyA9Rk7Tc0XtWuNos7U5OY7rdmFjTab2dUIGz3NLm7cA2ArKbeRmZ3+jt3vIBtROuLg3TEadA/Tvj2XvJA2A2DpY8+ujWF9RBSCQ7iznI/1Qr2YfhO4a36QoW5gWRk1lCdnNIjVHSWEceBEqsinP3UgRgqMseYz/16W76Lmgxr9LPJncj9pwFUxf/UoHhG1RqMrORlaGEr/vJ4phTJjxXJlCIQMhP3Q/RObmrH3/PTMDSAQxF/afo5JkMrjTerA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYY449ATC3SaIKZ4g81JfOqzjstBdmRXd8vP3FsgYLU=;
 b=Y/5fT8QYc84lhWZ3vhv/jvvncQad6Fvx6ZP5P/pJXWMo3FpzDMoeQdyakutZ4hJPk8cO03cNbnmywup37WsexABoRmtAyerC4yQxIPXlKFPv9xiIch/13105jtblekXdTk1Z7qAViG+KCnvx37RFJBJn1doQYMCXt3QCWmUEeLD7jS72pyolj1j/3letKi0SG28mx8OLq+gkw7bk8u3Rza44y6aB8VyOn979GvG4cVuF/JsJrOyEEZOE/p4zOF/+24hOoxJbM84HnXrtQ2Y0aU9DTjbVxKb1EIr4qGOb7S07BwNIELrJIQA66GFnoorRWKSARpqmaa//d3k3KkPo/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97527049-e3ac-9d8e-806c-2204ed7f68dd@suse.com>
Date: Thu, 3 Aug 2023 13:46:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Ping: [PATCH] x86/HVM: drop dead assignments from
 hvmemul_rep_{movs,stos}()
Content-Language: en-US
To: Paul Durrant <paul@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <32e33a0b-d572-ea7f-b1a8-3263711582e5@suse.com>
 <alpine.DEB.2.22.394.2307271141500.3118466@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307271141500.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d941830-8c41-479c-8e23-08db94174fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n6K7uTpl9UPLOZaF/mUX0kNNOXGa35VpVNstLNJb0t/Ef/iYnD6MfPmaleuXhC1k2hipKtXKEbcLECEkvQi+FfZp4V8euWHTz8X7zoNIiaaCBrzx0xc4f1ZypbUbSeeTQSGgJEU4BwIOwvWfW4HpBq0o5YjeWLVoyXxkt1l7DSXPzCMFMlfW1L8LL+97ZnnMqJ0UkxUcKOpkFDIXL+MQzvDNg15ruEadgICHR0zav0qFmAH7yRzmNnT7m9CCLJ58EShyztGkq3jUZxHMjY0WQLsGZOw1PwZwioygKcb+1qSx5zWvXs2S581Dx1lEdY9I/H0yV22/gJkjs3pcU8ld0TqkH4jmApA0pEusz3dG6gCa1C6D0a+jf19a93OZM/9qh+4B9Y1SjeGwQewgbnZ2qYBLJEMfYWzwkuCjChOx91lGArsSQqMyT37qXK8LLcTb+1OSCqGwhT48dTUlr335GZSapy2RvDb4ndPJVlEX4ileHedQ8u+jVd3wfQq2CSwcPPgQEoX2lsx10apm+51Jp086t26FA/oQD3+mgMJtno/mkvPmSoZjwxL6wF3a5OYkzPOwiecJCvRVDWHyVL3FdUmr+rjHyQRmxByeem2xuhSKUmYStHE1dmc0Dn6kyRuEMTn2NcVqBTH9W1OvDEqQwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(36756003)(31696002)(86362001)(31686004)(54906003)(478600001)(38100700002)(2616005)(6506007)(186003)(26005)(53546011)(8676002)(8936002)(41300700001)(6512007)(6486002)(6916009)(316002)(4744005)(66476007)(66556008)(5660300002)(4326008)(66946007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkdocHVJeWo3ZU9YTzBtM25vc2wrUitHdXNxMUU2SVViVnBaYXl2ZkdjNGhI?=
 =?utf-8?B?MEQwUENHc2lFY0h1eVRVVnNCU0hZdEFaTThpY01FVXlnOHNjWUorY1dFdjhw?=
 =?utf-8?B?NTVSdmVOUUhoTms4VWJveEtNdGthdXZHeFQxeWQyakkyb2Q4S2dyOWE3WjB3?=
 =?utf-8?B?Rlh1KzRLQmR1U1p1ZEZpZ0xIUStPaVdxbDcvVFo3YnVqNEUxcmdPejFwdDVy?=
 =?utf-8?B?SXA4Rkl2aDBOam9JbzhLMHdwQ2hVVUxuaU5IVk9ucEVRdXdwUGdveFg0c1Jy?=
 =?utf-8?B?SkFrYitFRzVieGZaam5sa2tlOEhmZjFWaTNKNG1PWjZyUG5NTEs0djJDOFFn?=
 =?utf-8?B?ZEdEWlEydUhmdjNFMStiSVpzZDRUMElINS9lQU91QmhQRW54aUFHajNqVll5?=
 =?utf-8?B?QzllRE5RYXhtcnBXbGtqNUlpdldBa2dXdWlNT0NOS0NqVDRaRUFtZ0lZU1J3?=
 =?utf-8?B?MjJ0SkxEbnN6NzRiTlRUU2xJM1VkUlVueVh0S2JGQTZKbzEvNit2d2t6Q0pT?=
 =?utf-8?B?b1JpNE91N20rVlNBb2kwRFFPckduZjhRdlBKUmlqN0dNTG5tbDA5amJsanNm?=
 =?utf-8?B?MmhlMURQT3E3YmEzeVl6T0dYSnh6MjE3SStNdDlUUU9rTVd0dkllOGN6aTky?=
 =?utf-8?B?eXZlNUNCVXhlaXUxcGFreitXK3NuSmwwblZ0dktLanlPVXBmdUZ5TTVSR1kx?=
 =?utf-8?B?YVdmK1Nidm9KQS9uaEx6MDJ0RmxIY0RXN25nS1pRM0hTdnVCZldVL0kyY1NN?=
 =?utf-8?B?TmJLckJiaG42Mnh5d2U2QU1hU3EvcldCalZoWGZNVkdwZC8vWHRxeU5CMUp5?=
 =?utf-8?B?SEl3UDd2UzZ4WitvZGJEa2IyZitDM3hoSU1vV213ZnREWGdvcFJzY3Q2VDJP?=
 =?utf-8?B?WDZvbzd0WndWQXI5b1UvR3VKZTBNbDZHaTMzYmcwZ2tLTFdXaEp2RXNxSjQ0?=
 =?utf-8?B?aEdGdS9PTURndWF0SnlqU0xNcHhoU0xwaXpmenRRN0s2ZDlmRFd3QzlGSWVu?=
 =?utf-8?B?d05Ca1AyY0RtOXIyc3U3K2dlNmdDdUlsRmxRckdlWTdYd2RVM1JHUDU2ai8r?=
 =?utf-8?B?SHhzMWlCNDJha0ZMUjdWSVFUWUE2TUl0K2I1TEt2dmNmTFRRSWl4eFdOVDdv?=
 =?utf-8?B?S0tsbUl0elJxRDhkeG8ydnhOR3BqTkVUMXRUNU5VQjMyWE5LbmRhalA3cWxq?=
 =?utf-8?B?QlozdnNVOWVoWmwvMlc1RklTcjN1TjJ3cm9BMThtMTV4cSt4dzVVMjJ5dytE?=
 =?utf-8?B?bWlTTlNOTmc4bWsvTkF3QVpBNExvdEs0THJocDJpcEwzcDc2eDVxUjMyOU83?=
 =?utf-8?B?KzVXcEtwTjhBazJGRlNVdWtVTUNxUWlPbkhYNWQzVGZDcmpoOGZpdmF3Q29U?=
 =?utf-8?B?WlptcktDb21wazZZNFRsK2tLdU40UWFhblg0NnBLNTk1MFE0RjQ3VkgrbjNl?=
 =?utf-8?B?VG4wb1FGdG5BelJsQ05FL3JSVWN3TGRGTGh3bE5Ob3A2MGZScGpmb2FEZXRK?=
 =?utf-8?B?b2g2RjdKOUEvcm5yRFkvNlE3dWkvWVE5cjZpdjZweDErM1Q0RHVyeEZteUNF?=
 =?utf-8?B?alJ3VjZORHpZQnZVU1ZKQmNKK01HN09GNGQxaXAvQURCNHovVU5zY0IvSysz?=
 =?utf-8?B?TTZmdHJpV1JGeE16UWd2TEdzYi9kMHhoT3F1TElNRHh1MkVIU09FbTBhZWdp?=
 =?utf-8?B?aGpZZ0ZBWTJLSEYxMjcxOUd6cVRvRjdyVllQYmtNY25KN0FaVHRsTHp5dnFY?=
 =?utf-8?B?QVpJN1ZHT1lsUUVBc2xSazZyN1d4R01ydHBkZGZJMXcwYUs2NEZwOU5RVFgw?=
 =?utf-8?B?eUVxaERjM2hZL3R1b3pnYTZGM1dFeEFwSnlsU0VjUWUzaTEwQ1BFOWs1SVg4?=
 =?utf-8?B?OXhCV21aZ2wrME5CaFlZUFNTb3pSNFduL1dSYUZxcXQyN3E2TmNYNE5mTmIv?=
 =?utf-8?B?TU5PdG05bFR3TXN1TXNSd1kxYlMwT2dMTE9Db3haYzIvblZZelI5VndyY1pQ?=
 =?utf-8?B?YS83WXdBQjZpaW9vVnBNb3BTSHBnOVl0Y0MyeWFwTTNvUWV0Mmw4ZHNNSStB?=
 =?utf-8?B?S3BqNXRFZ0tIWXg3aUNPZElsWTNHK0o0dDYvTW4zVFpCczVycWUvNjNDdWxK?=
 =?utf-8?Q?N1CIcngQHv8vS6v/lNiMtDB03?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d941830-8c41-479c-8e23-08db94174fa4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 11:46:44.6777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pv6HHaU6OtmmzwqG8zhvCRPRQPmkpyP8xiCwC+OP+bHg98AuM+SKct0OhweudPdlvEnzYzM8abyI0uY+g0Mjcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7214

On 27.07.2023 20:41, Stefano Stabellini wrote:
> On Thu, 27 Jul 2023, Jan Beulich wrote:
>> In the latter case the variable altogether is then unused and hence gets
>> dropped, eliminating a Misra Rule 5.3 violation. I'm afraid I mistakenly
>> introduced both assignments in 57a57465daaf ("x86/HVM: use available
>> linear->phys translations in REP MOVS/STOS handling"), likely as a
>> result of some re-work on the patch.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Paul - any chance of an ack?

Thanks, Jan

