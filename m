Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B460E736F35
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 16:52:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551914.861681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBcib-0001tW-Ue; Tue, 20 Jun 2023 14:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551914.861681; Tue, 20 Jun 2023 14:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBcib-0001qA-QU; Tue, 20 Jun 2023 14:52:29 +0000
Received: by outflank-mailman (input) for mailman id 551914;
 Tue, 20 Jun 2023 14:52:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lS3L=CI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBcia-0001po-Hi
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 14:52:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11fbe7ff-0f7a-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 16:52:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9086.eurprd04.prod.outlook.com (2603:10a6:150:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 14:52:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 14:52:23 +0000
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
X-Inumbo-ID: 11fbe7ff-0f7a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9ZddI0qbFA/DkSD2LtiK5WEaFs6VUhO2xW5f51Syrg8tuYG0hkGCf2yxh0tGiGEi/7OyHxEvzOrhrgPFkeUF3isXsWAYWTRF30IIW2nfEfH6tyAU3jRRO94En2q3REY/sV8l6ooGsdP2x0AQrMv21e0Vj0+Hfi9I3S0bojWIMFgqwLhj+30AR9P7mP7JsloOVZxMeQWosqhuS10LiDr7r6BmJ9LAQt0hEJCgOpZFCxHnfEWspdFRahLdrjBog6XnfbjLo8Z4lYmnF6tm7kYSGteJG2aXgvTcCT4DTZwUVv1d5+Dvv5cBNhQ88JWcqmF5u3k/piZTWkvsJM/Lz210Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxz8OWuCwNF2lB/M8a6RHiRB3d1gs6NFo+p4pvbr/jQ=;
 b=hqcdjmVqxyr5SX9qg3veSUigk5PhQB9yEVEWeaWnOVaodU0TB5anhzQYGi6yG21qcEsz5nNNGEnLi9ii9dBWi1rCwwCPCBJUcqWpwqhAbEcqt5QlhDs74VF2ohg76r8U+Ubjmkj5DakdadD6pMKbM9Llln27bSGAQvFytJlRarYEmo2pGTKdfkiMPmQEALke1by2tWxgq36Mg9bHpwjPdMn16P9WaNwCL/ZvdlGFZ83asrqNpHABKFr04kfd4ivQE6EHhulR3LQN/FaP22SO91WlgYqSeZMrsgp84p3hWSLk7k1IjvUvwPyZ1W6yBLUQYBCUuMFswKRL9NUV5oI6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxz8OWuCwNF2lB/M8a6RHiRB3d1gs6NFo+p4pvbr/jQ=;
 b=PoKbS4Lg5RFQtQ5Q4StxLcOCrKWlEp/2USq87Q8MRPlcjXssc+JedVmHbDWeGnin4Oe8/J6ZZNOJ2fZtGmm0h5FiA8nk1nZ58J5MXJBENXaXYMUZlQgXPIY6cJc208Kewu1P5v9V1+EksGwFzTTMtWC5w6wlFfZCf7CBmPybzgCg9BY9u4wlqCX+sw2JyRPu30c2hWPdydWrczAp1p0Nqg3FbfFb+dWPNiJlsoDVjxe/7TE1GITSHRtj7tRGCbsiUSft39vlEY80EGsjJHS6qums3ohPrpUxfQw48IvNScfpPB4fHtlEzhj25vqexLGfW+a2rg88xeevgZpxT99nHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <807743af-c1fe-45d0-1919-a7eb4d244a21@suse.com>
Date: Tue, 20 Jun 2023 16:52:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2] docs/misra: document the C dialect and translation
 toolchain assumptions.
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: roger.pau@citrix.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <b3f85e78bc1d044e6ed97eab28ee61548a353da1.1687261909.git.roberto.bagnara@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b3f85e78bc1d044e6ed97eab28ee61548a353da1.1687261909.git.roberto.bagnara@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: 219a5c33-2340-4c75-47f5-08db719df4b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QZTI1P+zZn+oZEhBwWGcRejmsvLfOMr5OJ2V2UwvvLdWNkAIFVy0qvqMWI3LUjXM2xg9n1s/GAHI0j7lKGUMoIfUhP56cirgSQ3W1aU8BrWLhWqdxHN9N/1A7i1+InDOok9jALV0lM6MKgBPNQ22m/oCecOEnM8koeRYhM+QtSiyK9jrf/CsWhwunDuYziuMoLLNu9/j2IbnTqhoAsgp8eEYE+pT3urJCpk1mDz/4kXPk9SZpg9XF9sWlfbuAWoHD2tON1RMw6/TEfjAdImdfOpB0mDxRFWVG3v39hs+bWby8aaA9vxUpfvZCL7mgawISeSq9di+cpFRhmsSswVUCO5DV5acSG7rC8jbWqWGr+ntPyL3G/u3ck/BLuaFIklwfwbxzf9O/enB4mVpUmlJhW3ENy2kpuhiXIY5MkEtl6vMLQCK2SCzJbYZ0CWJwemWXM38yqQ7t91nVUy47PFhlI6N5UaapcrbIGTogRl/zTI6JK1Z/TLa+glJxvP7keUscHzKGZdZwaBAJDdX79ajk8IYDaOAgXTrpjR4HeA5OMirjvQA76ZkfAI4DXcGE8pF/vrCK54nZobn/z2NlcQi8KvRkbhNcQys+H8HmPI5N51PYghJUWPTrk78AimeAt5fUXvPZyJ3Lyvdm3OrdBsmMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199021)(31686004)(36756003)(5660300002)(7416002)(66476007)(6916009)(86362001)(8936002)(8676002)(41300700001)(66556008)(316002)(4326008)(38100700002)(31696002)(66946007)(6486002)(966005)(6512007)(26005)(53546011)(2616005)(6506007)(186003)(2906002)(478600001)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1d4OWM0ZW41MmczYmRzVTJpdkI3K2h5WWdKT2REaWlNdEg3aU05QVF2ZVlL?=
 =?utf-8?B?cEJXc3lDeGY3dzNZVExtK2NOOE1HVmdiQnFaNktIOUJCQ2dEaGU2NkZrdFcz?=
 =?utf-8?B?WWNWanRqVTR3UURmNFRtRkpsRlpmSSs2eStlNmZzdmRpMzQyRmRRTlNDd29E?=
 =?utf-8?B?alk4NmlCbXRaYWlRRzkxK0dLc0FON3hqZmZjeC9YQWxPbWp2dysxQ2JmZkE3?=
 =?utf-8?B?b1BMdWY0RlRtK0FrZTZUNnV2N1NXYlNLRnhhZnlxWVA0djFPWEErN041Uk4x?=
 =?utf-8?B?ME1mSUFJNGhFMDM3cU9uc3dGbU14S2lIK1hlZ0ljb1FDajJxcXZKN1lKYzJs?=
 =?utf-8?B?Mm5uWHJhaFF1U1h4eDhXR2ZBUitkK2VtTWlaMkZzTUdhT0ppT2xyT3YwYVhR?=
 =?utf-8?B?RUtkMVdWdFVkWmlHRTEvc1plbHlCbms5eWhvbTJRMzRTeWRjZUc1Qm5WRDBK?=
 =?utf-8?B?K2hqbDZLb3NkZG9lN0x4djRRYnRPZ1dCZFV5bnAvUmk4Skc1aTdJaFg0aTNG?=
 =?utf-8?B?MERKeWdZaWwrbVJ6M0s4aHQvVGIrZGJrTjVTa2pRUlNQZHZXNlJraDF6bjB1?=
 =?utf-8?B?S2QrTlIrc1hyT1c5d2NZNGwyeVJ4TDg3RUZSbi9PQ2FJYkFvZmltNnlkbHdu?=
 =?utf-8?B?Tld4R3lzWEFLUVFKTmQyNzFvT1pVTGp4bnhaeFFzTVhaT3JyRVh3WlZrczZv?=
 =?utf-8?B?NGd0a01BMWczNGh6aVQwSjRjbDErQkZ6S3BDWVU5Q0M0WklINkc5QTk0RjdF?=
 =?utf-8?B?MHdMSU9LMUxkY0hNUXEyL2V1eVljVVhwbTdaanoyVllZR0VOZUJrK3B5MWgz?=
 =?utf-8?B?Uy9RejlrR1FET3dIYnZsbGNBMUVGd1h4cFFDeWxnUWRneDNJZjF0SG1qQW43?=
 =?utf-8?B?blhCRzk5NHdqcElTMEpYK1NUdkpwMTVKek1tUUxPN0puR2FCVnVNTVU3K09X?=
 =?utf-8?B?NSs1aVN6WjRITGw4RXFuNGZ1cnVoR1UvcVQ3czBTakg3SGljTUFBL2RESTNW?=
 =?utf-8?B?anlGemIzTSsyKzdMc1RFbjZpUFhYaFZpTUloVjFMenliYndheHJtajU0YkVC?=
 =?utf-8?B?RHhRVjJON0pyQjBwWGlORi9UY1RVY2tic2RiNFF2WGV6YXF5WnBtZkhGQU1I?=
 =?utf-8?B?TXhhRzdZSHpXNm1mcnNUangrWXZyRmJ0VlRGM00rWlhldkF6YkVnWjZyYzJK?=
 =?utf-8?B?cU1RRkRrV2lYOXhZWkVsQ2pLbjNuK1lzNEdMRUc0L1VYRUErVDZFMnNlTENW?=
 =?utf-8?B?UFc1cTB6VHlpTU9nZGRrbWk0UDc0a2pnOGFQTUVSY3RyclliRHFxNTFzSjJC?=
 =?utf-8?B?My92Vjk0TG1jTi9KRDByUVR4SjVZSXZOUkxNdmVPdEl1ZFNrMjFVNGtwdTRM?=
 =?utf-8?B?bnR6Q0hRRE5GR243ZGZ0a0hmTk5tQnZsdG1BNnoxOG1YSmZpbG1ublFlM00w?=
 =?utf-8?B?ZWQ1djRWVVVFME4yZThrNU9jVGY1bi9ITTU2bmE3blpIS2prR2d6Q3Z3SDJD?=
 =?utf-8?B?bWNNSW8rV0JsV0twcEM1emNRZ29yeUVjQk95b2Z0VkZBblh5MjZrSTFUREZL?=
 =?utf-8?B?UmYzS2VGeXVoU1U1Y3JwZUZzdDE1cFVlYnk4UkpKQ3o1ZFFoOXdROGR0MHY5?=
 =?utf-8?B?OG9JeXFpNW1uSU5qZDFIRFcyTEdSQUxWSzVuL1FiTk5uSkxzSVgvc2l0d0w2?=
 =?utf-8?B?RWh3RUIvd0p5cDZYZ1hsNStHdmo0aTBraG1ST283N2szeXRhZVBuSllTNmE4?=
 =?utf-8?B?Ukh1cEtnRUg1eUtaanltTGhzTk5CRW1CRjhWYXF2ZnIwWUFsdzN5U0pFMnFq?=
 =?utf-8?B?OG03NStzbm5SYjkzQy9pZFVKWDBvNkNQVmtnSThSSzl2dEtTRlZPMmZBdGt3?=
 =?utf-8?B?dHpQcUs3ZDRQbndGWUhLeDRMTGQ3Zm9CcG9Na2FSUlJsa043OUFobjZVRjRz?=
 =?utf-8?B?Mmt3aW1FZ293STFOL0VMTUl3RUM5OTRINmxJdGxNblNzY0Zjdkc1V0J0WHQz?=
 =?utf-8?B?Si9pQmpMbE1ZM2IybWN6eHkxUkc3Y1dBbm1iSm8xQmtFN0hEeXlDWWtlTmU3?=
 =?utf-8?B?MG5SWWEyY0VmS0VZdFJCMjFYdkprb3FmNUtORUlZMm5xb0VSdkc0N1pqcVhL?=
 =?utf-8?Q?nN9CgsgvJ0pbpAxjDgVn4OC+m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219a5c33-2340-4c75-47f5-08db719df4b5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 14:52:23.4367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7bh1UwykfHzlJsdkjy/Samzc0kncvHEBCs7LP5ouVCCyQK2l2EEEhznIoTXOC9fshp8Kv6aJDikJFKsWMsgzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9086

