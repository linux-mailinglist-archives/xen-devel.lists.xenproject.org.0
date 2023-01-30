Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607FD680686
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 08:34:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486583.753960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMOfc-0001Ms-Cz; Mon, 30 Jan 2023 07:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486583.753960; Mon, 30 Jan 2023 07:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMOfc-0001KD-A4; Mon, 30 Jan 2023 07:33:40 +0000
Received: by outflank-mailman (input) for mailman id 486583;
 Mon, 30 Jan 2023 07:33:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMOfa-0001K7-Ru
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 07:33:39 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67ff93e6-a070-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 08:33:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8251.eurprd04.prod.outlook.com (2603:10a6:10:24f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Mon, 30 Jan
 2023 07:33:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 07:33:33 +0000
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
X-Inumbo-ID: 67ff93e6-a070-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNYvQMmIThtSou8HfZF1AVZ8YHGm88eSxpG3kHjKIx9EDtN+P217AhMFiVElj1XGkWzocAYTxRARQi1gzq737V5mdDm7XrNU07zguF3AWgyIzSpE9jcratPHAdx2e9c+RieTf+q75HoYQKgtZYsrUFrwA7TEC0oR4RUAK7IyPnFLiarWTKJcXtQTajcvxCTSPKCRgRABk/p+9GzoL8RMbmqVZws84M2ED8by+/reOOK4DjUv2IQPG/8aD6glGujiEteofrg0C8s98zTyzGMlonls8OIuypHeudUCMYDtZ+KiVuptf9ajKsA223NsklEvgUynMImTRe5loXBVBX860w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Aodvu8vE3nlooikN1x4cHxGE0HAqcf18LOFNZNQdMc=;
 b=ODO063cJqjjWC4IxThw5+tdlDIW8OaCDAcLnsCI2RTIBZvMlBpXpkUlYQr5igKl1O6ob1F9McbSVRd/hcrGMWgWEtoeKatAuZSa5GhLvobpYWO3bt4qg6NlsYGGPn+Zrt/SOS3pXFvTcAw2BVJWKyVIwRgaYWpllMmFq0aH+grWaLQSHC7gshoElCWucA24WhQjaXUl3nAutx/B52m6JRTz+QFxnwHZ/xhCkjlY5nTSZ5FS4yM91n1rvYGoMenIIVnFOULy8Z2qEwE3XmFkDhn8a9jgLY/O3rAN6ydfCfBWQNrqQ98Hbf0ZenzS9hWT5A+LLOVs6Sub+eNNe86SV7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Aodvu8vE3nlooikN1x4cHxGE0HAqcf18LOFNZNQdMc=;
 b=LpO0iki0ELqNpFnwduRP/wKTas7GS85qVsptRfiQydy7lZYtuFqogHLrfiAsLFZ3Sx45baf+XHzIZ/xnwbyIswMaIILjSqh9dFyh27K/8Q8g02yEnJR1Wfg/edbljsr3nuj6qgfwSmLGf6NR36zjcqI96ySW/27n22tfFaHxmDIcbVlqpOsbXFJcd6Z/Jkq/ijmVq27RxpKdrGWL+m2Wam4H3SCwTtNJyT3gUSMmP3oy2ZQ/38pjfp0xGNAmE+uyISKobgb3bBA1mA+IEp6tPHJR/JLTkbSLlkmWFM4SdWvN73AE5VbszxVslh3YU/y6Etnlp4yyC03KBv4MDXm8Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <03ce9f48-191e-b1b5-a3b2-8b769aa8feeb@suse.com>
Date: Mon, 30 Jan 2023 08:33:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] Add more rules to docs/misra/rules.rst
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Bertrand.Marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
References: <20230125205735.2662514-1-sstabellini@kernel.org>
 <9d536cec-726d-4a39-da36-ecc19d35d420@suse.com>
 <alpine.DEB.2.22.394.2301260749150.1978264@ubuntu-linux-20-04-desktop>
 <5a3ef92e-281f-e337-1a3e-aa4c6825d964@suse.com>
 <alpine.DEB.2.22.394.2301261041440.1978264@ubuntu-linux-20-04-desktop>
 <db97da84-5f23-e7ed-119b-74aed02fb573@suse.com>
 <alpine.DEB.2.22.394.2301271016360.1978264@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2301271016360.1978264@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c19137-4344-4bdd-5736-08db02944a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WY3Fywb3Sd7Vj4x5ATrhKvHPLG9ZZDe5IUapGNtyoXaFR0MwkqijLsbC2z2je7+QNs2ucRyfPxS8VYKfrmx/jgJGgCfFvfWDnuPlMsaMpK54YjrljymuYkduHrQLhIuJmPwWNvKBDwOyw4Q8zD+X68HsKCAqqjE6U50k6iwDQKPhF79/6ELk3tvCE3u1nPy03jH5qvuJBf8Ol1wbl4JpQj7Y8HFb5TVasZq4KGJDesJB/YOaP1SOYJFJOYlOYyDk53NxWHkgqP9ZWE6vSWISSHGF+FYyrKPLF5rXpERSqca7/lRdVa2RQcvfjsTzTTHVRkdYc5udHP9eU0euJ1NiWMGq8jZ2qSIuHX9nq4VE6cpLpFZs4Tz3CZN8PaXB5Td5SoA3sJ+xvcGaGP65TCZPY9HPR1zRHV4nniuF4qN03a2nMBe6QNVoVbHoE4c7jr7pa6GxeiOpAlzOmP5XUVY90lx98PEPj9gsfEmL8ViZ1Zl4zYvujxpmQifSC7cDR+XysGaVhTAh2MewpTnOLmITZm9yGaenEwSbHagBfACIYidnmLcPU6O109Wo+Rj0IGlf2qGGhLo6WoYUyCWzyYo5XIjvXsp5OQ2uj7aP8BIgnXD45MClRCGtVn2ltIhZRdltwu7pfUzAx/Y8OY/YtK5AScW11T0a+Kk6VObvG/QVJVO0lJUldW9/zaxJN3xaBB7PnYTjVLoplAgV0e97soAvGcMGTmtEZQiU2TI/6FxCL88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199018)(8936002)(41300700001)(5660300002)(53546011)(38100700002)(86362001)(316002)(36756003)(6916009)(66946007)(31696002)(66556008)(66476007)(31686004)(8676002)(6506007)(186003)(6512007)(478600001)(83380400001)(2616005)(26005)(6486002)(4326008)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmFHb2lRWUhYQ2tyakRzdms1M2xMSlRNd0Zjby9GTWx1dXd2OWo3dFU2RDBR?=
 =?utf-8?B?QW5tWWxqb2pjdEtnTkhqdEZDREVMcW9NTm5Gb2s4N2ZEWTBmam1QQVZudTZB?=
 =?utf-8?B?aWszYmpLSHhSZDI1Snk3dzd4dDhkMktEK2xLbnZaTTBGMzY4UDRveDU1N0F1?=
 =?utf-8?B?M3NSVVltVnRlaUtBMk5LeUpFYnZlMXJaTUJMQW9ldkM1RE03emN4cEtlcUNn?=
 =?utf-8?B?Q0hGeXZpNlYzVlNrdTI5cXo4Vk1LaEZyemJXa3NDdmdjdktqZ2hWZWl0aUdY?=
 =?utf-8?B?ZWlmTjc5UzJQTTFadW9PRzdZbHdBZGNiNkgxTXQrekltell1Y3paR2NsOWsw?=
 =?utf-8?B?eU5zVXV5OHRzdTRtcWdkWGxVR3ZsaTB6UGVvODRFRVB4bGZSQVFqeWVGdUw1?=
 =?utf-8?B?TTBUaFJMalhEWjB3RFVEZUMwNGg2U3RvSHg0TGNwaGFoWDNYUWYwaE80M2ts?=
 =?utf-8?B?STBQaGF6cnpUT01IaUx1N3FuVm9qNU9jY1RhUUwxUm1xd2ZIM2pUZ1lZRTQy?=
 =?utf-8?B?NHE3T0RNbjJYTkdGcVpnQjZ0WlZoaDlBQWIvTSt0em12ZVR2OGlqc1hHUVRl?=
 =?utf-8?B?YlA3cFBwZmRlaFNqeTJTbXpkYWFBcmhhWVhURFlDb041OVlEMjVlUWJlcjRu?=
 =?utf-8?B?MEQwS29PK2RkU2lhcnpSc0hvMFhKM0VjczM2dWdUVEJnV0F6cTFNODFyYVVZ?=
 =?utf-8?B?ZlgwdXJ1TWU2Z0dNM3pyUmNpcU9UN2xkZEF6ak40aFVDRnVrdDFrVS92WFdu?=
 =?utf-8?B?U3BkOU92cW9aQ1hLeFU3RlA2Wm5DZUxZM0IwOU9uY0hFdlo5dnd0K3F1aU5w?=
 =?utf-8?B?QS9BNTJlZkFFT3NHcFNDM0xac3pzbkpPaGZSN1ovOUFSRVZuWUtIbEV6ODNn?=
 =?utf-8?B?ZnNlOGdQUEFNS2diWnNadlVORjI3cTFia2Z4M0RuYklQSzk5SWg3K3d2b3FF?=
 =?utf-8?B?UE9mV0NYU1BHcHp6Sll5THlZdDJUZWhJN1Z6WGhBWmtVZklLYk8wMllOQVhX?=
 =?utf-8?B?cS9PS2lCK21xb2kwelZmdlBHTFY0Tnp1ZUtOY2h4QjdaaXVkUWdRcmVNSzk1?=
 =?utf-8?B?WGVWTjM4SWs4Z3F4MkxoY3lOaWNmMXN4aGFLWnR2UzBPNWtlS1RFNi9sOGZR?=
 =?utf-8?B?bVR4cllGVW5XREJ6akFuNGV3TEt2MFMyTVp6VHVvNmE1VFEwY21UVFFpeHh1?=
 =?utf-8?B?Z0NLcnNkZmY5T1Z2aENpZWJLa2xCV3VYZ3pUWEpIcW4wV2JXenM0czgwL0lF?=
 =?utf-8?B?eFNzRzV6U29HWFVkbGV2djZIU25VOU45NXhRWE5zZ2Fad094Y2xBcXN5OWUz?=
 =?utf-8?B?NWNSdWtYZmJuK052bEJJeTJtQWRIZFhwWFNRTGxnRTlSWDZCMmtHZEVUbGlq?=
 =?utf-8?B?dlhDTTFRRXluSFpsZksyeDNiRVFUTXMxYWI2dTR3MHJqTEtsMkM2Rzl6MHNq?=
 =?utf-8?B?aGErUVI5SXJvM0lpazc1MTM4MkNxaFdiVXY4SFB4M2pmcTVZWGs3Y2NZRE9l?=
 =?utf-8?B?bkJIR1RaVXp6Y0ZmaEU0bGlhUm01NDFFUm91M0dRVHF5MHdLcG1zbHhzU2Z0?=
 =?utf-8?B?NUNmcFJhaDJacGJoa3U5OVcrWGpPTXVTUlQrZVFlQWlrak5hY0VLcEJMQmtD?=
 =?utf-8?B?Ukc4dlMwSXBSK2pEaUlSREtlM28xR3d5dUVKcUd4a0t1TmJVYTF2cXFYdVVY?=
 =?utf-8?B?WlZTSVhNQVljUGhkNEhiVHhaL2VuKzN5KzhlZGcvMkxSa1U3MlBsYStGRmdw?=
 =?utf-8?B?ZjZpeFBweDJGRTlDWllGQTFrYmtrR2dqZGRLN0VkdnV2TmJEMzN1TTFUNFph?=
 =?utf-8?B?ZStSYWZ2VlYyVUFEeGh2TktuRC9HUmdZWFBCSXdlbG10K0gvcGpjRVRvcWVo?=
 =?utf-8?B?RXNuOG01WG9GZUdaYjlyRlJZZGNrMytEM3JOMG42SXBadWpiUnVKM2NEMkNT?=
 =?utf-8?B?cS9zaElQSzlabllrY3JLbXJrb3pkVTJJc2Q4Vng0WlJiWWxYd25rYU8vM05R?=
 =?utf-8?B?ZDAvdG5sWlZmbWVwcFR0Yjk1UlU2Nzhpazl3TUUvR2l4RVpZYUJybEwzY2dS?=
 =?utf-8?B?QzJYaUFWbmtidDNtVGZueWg0Z0x5MVQxRlpxZlpROGpoeFJ1eXNtSEhxYmNh?=
 =?utf-8?Q?Rh5130zunQkiEIL5gj4m2NeDj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c19137-4344-4bdd-5736-08db02944a92
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 07:33:33.3983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vt6Z3A0vO1csqWxT9Qd11ZPi35iWM3lgLIkNYyW5t861+hegZ1oXefL5tadGBOsQtAaWkno1SlMH0oHLUhMDQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8251

