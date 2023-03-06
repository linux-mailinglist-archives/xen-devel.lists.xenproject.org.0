Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79146AB70C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 08:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506697.779817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5Gb-0001LR-AU; Mon, 06 Mar 2023 07:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506697.779817; Mon, 06 Mar 2023 07:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5Gb-0001Js-7B; Mon, 06 Mar 2023 07:28:17 +0000
Received: by outflank-mailman (input) for mailman id 506697;
 Mon, 06 Mar 2023 07:28:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MPo4=66=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZ5GY-0001Jm-VJ
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 07:28:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 735c4cab-bbf0-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 08:28:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7402.eurprd04.prod.outlook.com (2603:10a6:102:89::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 07:28:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 07:28:10 +0000
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
X-Inumbo-ID: 735c4cab-bbf0-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+0NyDpatGgZdlU9NwyE46HkEA7YkpuXFqPCM9rPiuQmKwFNp34Ep5slgBJz9HEPHtAsrx5W5xNFCYHGIhkXijojrLbNP33juK9pIbnImgs3SYAb2R7jY0nOiRLdmeGeI7swy0Bt3R3AlzceGTdvcJ9kMwdrUy+Aoudpi7OgRHuwYnonMGEO/JyirLLBuG1IJGst3F1ccXeo2LotLKGlKx2ryg9hIw5GbDFpsdGbni124dQlvNthfcQ1hKb5p6eU0nkrLw9iqLSkI/7Oadz1oEQvJshR+dDoR+oES5XPoUa739q3+/x7sosb9Xq1Bq+M1ynya70gR3C0VToGrot56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnTEM5sugEarqJS1TS9HMZmbYxJcHJiesU+HYURsDiU=;
 b=KBPz/Tl60V2YxaPwphxwq8MdiX6j/Xg4AffaDnO9aTdIQvw4Qnhephtr+24Z7OjbrKDWNF2N/eTPd2jU0ytuqYh12ayL8mrS32tqM9MARJ0ZC8ZjZU/WCDCrQMxAumnGOrCHl1h2Yq6lzZ3OWSc2Dx07AW1gVd3yBC5bGn2VfoR4EFe1Zvrv4M+TsKKKmbEYHnS1gRwmo7fpCC9SBfT36uRS91/henwagHo1EQb5C8+sLPlV/iDqm68c/PLCzieCpcYzAM81vOQBJ2b2V6QHlDYzztNEMdIncg3vCbG3cxzGmdZfUR3qSYgVuC5tl9x5Vyur344uEiZV+VxpTqejnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnTEM5sugEarqJS1TS9HMZmbYxJcHJiesU+HYURsDiU=;
 b=OSqnE+VuJEa3QuePZ6H2W+2APvEH7y83FJUNxsLXb6UgsrOw+JHjvDO+ltb7AbL4JWPCypM8MpHBXSLLRsWOYaR8DGVVyzQ74XD9hI+of4tbKAy6xUAgLbSYHhzbonf8HIc2pA7H6TWD1GHIFzCcHJ8TY157g8lukfvuCNMtXxcKwUcTARCynb7JRtdU6XFOnZZcno2GspfnSHQs0XxlmZvNYfIwc0Cdqg3zeZxWcYTlXjxOlrTGcyaIA++ut2PoThPdjeKakN6NBamS7itNfQfY9S4B/Flzgy9mwBdTq64rV2OiJAYsajo93ZvXfcQB7DKGTxkre85ZWPJW+FfJqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab40c09a-86da-faf6-6976-fa68537d5ecf@suse.com>
Date: Mon, 6 Mar 2023 08:28:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Backports for stable branches
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <4257ff30-0ece-4138-20f2-b7a3e5a91522@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4257ff30-0ece-4138-20f2-b7a3e5a91522@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: 66006316-6938-46e6-3a03-08db1e145664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZobJHhiYv7jISIUeojJBpKWi+teQTnHUEYKgtcJaVYG58gWnMpgi3cttgAxNWaqhOaqk19MZPM0VcqvQzSWo+GNMjU1XZ1s13EFneUdqZlWAL0SXC3qClYhDeKSCIdVMquOQI7uzHB/PBp7pUD/1gramxLavLnTBw339JYf2xME/O9fJlkP9PfCPahy69ATz3UVnA8J/UY3sAilz2qxR3jbHfwDQWfGrqR8N54Muaq72KMziBTBGBkTQfmOq2jnluywSF11YnOjNvS9BaTXGZt3qGmuJx+I8TzYDtkHngpyU19AVkVyWCk3o16SkbFjvZ9K1ss4PorppKhEmLiDNHgcbtPskBOqJS/5HbpallI8FX+ixX7qkGF4XzScMCP5G2iwUyn3/6bRfGbk2xp+cIYHvMiX1/Dl7F+DJtMaT5LlVEmjQ7jCEhNgt0t6frfOWxhJOxGIH0++m4XuQLm4n9WsoX+KFGsY3DT7rr3WPwLn/W5cPcMzv5X1HUqoWEr4jcpW/07JHPEOUMz7/zBB5fIt3z0cLNCNwjzNz++zkdalanKr3Ht1KcmozCgVHBn35uFZrkDiTO6s2YDL+3jKnmohUb8enl0qfx98jl0vbQOHQ9FJhfoVfwMIhcDuL3EHaIrVpTOsdBh2rE8xrZDRgZVNe60zqJ2/RS+pgCndsHIDThIKZjJ9DYX0t+jJ/InC3fjGFeeF9xr9O5A9SXK6uXM8H/YQfJjkBR7heF8GEPwdsiOtvfswrvq9PcEVbl9bY1pwe+Y6yxjMqWpYfupBKVSc5s3iE76eWI5sEABHY5pI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199018)(8936002)(31686004)(5660300002)(66946007)(66476007)(66556008)(2906002)(6916009)(8676002)(4326008)(54906003)(316002)(478600001)(36756003)(3480700007)(6506007)(6486002)(53546011)(26005)(2616005)(41300700001)(31696002)(86362001)(83380400001)(186003)(38100700002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2xvMnZSSGZIUkJwTTUrY1h5M3g5WUxjTWxmeVNvZjhFdHMzTy94dVFQMzFV?=
 =?utf-8?B?L2lqU01qUG8xRmJic1F4TTR5ZVlqRXJzRC9RT2hDN3NEd1ZmbnJtS0Q1VFFm?=
 =?utf-8?B?LzFpYkdHZXI3S2NJbFJpcHNRQnRtLzNxSnJtZlR6UWdham9JVW1PVmtibkhs?=
 =?utf-8?B?MVNKMStmN0ZYTk1GdTZaT0ZGaDlpRDkwaXJoS2psSnpJUStjRzFzOCtVQ0Nt?=
 =?utf-8?B?RzdtNnRGNUtlQ0VucTVRTGVuMHI3bnFQWml1cGdESnZ2R09YaXlrcWZ2QURT?=
 =?utf-8?B?K2s1dEpDVDRVTnVUeWYwWjFqTkNKMjVrNnpaeE5TbmFXV2pXY0ZNREZHeHc0?=
 =?utf-8?B?a2xvVnIrTWx1b2JuTi9CT0E5ZHpMcFZXQnlabFdnWTFiNVIxWXhDcnlOak9r?=
 =?utf-8?B?MGFWTEIxeTZJZmtraDJmVS9kb0NqZS9zcEc0Y09pZDJhMEN3UGVCdFF3Vmxw?=
 =?utf-8?B?SUR6Q0lIMEhJYTQvWUZCK2d6OFZsbXI2Zy9KQkswVHNBUG5MYVBsaklSMW5j?=
 =?utf-8?B?RWVsTFM3NkE5Y1hHTXdIVCsvaEJUeVRCeFVITHZCbzFHL25RS0d1S1VvZUlW?=
 =?utf-8?B?SGNxb3pEUVV3eTlPMFhjRUtmc2NEeW9vTEFpc2hEY3h4Y0FZblhpNkg4bWxn?=
 =?utf-8?B?YjdBcWFMK1NEYWxodms5NFlRNVZmenVXZGY1WGw1TStmcmhUTzhwaWpoRHhp?=
 =?utf-8?B?UWVtck9ZT0hVaGZOektVMnBnK1JRVkdwSjN6eFN2dWtvTjZ3bWlyeUpPdDdN?=
 =?utf-8?B?dkM1eHpVeEpUdTBIb05lQnR6a1VjNklRNVBmODMrQW5kVHErRUFOYWo2MmtW?=
 =?utf-8?B?akRvTWZDQ1VobnhRU2ZRd0hkYStrUnhpUmttQllmcEQ3VHhLcE5xNWo1SVMv?=
 =?utf-8?B?MFY2a0x0dDU5RFBKeVBpSnBRcW1lOWl5cDRERU1ZcER1NU1vNUpxNUJmR1ox?=
 =?utf-8?B?cEpFYlk3T0pTejJRN2NLSlNhWEhmS1M0bk9uTVU5dGdoT2orNVJvcnYyajRy?=
 =?utf-8?B?V3BOMUNLaEdCN1BBZkkyR01nSUJ5RFJnRmNsUHd5R2ovK01zd3VXQlJFbnRQ?=
 =?utf-8?B?MGp2Y1Z3V0JFSHhCOStCR2w3WWZBbU9iYXUrZGZPcm81d1N0Rm1HM21NQmdx?=
 =?utf-8?B?NkgxMnovbFE4b0ZhcFlNek9nRnBGOGpEZGI5cUgwbmJlNmg0RndEOUlySkpO?=
 =?utf-8?B?VmM3aWRmQ3lpZkZodXh0TDhaZkJsOVBwc084V2xaWUFKZmh2NldKYUZib0lW?=
 =?utf-8?B?NHNJOHZlUDk5M3YwMXhTWjBVaklmWUpSZmVSOFJyQktXVS8vdGRicmh6Zzlv?=
 =?utf-8?B?OWtsblJqbDc0L1lyUVdqdHJtQlJWcEtqejdDbUFVVkg0MkYzRTJLZ0NjSVQw?=
 =?utf-8?B?by83c1k5TGRhS1ZaK2xzTHhWQXFTSFdTZ3pOQnBQZ1JBSmhrV1F4NVloWkVp?=
 =?utf-8?B?bnRQQ3YvYyswckRyZGVNUnJlcmVkaitQc3YvcHZTK3BVLzQrRWdhS0tiaG1L?=
 =?utf-8?B?cmkrTUJ1NTdEVHkrZ05kWWZXd3YzYWk1NW9JZnE0bDNMTkwwZGc5MUhnMGZE?=
 =?utf-8?B?SzRMOWpkc0ZXVDFjaGR5aWZJK1kxUXFQbzVyU3BqRXo0UjJ1TnNFa0xJVWlk?=
 =?utf-8?B?RjZxQkRmenlIbGg0RnhPdW9nUVRxSGtZTEMxVlluYmNpYTNWVnNlVmxqY3px?=
 =?utf-8?B?TzdvOFJsR2J3NURRT0o4MmpMS2FMZWVKRW01SyswU2VNMzZINkhxRWwrVVpu?=
 =?utf-8?B?QkdCSmZaSzRDR2hiOFgyaG9TRWRKM3p4OUs4NkVBb1RFYUNPMjd2SGpKSEMr?=
 =?utf-8?B?Rm83WWZhYlQzL2Jnejc2OHZhTjlKei83MENEa2R1cHUxRFIrSHJGVEs4Y2lt?=
 =?utf-8?B?K3lVSkhSNWRwc1RqVWtrVkFHWlZpNXRRQ3lkNStzakE0cjF0SEtFU3dDVUFF?=
 =?utf-8?B?Q25qbnM4ajhkdDF1cTdVR0UxSDhLM3JNS3o0NWdSa2dTdW9YaEUweUg2R3di?=
 =?utf-8?B?b0J6bGlJUjFNZFMrcCtnTm9jM1ByMlk5amh4Yjc5QXg1RlVUM2xnYkFQN1Zq?=
 =?utf-8?B?MlJ5U3RVMi9yeHVkY2FTaE9KYmluc24yNlNid0lYWlZCbGFLajlvZkloUC80?=
 =?utf-8?Q?ZiJM/R6oQDxcwvokrtTx24m0V?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66006316-6938-46e6-3a03-08db1e145664
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 07:28:10.1582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zKYpUUMU4EgBtxFvVjsOV5oiy+Nu+9pnVcFAB+mE0Bv6O71lkp86WEOVp854RF+ErV0Ai7u/NQnHqc8+dFy2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7402

On 03.03.2023 16:56, Andrew Cooper wrote:
> Two python bugfixes which definitely qualify for backport:
> 
> 897257ba49d0 tools/python: change 's#' size type for Python >= 3.10
> 3a59443c1d5a tools/xenmon: Fix xenmon.py for with python3.x

Queued. I wasn't entirely certain about these when I saw them going in.
They also had no Fixes: tags.

> Next, I'm going to argue for taking:
> 
> f7d07619d2ae x86/vmx: implement VMExit based guest Bus Lock detection
> d329b37d1213 x86/vmx: introduce helper to set VMX_INTR_SHADOW_NMI
> 573279cde1c4 x86/vmx: implement Notify VM Exit
> 5f08bc9404c7 x86/vmx: Partially revert "x86/vmx: implement Notify VM Exit"
> 
> These are technically new features for Sapphire Rapids, but they're both
> very simple (in the grand scheme of new features), and are both
> mitigations to system-wide denial of services that required silicon
> changes to make happen.
> 
> Either way, there is a security argument to be made for backporting these.

I have to admit I'm not entirely certain here. At present my inclination
would be to put them in 4.17 only, where - it only going to be 4.17.1 -
the "new feature" aspect is more reasonable to accept. 4.16, otoh, is
relatively soon to go out of general support (albeit I notice not yet
after the next stable release, as this time round the 4 month cadence
was followed pretty closely). Thoughts?

Jan