On 20.06.2023 14:10, Roberto Bagnara wrote:
> +   * - Non-standard tokens
> +     - ARM64, X86_64
> +     - _Static_assert:
> +          see Section "2.1 C Language" of GCC_MANUAL.
> +       asm, __asm__:
> +          see Sections "6.48 Alternate Keywords" and "6.47 How to Use Inline Assembly Language in C Code" of GCC_MANUAL.
> +       __volatile__:
> +          see Sections "6.48 Alternate Keywords" and "6.47.2.1 Volatile" of GCC_MANUAL.
> +       __const__, __inline__, __inline:
> +          see Section "6.48 Alternate Keywords" of GCC_MANUAL.
> +       typeof, __typeof__:
> +          see Section "6.7 Referring to a Type with typeof" of GCC_MANUAL.
> +       __alignof__, __alignof:
> +          see Sections "6.48 Alternate Keywords" and "6.44 Determining the Alignment of Functions, Types or Variables" of GCC_MANUAL.
> +       __attribute__:
> +          see Section "6.39 Attribute Syntax" of GCC_MANUAL.
> +       __builtin_types_compatible_p:
> +          see Section "6.59 Other Built-in Functions Provided by GCC" of GCC_MANUAL.
> +       __builtin_va_arg:
> +          non-documented GCC extension.
> +       __builtin_offsetof:
> +          see Section "6.53 Support for offsetof" of GCC_MANUAL.
> +       __signed__:
> +          non-documented GCC extension.

I'd like to note that there is a patch [1] pending which removes all uses
of this extension. Hopefully in Prague we can settle on how to progress
this ...

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-02/msg00445.html

