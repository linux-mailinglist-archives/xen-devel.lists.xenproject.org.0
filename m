Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19444725AF5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544627.850541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pjc-0005QO-P7; Wed, 07 Jun 2023 09:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544627.850541; Wed, 07 Jun 2023 09:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pjc-0005O8-LF; Wed, 07 Jun 2023 09:45:44 +0000
Received: by outflank-mailman (input) for mailman id 544627;
 Wed, 07 Jun 2023 09:45:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6pjb-0005O2-5K
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:45:43 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 114b3e56-0518-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 11:45:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8979.eurprd04.prod.outlook.com (2603:10a6:20b:42e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:45:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:45:40 +0000
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
X-Inumbo-ID: 114b3e56-0518-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbdRtPOZ1u89hqx/+u9A8/Vn+qud80V4jcjofjpKFsG9KjFGrvViRB0ju5GOipXVD2j9CNLI8585OT+23U1czlvPZg+h+lLdLy2xGLIkLjImPObI8B64AvxC8GcO5hEbJwkewDK44G/Rmygs7jY0budoK8k+K8Tw0rsBZVK6Pp3iYXICn2l/h1Fd8aafpf2uxv+ZBCK6AdC9iWvglyWEq2cy+tC3TaLW6fK8Fib/VHbwbrbbJKn/Z7IO/zKveOBDruS2HmnXsIdJ0eQdQScePfOXdnwehBIEhcd3wj21OIGC25F7UkXDb545S5MOc9kprtYQv1Io4dR8wuDXz9BKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNVouugmfcsIzMB9KzPXm+NCFnNeViitT7+nwpVyXEc=;
 b=WT7pW4SIAhRnBkbdJFT3bhhOO3WwMipZcOLpBENXCXOvv11KagMOGOx0Wg4GXW4k5ex7Zs15ePXDHarJ5FKXqFV3k7Iwi3QI3KpFrCB7j0cHO0p/TMe7CAjjHKSrfFrowJs4Wmm3YYJfb0SgG7LKmDLMUNJL8ksmWmbn1B3zOAQ5ZtTZ0mzf2of6ALJUF3WCtyAPvkhH1r/wgqVTrwwBy9XTt0BaVAcCZXQ+V7icru1kVXwm3TC4bXCoK3N3JEwUjNQ4zr3YUiGxJh7sXjIsA0f9bPdW1m6UsnYv9RMRYgCUMHdALuz27yYFyJkoQg7rGy50aYFVRbSLGAgycggEBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNVouugmfcsIzMB9KzPXm+NCFnNeViitT7+nwpVyXEc=;
 b=YKUMHeQeQMqDAGLb/C/6tCSLfV172eD9ckuG816MXsgDXf4kYZaAiN5s2ZPFMhc8BNrShbDUxoZxFGLciMLLcoG+a7RRf1xE762Jw/vI5Mj8W4t6A7/Oix4oq+MkJbonkBx0363ftYPON6iY8FGqgFrWcy0Y3JgmOm497+iSm/k3ANxNtjKC9pbJH7FkmR1tjfNHrw1dBhcEV+SzciCFys2aa2gGLe/Xj4OH9UthcduGBmQ22ELVuIJhcvitrzqVG4A9QvSvB8ScP9JZgsM3rWmWBUGdWyYnhY9VaP2ICiXSEAIzFBfXIeIHZeQ3qr6+oddhvslVMQrM38Rhc8TBzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e566c3a1-9e1f-34ba-6e09-26bd8a4c1ba2@suse.com>
Date: Wed, 7 Jun 2023 11:45:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/3] multiboot2: do not set StdOut mode unconditionally
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230601130518.48874-1-roger.pau@citrix.com>
 <20230601130518.48874-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230601130518.48874-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8979:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a231d76-3650-4bee-e63c-08db673bf430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CfiEogudtXw2JWXz72XRfeutD71PiPkwSc0KpCNe5rkBDNaLPWmjyAHso2Za1QBZ1u6hw3dHBvzXldzSNTOJaYDzzKTpO5odAulyPo7XUznoV4jpGT/nrj/BMqI++NIXKJaGKop8CimPAw7uKf7HaTeTGDNL0yHyTZ0H26pSh/Eup+FDFnUS3PcLE6vOK2tP9qEoRbLaxUYRFaIb9zZG/M3l+Y1wA6r3zwv/wwu4gBnW08R36hiPq3obLc432Rh+wkWi2R1hEVPAlPbOuaCeYQh+JtNq8+tyYoI+NUjDl+KNjCHcQbPL7xQ3AraBp1VNdwpaenkL5C7ejwdEV0GP7xs5gMHB0vRhWCtKAUxqJLgeUq72cYtv3sRjuWOV53nX6FqulQ9vRJYvm6YQc8XvbDDVHCE+zWeXf886v0VTaoUW2LTiwYIxsdEUMOKVdif/VFFr9kFALuRvtdzIIaoM0svSv+r63CmBcNZrcFg3WLEENP7XR+3BDbzUsclcl0HOq4fzziQQQmtT2y+mHLjlIFgOICgBjUYht+149Y0cyGWiwRSYDunTvkAeN7cf6o1bHXlDoStW7MJsASTdMU7lGUXtz5hRjAd2lO463DOmuT8OmYdHUg50RymkIUDMRP7yMyboRHBZeq8UIxJ+sW8Q9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(478600001)(31686004)(6506007)(26005)(6512007)(54906003)(186003)(41300700001)(2906002)(4744005)(2616005)(66946007)(66556008)(66476007)(38100700002)(6916009)(4326008)(53546011)(86362001)(5660300002)(31696002)(316002)(36756003)(8936002)(6486002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWlyUDVjM1RPanVQTmIzWFg1K0lSSmhGRXE5WnpyaGkzakp3WGsrTTV3Y3J6?=
 =?utf-8?B?Z2ptU1RnSTVTNisyRDk0UlJ4dFZ5QU5oK2syeHM3djJEZWRnREZJOTRhd29m?=
 =?utf-8?B?aUVWVFR2RHFlNVZQTEtvM2wwVEpKM2U2b2ZpdzRyZkJNVDB3Qk1VN2tNVTEz?=
 =?utf-8?B?RzVDS3h6N2dSMW51dkx6bUNIMW9KdXRiZ3lERXVLMlRLelhzRCtYTzdQT2N4?=
 =?utf-8?B?UksxZy9RcmtTNXovbkErUHFpWEhHUUxVWEt0dTRxRlRuTEI2Z3F3elBUdUJk?=
 =?utf-8?B?b0xLWThsNnFRUEtUK1RQM1laOXExSXZLQnRPdXdVbjFBZzN0L1Y5UU0zMnps?=
 =?utf-8?B?UkhLeENrS3RabVNzelpmaElpcXUzQVptMW9RQlVpbFpsZXl2NGxqZnVDTmxK?=
 =?utf-8?B?N3d2OTZYcVR4RURwUGlyWTN0RGYyT3VvcHB3YzQwNTBGWjZMVDZEVUc4eGNl?=
 =?utf-8?B?Vy9kWld5Y0dpS3dHTHNOWGUrQUdLM1Q0TFQ3MXJDN0dGbFhpcno3eVJMV0xs?=
 =?utf-8?B?dWxhemtVLzR3dHVQQ3FqcUc4aEc3L2Jja3l0QUZtQ2tPR0oxbjVHNVF3S2JD?=
 =?utf-8?B?RE1JY2VtUjdINmhPSFU2SWdsd1gyWEVFUkF1cVhCT3d6cysyWml4bFR6Yk05?=
 =?utf-8?B?Umt3TXVxblFTNnA3WGE5WDhrV3ZGcngrakI5K0RLUDB4aFFwOFE1eG1CZHRM?=
 =?utf-8?B?eUdCNE42N0ZBa0o0dmZ5a2V2M212ekh4YjQvdkYxR2grUDlMbG5HcUtaZjFE?=
 =?utf-8?B?dVlkMVBUVkNtUmJNZ0tsZGluM2FWWituUUM0QzE1ckx1YktjR2FTbGc4aTZl?=
 =?utf-8?B?SHFyMllSWS9sd2llWS9NR2tuTW0vUGkxZzIzTWk4YUhQbk9JcXorR1YrMkpq?=
 =?utf-8?B?ZWl3MmZYcHYzTkt2WjBYR2Jka1MrWXlkTlBCUTcwenVzS2FMUXVkVzV5aHBS?=
 =?utf-8?B?WlZoNjd4MVhta2ZtbjI4UnA3KzlxdTdDcWxweDRkcWhNdHlRR0FtQVBOUXZk?=
 =?utf-8?B?OWs3V1VNMnI5TjZaMjBYaUJyeUtBRXJLa05haklGVE5hdWY1UWNoc1ZUZGFk?=
 =?utf-8?B?K0JqRGs1bVhHMnFBUGgwTG5teWErbVNLNzB6NlQyVjFoSnVzcUszdE5BZVR5?=
 =?utf-8?B?aVlEc01nTVN1SWpiRitKcWZKaDVaT1dTdzZXSjNLc3V5UU1ieTg1M2d4c1JF?=
 =?utf-8?B?aDVHTUlWZ3JYbzdQVUhiMGdNS3FReFNwUmIrdkJHS2tVN0txS0FkV1FwK3lz?=
 =?utf-8?B?L1UrQkZOYldQTE1KUm5wNk9KbUtwaC9UVXp2K0haRU83VkVwdmpmK1VTMHBN?=
 =?utf-8?B?OEpxdHZ3NFNYOExHeFJhZXYyOTVqMVJEWnBZU2JDclRWNHgxMEF6TmdBdmtG?=
 =?utf-8?B?Z1ZadlNkSWVzS0VTWCswZUIrUEVKMUE3Ny9OUWV1SThBUnQxbUdDdFRPMGcy?=
 =?utf-8?B?OE83Zzg3V2V0ajMvc0JFb3BKR3FabWtCeVg0S2k4Tm5IU3MyMkRZenQ3WVIw?=
 =?utf-8?B?L0lpZWNzQU5GQ05jcDhxems4ankvc1VWdU0zMUh1RUtOaDJBUFY4TU52VDBQ?=
 =?utf-8?B?TnYvZThnVmc5UmRMMGtYdURQYTBwRHBXK0FzWWVIWEJUWlJoMGVkQ0sxSCtp?=
 =?utf-8?B?dVcvYmZOTVhicEtDRUtsQ2pOVTcyVEFPc3dYRzQvRXpXd3BoOTg1S0VvMUZF?=
 =?utf-8?B?YmpXcmoyazEyVjFqVlBobTNRRDJLN1VuTzRKOFQ4R01makhmZjFIM2VlMTJ0?=
 =?utf-8?B?RDN5WWpVNUpVakZGVFhTZ3l1NEFJemJuU0xmdU1NU0pqZFprMFNrTnZ1bXJk?=
 =?utf-8?B?MFRicUtyK0JiR0VYQnJwSWM4MXg4cTRwMU9zbDRiQmQrTzhyZzNic0hnd2wy?=
 =?utf-8?B?dmtHMTVGaE5BVDVOOHJwWmFlU3grZC9raTRmUVBEekszU05IaVcvNmlyMjBy?=
 =?utf-8?B?OFVPemYzWDdjUzRPOWMvelJSUlJIc0YxNTg4cGlXdE9GVFVxam5uVUhybDdH?=
 =?utf-8?B?YUU4N2dDNDhTZHdaVTEybmUyY01DbzcwMk5VSTRUM0lEditPcVlDSzlrODlQ?=
 =?utf-8?B?VmtMUjRRdzAzeitGL211QWdDZ3BOdjRDU29remdYd1d6MGZIeWYvWWs0TWNo?=
 =?utf-8?Q?GgYS1ElxrKwrWIavHgqRfZXEz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a231d76-3650-4bee-e63c-08db673bf430
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:45:40.2027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljr5oARV5s6vjE17mmG8l17hQXrz1m9iBEW3+nrioNo+eR0OYYXke/Wj3JfcFr65oP9jnNy8pQJabcG7QarNpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8979

On 01.06.2023 15:05, Roger Pau Monne wrote:
> Only initialize StdOut if the current StdOut mode is unusable.  This
> avoids forcefully switching StdOut to the maximum supported
> resolution, and thus very likely changing the GOP mode without having
> first parsed the command line options.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> The code is very similar to the approach suggested by Jan, please let
> me know if you would be OK with your suggested-by tag added.

I'm okay either way; I only suggested the "how", not the "that" after all.
In any event
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

