Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B076A0899
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 13:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500317.771632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAiV-00068j-H6; Thu, 23 Feb 2023 12:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500317.771632; Thu, 23 Feb 2023 12:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVAiV-00065P-EM; Thu, 23 Feb 2023 12:28:55 +0000
Received: by outflank-mailman (input) for mailman id 500317;
 Thu, 23 Feb 2023 12:28:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVAiU-00065J-Hx
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 12:28:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1b1f7d5-b375-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 13:28:53 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7759.eurprd04.prod.outlook.com (2603:10a6:102:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 12:28:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 12:28:23 +0000
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
X-Inumbo-ID: a1b1f7d5-b375-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIMq1iyT88GYH/mT6gej5LR1oP6K5SiRyN+MmffOtbk0AtG8zyMk6jtXDrh7wxlrPUt8Ufz7WuIAVW2WlJ8pwpzQUt9dP+PRPdZFG0Jm1fevBtnMRimJD9bGNVvYDB+nin44IbppM15uQVNF+y9KdIIJZPkX3eQXAVuWdwUxYdIfw2NTYDNwJf9CDnfOQIRbXxQvQLFbtt7n1EVt4+Tlbs2mS0mUNnADrxJQhRivow/sMdz/ZPxL6n8ncyI2oMuRVFlY4Y5TG26XqXQCAFXHnXdQKLyKvHTbQsCHmGdUE6FDK34pX4y7cUOyr7r30emt00iTM5R9bWpZJ15koxGiHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+Vr6wRiH3xVAoXF8GuaPmDakIH0DpKdCTBHphn9N3w=;
 b=KM+04DyDesxwZFMjbjPq4pFIhLIp783PkbhAGHmj7uJU+KAaYB8YX8/oMGStvk0snNvm19ah2AceR4rInJe5QTQrgpigAZ1LDmDfacV05/94jbGK29qJIyzTg3R5s5iGvSSBnUenvpnL2tFIDpbjgUYFNlZqFpZuoW/gGPFlpfqOEBxFqndgutIUsI1RlNxO/eb9Chnnmu+M7V/U2oaDJrNKlkavNh2A8GvSvmO3kX67Algju0bGUkOG+Nep9VPK3bPYxFWJqzEcRtNZmxM442vHlR72DzXTb1oCPO52+PBnqS5m9bYpJK67IhspQlb7R0r+w1A18EMHUnmvBCKkqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+Vr6wRiH3xVAoXF8GuaPmDakIH0DpKdCTBHphn9N3w=;
 b=ylXr0rB3NTIArKI/l+a1jIjQJ8U+IbiGTk5sn5gLcjLTHlpzsnG5/j9D0JgUmNcFH1mYxHgtBdtPtoyHqThTqGUxJEWGK2i1yjMTGJXcDd3XH9wWRiJpVVySOXcJrF5iZfC4O1Ld1zecrD7uINpZ3bsWm5WlHzF7Ai8hQlj8g+Nd+yijiXnchp53woXxcnyuwbQYs57Gb/1CXJ0BpWpeOQ7KuYdSDax1wqJ60Fid+MtGE1kNL9Vhg9cciAqwkMB8HGSTDDVdZwPBAPFdWeQ640Ed42zxyaVAy0LNEpd/73Zg02djsCXFnDqlKEsce6CAZ3Bq0YyUl2Fh7399GCoT8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a088a8e-2d9b-a89e-b7cf-65f9341884e7@suse.com>
Date: Thu, 23 Feb 2023 13:28:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86/vmx: Correct the declaration of
 vmx_asm_vmexit_handler()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230223120757.2549079-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230223120757.2549079-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: e07baddf-fb3f-43b5-2b09-08db159974c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3/fEzUEhOK3xVOrUH1E6Hqi2C1H1zh7CKLxwZqA3C0QHNShkuBG56U+1/EAAopoKivK9VeYogpq77bBrQKGN7IMVqmJnIgXF9MBYLOJkUvliYflkxki1Xlu/L4diBwDEddqWzh1OJTXYgrwPr94xtP49+BzFq/1+pdc3EP97kn+Odn7F8vgkt71ol+H24VwAPqHKQH5IMziydt23pVmzETVt0O/ZudanjgZejQk0/fVHVdnKFijMWWas7NwJnXXKqRYRfjD6EYGNThjsLrx1DeiGx/vlWshBUqHULm7gBk3+MzgbtUqKs0SS39kUGee+PwFVwJL8qaXtUaI20N9a0wSc8yeniy1pNjy7QoBm7JWhclu3g+FD9cZlcvUZy61w8Mk1R0jAUh3PuuBi00EjQqVwjxuomv/5YqGTqDyUo1IGDQkuHKd3QnoFB26tMbRa4dUGto8g4Wf9eG3NmzO7aKRQDOZQ0OiMki9vsnjE0RxIS3f68ZZ8Q0ix2vF2gqjwolGnK7tblzpsSo2u4n/MsV8CnFMpGzqm8qCn/6xOaFoDMnGkwoqAodZldwSwYsCFfYtFHFVyjZ9EYNT/Oni2WOtB7bloT3LWMAmTnYVzpbIr6Jx67Hk0t/PYFXhXXFFcJuJDFyBPK690nJh7gpnk7hjdXKIO+ShL6/SIKMt2hPycSOhW1w5bKV/Hkw6GZ+QbMFgLipZCbadW16Fq8EVOnK8o9xBqthhBdJ84KqcoRRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199018)(186003)(26005)(6512007)(53546011)(2616005)(478600001)(6486002)(6916009)(54906003)(8676002)(316002)(4326008)(6506007)(31686004)(66556008)(66946007)(66476007)(8936002)(41300700001)(5660300002)(4744005)(2906002)(38100700002)(86362001)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1FnZE5ja3dNVDJWSVY0Z1AzU0d2Ty9haXVJeEtkN3VFRkJTQ1lCZkpHMm40?=
 =?utf-8?B?L0h2VmcxS2cxdmpGSXgyNVVwUHVuN29zeG1SOWpxYjNackNNV2tNYklKamFH?=
 =?utf-8?B?U1FseEJBLzI1a3p5Ykw1MDJ4aUlCY2pYUFpRZ1RhbTFrTHZWSzA0R2lnVkts?=
 =?utf-8?B?OXRYeDd4ODVzbEpDaDBrVzVzZHF2SFF1Rk9wemY3VzkyRi83OXNiNWNxSW1u?=
 =?utf-8?B?WjZSUTVxaENtNnltU0c0WGo1ZGFvbjFVNDRab2ZlRTlsVG00TXJoQXlmb3Vo?=
 =?utf-8?B?VUZkYzQxT1ZSMFlWcHk2U25CVjdnM1IzbzBTWEtVcXV0UmE3ZW5yQ1hpdDB2?=
 =?utf-8?B?TTdNOW0yeFNSTzg3RnlaYmlKSG5xVmRtcG1ZSlNKNk05OHU2cHVnTkFwcG9X?=
 =?utf-8?B?U0I1bms5L3N2eDRhUXBTQWNnclV0T2ZKSHY2a1g2ejhwRjdpb1JSOHBaV25m?=
 =?utf-8?B?Vi9yVCtNQzdudzhDZXVqUGFSaXM5Z2pVbjVaZFk2NWZzdVB5ZUgrOWJQcVVD?=
 =?utf-8?B?T3dDa2ZhNUtFbVJINlN2NU5IMitYT014blpEMEZPWS95L1lPbmJxYUVXM1N1?=
 =?utf-8?B?T2F6Z0hLdlVHNGRQZVAwMnV1YnI4ZEttajY2YUNFbDg0MW5iTEFERG9lL201?=
 =?utf-8?B?Nm45aTZEcWxUbjh2WndnSVBMaWtsTHFzNTlnZHpNVTRLQ2w3bU92Unl2Mzlr?=
 =?utf-8?B?UnRIQ2h4eHo2ZnRES2s4ZUtuaG8xTHR0aHdtOThBRVJXSnhSY1BYQ2JXOXpR?=
 =?utf-8?B?QmdYbjRza0ZKQmhQc0p1d2tLMUhYUTY0R085UlpnT2VvZkx6Y2dMMGRlS1lH?=
 =?utf-8?B?OHVZbE53Ulh4Sm8wdzU2a2lFc0dUbUlhQVQyb0hMdmNJYXhlcUQ5d3BaTnoz?=
 =?utf-8?B?WE5OTWhMZ0RoeEpvWDlYVW9SSmVCTytDSkt5a1VvNGNSNWJoQ01oVm44WS9T?=
 =?utf-8?B?SEQzQnl2SlEwbnh1RUp2alJ5dXZtN05ib0lGOG9rWjdLWmI4OHZvc3p4OXpz?=
 =?utf-8?B?WVgwL0hqSUZqTFhKUU1yQ0kwY1VWSWZvc2lHQ3RpWnowbC9IWk1qalY0a1Vp?=
 =?utf-8?B?S093YVdGa3hnbVpvUG9UV25nM2ZjM1Fra1h5SWJQT2xldTFwV29sU2pJZm1P?=
 =?utf-8?B?YzhJUEpneitLdWJQTXlhcFgvNG56N2NoMFpDVUhDaDA1M2g2N3FpM0p0amVZ?=
 =?utf-8?B?djFQdkl3MVBTYnVJOXAvVURLM01WSmowSTlOcnpvZ3EyM0puZy9lRkVWNzU0?=
 =?utf-8?B?Vzk3aHE0L0J2aW02c0JWZk90azYvL0N6MnRkL0ZmNEhzSVZiVWF0bDhRaG81?=
 =?utf-8?B?Mkw3ZUpDd2dRL3g3WmY2UmdiSW9vM2hGcVF2TmROMlBwa2tldVkvQ0ROYXJN?=
 =?utf-8?B?OGFwcXAyalhsem94dGdMMzdma1U2Q2lIb3l4N2NDdTY5RGt2M24wdGE1dTVt?=
 =?utf-8?B?dWNMam13SkllenRTRU10a0laN2NOdnBPRzNDVS9Zaks0NHR3WGJiREsvZkx2?=
 =?utf-8?B?K2h3Rlh1Mll1bC81RXU3NktUUnpNN0xraG9XMGx3ZTNSOFNxY2J5TmNmY1Mv?=
 =?utf-8?B?bTRQeWl2eFYxZFk2TnRuekdNbkdMOEJUd2NTTVB3V2gwN2dLbExJbitkMGpD?=
 =?utf-8?B?NmkrNzZ6WEtLRW1OaDRjSTNJeGtRVnVHUFVlOE1IR2ZNTXRHSk9UdVhGNGNV?=
 =?utf-8?B?clVMbUwzSklBWTB6RDNMQ1ZJTmw2Um0vWDFJanIyY3Ntb0JQRmVVeUpuRFRm?=
 =?utf-8?B?bFljcXZsV1RhNTA1K2daUFU0eWl1V1l1THU3b3A2TCtNanJKekpjRWNiRTlR?=
 =?utf-8?B?ai9Hd2xZYTYwVzBaRzVmREVYaW5LcHB4eFdxWDVESHE3NzBmdmlPNWszQW5T?=
 =?utf-8?B?WTlzdEN2SGY1QWViQ3RkUjl1bVcyOG1RRWxiaHVyWFQ0cDcyOE1Tb21FTld5?=
 =?utf-8?B?T1ZUWUNPRjc4ZHU1SXRGRXc5UzA3WGM2T1lmZzVlMStvbHlETlppM0k5V3FW?=
 =?utf-8?B?VEdmWHdkSVB1OHBFbEVWVWtLZHlnOEpmSWI0RlpMaDhMRFZXQkt2aTJSOFJM?=
 =?utf-8?B?MklQeTNFdTRXRjc2NjhWNzJYYXdoTVZ0RWxpZVRIcVVvNEovSS9pWmVIYW13?=
 =?utf-8?Q?osbdYggoa8wbF6f0aTVUWNK/v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e07baddf-fb3f-43b5-2b09-08db159974c0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 12:28:23.7706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwUjIFFAVDJUeqC710mZ0oVoYVUgDF6DRphcD0sEUtLRxzmMexF61jlri2cLaI+95fuPXRejj74a/bJ/lJKPBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7759

On 23.02.2023 13:07, Andrew Cooper wrote:
> Taking struct cpu_user_regs as a full object is bogus, and while what was
> probably meant was to take a struct cpu_user_regs pointer, that's still wrong.
> 
> This isn't a function; its an address stored in the VMCS that the CPU resumes
> from on VMExit, meaning that it doesn't conform to a normal C API/ABI.
> 
> Annotate it with `nocall`, and move the declaration into vmcs.c next to its
> sole user.
> 
> Fixes: 9c3118a82523 ("bitkeeper revision 1.1159.1.483 (41c0c417XYObowWqbfqU0cdLx30C9w)")
>                  `-> "Initial Intel VMX support"
> Reported-by: Jan Beulich <JBeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Since I had to look up what exactly "nocall" expands to, I'm wondering
whether it really is still the case that Clang doesn't support the error
attribute ...

Jan

