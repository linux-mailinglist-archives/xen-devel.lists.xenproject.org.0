Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC39318F3D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 16:57:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83975.157307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAELI-0003YR-1s; Thu, 11 Feb 2021 15:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83975.157307; Thu, 11 Feb 2021 15:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAELH-0003Y2-Uj; Thu, 11 Feb 2021 15:57:19 +0000
Received: by outflank-mailman (input) for mailman id 83975;
 Thu, 11 Feb 2021 15:57:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fzmj=HN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAELG-0003Xx-HJ
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 15:57:18 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 811e8374-59d5-49b6-88f4-79282f2dbc9f;
 Thu, 11 Feb 2021 15:57:17 +0000 (UTC)
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
X-Inumbo-ID: 811e8374-59d5-49b6-88f4-79282f2dbc9f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613059037;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fDsorYK/RObkuApe5Ex3u735vz7rMoAh+0h775up/ZE=;
  b=ReWOvtdRcHZrTIm8zDK79uRb2L/F0BV+tVXTp7cyISNWh1+ktmhWinVx
   lmdi0znTjQgiMPCcm15dwuWAH5G2jx+fkrzrmqiooSsi0j20tNsFBLiUy
   nsHZ9MM+bXoi1kqpSWOH9RFTp5EcAHEtdSsI6ncKnzRf1Gx2025h9dR0Z
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Psd0VPQDLcX7ed5rbTYP8fdx01qI3Z2+aKoqwa/Br21S8jVViK8vZKYosYG5gAXrlKdYKhDAcg
 2Hz4BZsPj8ttMZEsCKd0OgKuEpKzr8PCSiQ5d4CuVf3GCSuvLoZWQrMypgJvJQgfz9mt7gEPrN
 HJhfcU28SpTWNWumbIdsUpXPTqTEmUrVXq0KWmzGW7K9wAeQHJe4Fw4vAJN8WJcSSKQtT0BKjI
 KvrkokfbGy1d3r0kvH2QiPU9OKPJrUbs+amOu5u69adNHvvbDHFvx5InuDbP539NNG+b6TMSRL
 8so=
X-SBRS: 5.2
X-MesageID: 37085690
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,170,1610427600"; 
   d="scan'208";a="37085690"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+itWiaxronW1PhZr4S0Q5T665IffmBHLXANHZ5Xp9E6BjspkDxnDlZzoZ5GzAHcVkGr8wHZJftAb2ImPXumBR+bC1MQOSRznT2oI5cqRWsr0bfbfXkiFURrxKs6QK0ejLcrzN1Rr/I/u8Hg5U6jydysiKnaa5R6436RnkU4mD+X1pC3Rv9CGWaoabkAI7Rji79gN8xoswN+vVp+X+loTM4IhRfMoUU/SnTsEEoeQVdsUZ4ImdafzeT1EeUsM8dSirWoOo6Gh/SpYNIecL0e3zmx88Sg+ycp3Lak3lTlvvE0Bvb6yqRMBC/sTrlK6aO6bifWBXY7EgVyLTxChs5/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDwh4/4ef9VLyR7F7NsuS8PDRC+ZJGdUO5HlYIqmSlw=;
 b=HeKjHUiyarV7Lmju4zhZc+hCk7VTyu+3Zy/ijz38BUPUHLmH+pIMtfS0HdvGvOC+ZZ8xcjJHh/P4ORZ4Z4dwKyIWuHLd4KJI0OyXprPWK23bSLezlF7BXT/ZqwtbJdGKt/HxYBv0oh4WNpTW9+S0drM9TW86kDlSTxQDjsuCgQ0dmbTKF6JoFiRoacAu2NToivgY1tt/Dcz+Z/yL1dF+XGjKq8ZAyjbr/1Cs9CgFLV688vhBEy+Mc2XV1PGySbQs6XWTPTNQygV6hj2ZxKZik0MbBMGWFgyqzt5IC+LuARCR26SDgBT0hxmz+P6X7lMfP6bVR+o5FDhHHztydjojgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDwh4/4ef9VLyR7F7NsuS8PDRC+ZJGdUO5HlYIqmSlw=;
 b=Gz0HHYBqMYWe0r/VadyB++aTIQvK0BSGypUI9XSzKhdgIUErstAGVe5Q6jvTaBdIG1+9spbwtES6u9RqAnfSakW/ahY0d1GY06qNaX81OdgvCy8F08mwP/Aoxpwb3RzwDz8eWa5ULLZnODdIvJyuQNSuirU1we3ZfOUSI4LRBjA=
