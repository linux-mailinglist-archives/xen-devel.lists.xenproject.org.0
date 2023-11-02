Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595557DF3C3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 14:28:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626905.977608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyXkK-0003VI-Gb; Thu, 02 Nov 2023 13:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626905.977608; Thu, 02 Nov 2023 13:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyXkK-0003Sz-Do; Thu, 02 Nov 2023 13:28:28 +0000
Received: by outflank-mailman (input) for mailman id 626905;
 Thu, 02 Nov 2023 13:28:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qyXkI-0003NP-MN
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 13:28:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2f4eea6-7983-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 14:28:25 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9925.eurprd04.prod.outlook.com (2603:10a6:150:112::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10; Thu, 2 Nov
 2023 13:28:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 13:28:21 +0000
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
X-Inumbo-ID: b2f4eea6-7983-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIqaJAUhvbn/KrLXGRcfC/+wy6qYDcaG0y1KNz7qMpy+F+IsXvsr4E+DK/y1a7HjHV5lHPJbxGKpA7ZlFnpzohkO7zzkJVNa5Vo0ANYUbDDkMtqf/MSrcyO3cCfDEFWpn64JslQO8Wfb8jwy7astO7REesPPYZhlnmUdQgtey1A4adNeeG1MoGKOtT85gUlZ2+Z0eEZArFrejOyTEba8qXU8AaBIfuZACnc33gGm/jqYpCxsEt0A1/O1rttkvtbQO5gW1wIMTfgmmNmijDRdbQ+1Wpau69TXOfGrRPhBHf/QQN16eSbECk+rNHlP9It6qc8VIQ8JETfRfENZU5C/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYUscSSUCxAQepHs5OWsrqUs3DPmLjqHYNo2fuZb48c=;
 b=QqTMNeEF99eEewfHO2kt1RrUBxSk76099cuzvmVXccidqyjo1eGKjuwdX1qY5kMMbiYi6tPKPpwhxvXEIBk2c0ymOa1wFTNV6XHD46eC8SrCkYm9EOaAzcJidpCSwacj76vgY84Uw123N1etf2iaCjEoC1UlbLAwk0iE4KNLbAxURKKJASCj6/2kVP2Q+dZN3dVHJJv3jQQ7SwewrXPnO7egUdrF5vXazYg4Q1b5Dy+hrNt5iOegUg4x/6qFCWC0R5Jls3mkerJ5dp0CR274BpsPali4qN/Fy/jqU1WTjJhaOSmHJ2QDVWF5g6V0DVx1pGUPv0H9sDDCOvqbtoZBaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYUscSSUCxAQepHs5OWsrqUs3DPmLjqHYNo2fuZb48c=;
 b=BYMgMf+Xki5kpgIyrNs5UbZQKCxAttqSVTLp/giYbb2F7a7hs3KT8UrADhbWMtX+faVpI9hlQ2I1uKs2vymLNWTNazyfNBsEFsQR5YbbtbxAgwhTwCC5hhBx7mZspglwZwPVtlVDbyU/foM1PSlNBOOoA9zOXNJstYNIcySaK1g61UV9iZtbsBOvRERahGcxO6HxGetcaNjG8qEStsxuoHlaptm6brU8nPwB/UKkd1+tGgzA2j1wBHVPn/1i4Rrx+sMzpqgCbHsEKJsglEC5HNBJk+dJCUREfOBD8QaQDNL6jOYWOBJluutWnibs29rUMSQRr9MUD5O0a2FCX38ueA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d3704ac6-7ea9-cb33-4890-f3524bfef730@suse.com>
Date: Thu, 2 Nov 2023 14:28:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v6 3/8] x86: add asmlinkage macro to
 variables only used in asm code
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1698829473.git.nicola.vetrini@bugseng.com>
 <8e7762db94449c18e88171658c758a227e1fae9b.1698829473.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2311011611580.2125691@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2311011611580.2125691@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9925:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c940d7-3c4e-4a9c-2815-08dbdba7952b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jP0iZCPjZWP1aZm0Q5tzQy1OGWNJYac95oBUUP18IjeSZmI6AzZVBIEcdsLcRaviLgeRI/KVMQx5pC6gCJGOliD+CTEeryl87G0DHPBydNzq+gtCtPlpXSl4ZAkLogAcFotzmzA1QgU60Wktp8XP2DG4TCH0yFsExGfPZh1R/xwt2krlFlNmF4o36uJPAz5K9uhrk0fYRYrCclBQhmRoZaU8lfp8W/EGOkTpwPx7Klz3D33jBh1bL1WOoDbFafVQmd0BEBoubN3TSmoLndyWqjCqAfO5SCSu7cBwQrFwP576yubX7+tNOcO+pOgqzk0xScdUSy+FEZrKLnH2W3NPii2TlzUdp3DhJund/4C4syT5f+HyCc0qMTDkoROVVT+75qq056/nlpE5k9zYbDBMssxrJBYcQt1aaqNIX9lzBLzeSs4xDOq3ugQ1+YHjlDAcqxbuBkhDUtihWy8c9vyClK7E5ct2aaBbYhHYnVK4NBv5ec9kqskX6OsmxG21lBz/iDPISc6xKj34bqTDWLzuPFgOXDRRnUAkMbm8KiZffqQ6mohk07o9RjzERiTA5lumI6dymohC5hR1i1OahH9lIaPlIu3LX1h/oIykoa6fftitHbmZd48UsQfBkVHDniI3A4SeU1p74DVolytI4Vsq+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(38100700002)(6506007)(53546011)(478600001)(31686004)(2616005)(6512007)(7416002)(31696002)(41300700001)(4744005)(86362001)(2906002)(8936002)(8676002)(4326008)(5660300002)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(316002)(26005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2lUVnA2K1VpKzdMWng2VGlyZ0RlbS9YWmg2cEhrUkpzTjVRbG5CVURwQWdC?=
 =?utf-8?B?OWc3WGUrbVZjcDFpNGR6UnRMUGtUdWZVL3JjR2JEczNncm1ZclVObkV1UHhr?=
 =?utf-8?B?RUwrTUJrZDdPSWNkdHZMeWZ5TUFNbnpzQmxscTdOcytFajE5dlNZRzZxR0xJ?=
 =?utf-8?B?RTVCNE8rN3I4cUUzWWpWTjJWTURzQzRRVU5mazlPTHE2SFVuZUt0eTd3OTFq?=
 =?utf-8?B?a0NmWXJwNEp0Sm4zR0xYQlExYmJ3QW5VWVJ6ZTF6akQ1c1RpbGFQdHkxM2Zl?=
 =?utf-8?B?cXQyOTNjMmFLU2toMEFpTkRVTnREcnVpR2VFWXEzekEvYmYybjRrV1Jkb0tG?=
 =?utf-8?B?ZmcyMlB0UUhDREtXQUszVE8ybjJOVi9KWHFwUytDRUNaVEV2T0FNN3kvZlov?=
 =?utf-8?B?WXJ6RWNRU0NmNmNyKzRQcXlRNVhVV1ZKUE1jZ1R2UGV2dE9ueXYzdlZTenhs?=
 =?utf-8?B?YXlmVEYxS1hnVmVoYTg3aDhLTkNCekFjLzBIZVAvWDFEdmlralQvbzk0MU82?=
 =?utf-8?B?N0Z2RkwrSDJBRXZ2Y2JMN1grMjNtQmlTR3l4WXEzZXFjeUxtNDU0QUFUYkFW?=
 =?utf-8?B?QXlOR1Q4dWRQNDlzTnpnZm9zVk0xNmdJMUc4MStuTy9XeU1la1pSc3VBMy9t?=
 =?utf-8?B?MEFNdm4wL2FMM1JBMmdnT3BxTHZ0L1dJbGk3a3NLdXA3UkVRSnlUN0NjUzA0?=
 =?utf-8?B?SWRkNU9nUFYvVnBUNWlJc2tCQ3VzMmxCdVhDVlRzenllc0dUc0k5bDJLV2ZN?=
 =?utf-8?B?N1JvUjNpc3REU0JVcGY0MEdXY2RVT0FmanpJVkFBNm9LaEZKV3UvSGx3UEpO?=
 =?utf-8?B?Qmp4WEhSREdMQXlHRWZwaGtLcTNZZXdMdWpQcHVXZlBEMkVGRzYwTHZWdmhT?=
 =?utf-8?B?WU9ROC9kOUxCeGVKdjV3MW0yTGYyeG5mM0ZBdzZRSHk4MmQxNW1JTnlrQkUy?=
 =?utf-8?B?cHM2ZU1Yc0Z0T3dpOGV3RTJOOXJ1ckpvYkJFK3BJSGFTcms4Q1BsTWZpdXd5?=
 =?utf-8?B?OTVSZmVOaVBTQTBHT1p1MVpuaVVlRTA5cVo0bE5YQTJCOFNMZEZvSGlZQlNX?=
 =?utf-8?B?d1RsaE5yQjIyc0VUZVU2NFNMU1NlMHd2Uk93SVZxaFo2ZXZNdUhUTlZJWVcr?=
 =?utf-8?B?alNHRjk4c0lidXV1ZnNXdUtNdVROenNHWXgvZFpHMlRwRXJJajRqSnpESTNI?=
 =?utf-8?B?S2tOb3RzNEs3eHh1ZytxSWtUQUpVT3VveWtjT1FMTmhSaXZDcCsxU3pQVlNQ?=
 =?utf-8?B?WkppVlJOY29KdjJ3dFh6aVcwSmZrK3lnamZaQ05DTy9maExkZXVBNDJyVVp4?=
 =?utf-8?B?VGJBekdoVi9qYmthdTQvWDJ5NCtqQWhjdDdkWStJUlZxYUw1N0hObnloN0tY?=
 =?utf-8?B?MEVicW5yWW55L0J0ZEJDWU9md3phZTQ5dXlqa0VOQlZBWHhEZklNWlk0RkhN?=
 =?utf-8?B?bWtxZDlLNHBkRE1hR0sxRlpKQmxldTFLSWdjaWE0ZTNPVmVXWXdYWVRZbkdD?=
 =?utf-8?B?bGRDRDRsK1M0a2k0RHBRSW9mMkFDMVR1NzVJcmlrbVFURk1lSjBTZlJscG9C?=
 =?utf-8?B?VDZZUUo0QlREaTZjRVFyZlJQK1JzNHJhYUlzMjZtQ3V3TDI3OStSS1hCQkZ0?=
 =?utf-8?B?am5KOSsvQlZaQ1Z5S2p6bEZOYjlpczY5NG9DRDdmS1pmVnBQM1J2QTJ4bmNW?=
 =?utf-8?B?K2FiRlJrVWFuTW9rejhkTFFmOFFGUkgzRHJLOHRBa213UTJFak9kdjVkN0ph?=
 =?utf-8?B?Q3VMTjRvRGF2dGhUTklQcFJzTEdieitoMDdlWXFobFlnU0hOQWVzekxPVWgz?=
 =?utf-8?B?VDZxWUkyZVJMbGcxY0Zkb0xCLzlmeTBtSXp5RVRJWWluc2R1YUlOMTcxRG85?=
 =?utf-8?B?cU91UzVFbytWdjZ6NW93VkxkOUk0bWtzbHltYTJQTk5vUHRsSXFkVU5USElu?=
 =?utf-8?B?VmtVWjk1bmxnQTlNNFJ5VHovM3hpYWhTVEU1MHkyeGhtVDRKZXR5cnI4ak5t?=
 =?utf-8?B?MDhKem4vVjFGdHdmRWNCOVEycW9mdnU5b0wyaXRQN1pjNXJjb0NKTTA3endT?=
 =?utf-8?B?Z0FCYmtyWHc0R2xiaVVHbkdlMjZyTnhMV0s4bEIrbzhBbzIyaVlPNDRENmxH?=
 =?utf-8?Q?0c5TkWNm8H2axPTKgR6Y79Won?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c940d7-3c4e-4a9c-2815-08dbdba7952b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:28:21.2794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1AtS6/49KPOqH6myAcC7mV9kkks4DMDUNobfJRgo854aya07rVc/LDmXBuy7B0d7I6VkOpk/IQmblUbOskrsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9925

On 02.11.2023 00:12, Stefano Stabellini wrote:
> On Wed, 1 Nov 2023, Nicola Vetrini wrote:
>> To avoid a violation of MISRA C:2012 Rule 8.4, as permitted
>> by docs/misra/rules.rst.
>>
>> The current_stack_pointer is a declaration: mark it as such
>> for ECLAIR.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