On 27.01.2023 19:33, Stefano Stabellini wrote:
> On Fri, 27 Jan 2023, Jan Beulich wrote:
>> On 26.01.2023 19:54, Stefano Stabellini wrote:
>> Looking back at the sheet, it says "rule already followed by
>> the community in most cases" which I assume was based on there being
>> only very few violations that are presently reported. Now we've found
>> the frame_table[] issue, I'm inclined to say that the statement was put
>> there by mistake (due to that oversight).
> 
> cppcheck is unable to find violations; we know cppcheck has limitations
> and that's OK.
> 
> Eclair is excellent and finds violations (including the frame_table[]
> issue you mentioned), but currently it doesn't read configs from xen.git
> and we cannot run a test to see if adding a couple of deviations for 2
> macros removes most of the violations. If we want to use Eclair as a
> reference (could be a good idea) then I think we need a better
> integration. I'll talk to Roberto and see if we can arrange something
> better.
> 
> I am writing this with the assumption that if I could show that, as an
> example, adding 2 deviations reduces the Eclair violations down to less
> than 10, then we could adopt the rule. Do you think that would be
> acceptable in your opinion, as a process?

Hmm, to be quite honest: Not sure. Having noticed the oversight of the
frame_table[] issue makes me wonder how much else may be missed in this
same area (18.1, 18.2, and 18.3).

Jan