Subject: Re: [PATCH for-4.15] automation: Add Ubuntu Focal builds
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
References: <20210211155041.4811-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3928a36c-9ef0-dd2b-a4b6-0a94092cab88@citrix.com>
Date: Thu, 11 Feb 2021 15:57:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210211155041.4811-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0086.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ceb4597-7f73-427e-0be4-08d8cea5b21b
X-MS-TrafficTypeDiagnostic: BYAPR03MB3621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3621BF8702A06548E906E566BA8C9@BYAPR03MB3621.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:179;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ig5BvbysG07FazzZ3N07Y1cahQdvezfJkEEb44vr65+RMUsfcz5/QPUlYR/NIwbo8Y63o91i1eDNG9ZOyfS8h8jn9uaHP4N+uvH7bNwuC44nAXnhwAUjzg//3ne0qmm0ZZUxDpIQLo11/kTgTckqtXaLPMpzkFgMDVmlClyVcyaTfxF4Sn009XDewNtoKIi8ER3US7mqlEdO8rrxr68xPx7S5ncu/U2i0dHXoVjoIdrzLr3nk5J5g9tpk6ocP8Ip5DfVfb7/oiWbGtZK71lEUcaJHapgRgq3eICjc8/xKEq/58LoTZxxfECypDUaSwHFnbBBSOd4R2zgTR+mUIXBMChyW4G2cHDMEm2k7xsuOzuUAU87fodpgO3XFWemEhfLV33IhGD7dznJmUw2ydOC3SUexNmRytqf/mGqgUa2NQ38DrlOzEV7scB50LL2J3RTBvHULHsAZ1Wz99EgEc9tdLP8GJN8a7zdBSkQe+Xxsci0LXt4wh7w4YTV6hHq+bZRWUf+eESFgwUL+RLLnf4CpJdq8Ycg4AZOfxnX/JdDhpB9RSgntg0w8nxWFWXdwtyi+yxi8OaDtSR7LcHDDbYjMcCcHxMx73+az+1itwz4kLD/oUbSY/EOWAVrCgB4yEvn5tF4ULBCG8eoolSjESn1gwTGi+1DKB/hgW7ldTrbmBrp70GC1TZz1UYH6XNNQpdo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(53546011)(16526019)(186003)(6916009)(8676002)(478600001)(966005)(31686004)(8936002)(6486002)(5660300002)(4744005)(66946007)(66476007)(26005)(66556008)(2616005)(6666004)(956004)(16576012)(54906003)(316002)(4326008)(36756003)(31696002)(86362001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QVlMcHJRVFZMM0crNEpGMGh0eGc5SHk5Njl0ZXpkNW02YXBvUHJjTWtLQlMz?=
 =?utf-8?B?M0xKNGNwZXNFczFnMEtleXE4eUlpRVlRMDVFNFBCWFhYbTE3QWt4d0Rob3E2?=
 =?utf-8?B?Vzk5OXpZcngxQThJWFhQU0RVVVNrWVVtOE53YnNwQVBlSlVnaEUydVBzUEtE?=
 =?utf-8?B?bk1FaWl0dE8yNkY3TFZtczZCZzdYT2hqd21mMjFvNFg0azVyVTFaNnU1TVRK?=
 =?utf-8?B?cTVPSVRHZWdQNHlRREY4TUs2bWFLYnhXbUdSTjBUTS9RdURRZ1JnVitSdmhD?=
 =?utf-8?B?STVKOHVZM0I1RzBDQndhSXhzMzdSWnRTKzgyeVRNZG9QUXdNTzdONnkyQ0Ry?=
 =?utf-8?B?RUVGZTN1ZmlvMG5BbDl5SGFDMUZhajVOUTdWT2VZZjl5dEliRlJPMVA2enI4?=
 =?utf-8?B?bmdYcnlsV2hPREtTclZQU3B5Y3FGN0k1TE81Sjl5UzJycm11OGZuU1dlUDg5?=
 =?utf-8?B?bVp4VTdlWjZQdHZGbkNKQlNaa1BoMjV4cWhPb1c3cDR0dFJmU1E2SHByK05V?=
 =?utf-8?B?bm5RNndxNjNibmZnaXR5VlF0QlBIM2laOFJyZ05GQTJVdEErSHZFK3FNSEVj?=
 =?utf-8?B?ZTRBeC9GSm0yaTM2eW1OUndIYWJTdkxoQ3dyckQ4ckZmZm9wM1JkZTZoaUhB?=
 =?utf-8?B?N2Joa1lJWlVSbnc1Zmdncit6T2FuTnJnc2xId2NMR2RsSjVaNXdrQ1QvS2Vu?=
 =?utf-8?B?Vy93cU5neUhlQW96T2pCOWZoc3l6enhOdWxWYm9vTVgzUUxZaHljWXZWUzRJ?=
 =?utf-8?B?OXBIbzJSTW1nQ0N0OG8va1o5dzBmdmkyaGRUQzJsY2xUQU5sNTc2MXJFV016?=
 =?utf-8?B?SDdSKzZBRnZDdTJZaDJ2Y0VCZEduRlBWOUpQV1JzRk43alB2YThRMjlHVmhr?=
 =?utf-8?B?bElGSUdQOFlhVGV2OVFSZkFIeWZMQUkyUzd6MmhsOXY0dHlWc2U5djdwSXRu?=
 =?utf-8?B?WGpYVlZOc3lYc3NkR01sQkc1aFpxbUdzZ0IvRFZaRmpPSjhvWTN2UStCQ0tw?=
 =?utf-8?B?SmhRdHVVWm9RNmYrdEh1Q3lPZkNpY2dyZDM3NU1FTmpWUEtKeWVXSmZxNXhy?=
 =?utf-8?B?MG55REI4WG41TmFtMC9KMnhnZGtOYmhIV0RxZFdMaUtxRzVhMXFqb2tMVzNG?=
 =?utf-8?B?NDBSYWFzOWRvNGtqaWlYZkEydlRzMm1ic2FRaEJiWml5Tk1EN2dmUC9pTWZo?=
 =?utf-8?B?SXJBcTYrYk1neFIxdGppT21rbXFSb0Z6OHRHd1A2dUpGWSsrNThBZ1d1dmw4?=
 =?utf-8?B?b0NjWUxnakJHUTM3UEZKeE5NbVdabFhadnlScHluN3gvR24zN0JxTmpNcjg4?=
 =?utf-8?B?bTlkaW5pS2Q5Z2pYWVZjb1E3ZnRUV20rNWJpdWFQODc1bURQRlNGRGJwRWdB?=
 =?utf-8?B?bGhIZjRsYkdkcll5cnRYdEFRcFJOSTRDbkwyWEYyb3Qxa3ozUm1JNlpia0Ew?=
 =?utf-8?B?ZmNjYTRFODlVbUJvaWtObWo2RllYRmo1d0RmT1VDdkdWOXpOWW9hdnVMTk5j?=
 =?utf-8?B?UWFXNjc0ZGJCZkRBL21jbXNGY1hWRXJBTjRzQ1RraGx4eER1QmM3REFIQkhk?=
 =?utf-8?B?SzVML1VjWllUcW9mVGdicDlqdm5BMnJ2MG56SGNoSW5CQ0U2OTdBVDI3QTZF?=
 =?utf-8?B?Z2p2Q0hIdWk2RzJiKzBDcHB4L3hNZUxWNjJ5UFBVMXNMNGI4UG9ZeGFzMU5R?=
 =?utf-8?B?dnhZemUyamQ2cTJoTm5EdHhmS3V1WlpKTWFhWUROclpRV0tZL3dmdy90L1Z6?=
 =?utf-8?Q?Lq4N0mr9LWRTDwCTDkwuC2gvLRvXcbcwB69hMG/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ceb4597-7f73-427e-0be4-08d8cea5b21b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 15:57:12.7996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+K2RqDg6YrZcFZtJYsJxelxkXwOAShJlKURa5D7+uCYpLNOsM1cMOlLfUl8Hnb5E+AONDLEnSk9z43wLw2m6K82w9qQ5mbbL0dr6LauhZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3621
X-OriginatorOrg: citrix.com

On 11/02/2021 15:50, Andrew Cooper wrote:
> Logical continuation of c/s eb52442d7f "automation: Add Ubuntu:focal
> container".
>
> No further changes required.  Everything builds fine.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>

Forgot to say -
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/254912313
is a pipeline run with everything green.

Also, I need to prefix the names with ubuntu- which I can do on commit.

