Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58597645892
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 12:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456196.713936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2sH8-0006Eq-Rk; Wed, 07 Dec 2022 11:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456196.713936; Wed, 07 Dec 2022 11:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2sH8-0006D0-Ow; Wed, 07 Dec 2022 11:07:42 +0000
Received: by outflank-mailman (input) for mailman id 456196;
 Wed, 07 Dec 2022 11:07:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y8gL=4F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2sH7-0006Cu-3q
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 11:07:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ccc24e2-761f-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 12:07:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7553.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 7 Dec
 2022 11:07:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 11:07:37 +0000
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
X-Inumbo-ID: 5ccc24e2-761f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0noXjTTa81yLokuEEAVSbMLVwBlRw4GnRbsTUsqAuDGmsEUsotfJRPzyIzbPdxjkVIjiiQap9EPpWRCpo371otqOGoXve1hPxcwxSINjdYWFxa7JKwjuIrg/mYtVtVUAZve/Mmv/HzOotrBH09VbNsxF3pzWKcNcqnueJfXRYcl/MYG4EJdqNsVirPn1f0+xGQ7mu9aCfS/2eM7dFU/PS994kQpUuFPiH6Hlz1Qb6e+7JaB4iVyS40t0zNHXCyezIn7cXC40CyCfYPKi9w4JhupFJEdh3MgGkJ6ebY7rVYku4eNO8o6aQHIpRfN2WTM04cWZH6wFay9jX8VtxfsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4jagkVD4BsT45UU0L9uMOR4TH1D+wYI5al6Tj+wLFY=;
 b=I9ocOInDlQIl/nRJJ5TqbLho5Gqh692c+vggLKQFdB63UecvaKi3x2QvsOHyPjVliBovhG03i4kzimmr1Q5A3sa4EbHscVC9Yng7NamP3UJtJFx7SWGz4LoCEarITnKEZg+bB7kk1IZck6T1fa2+SVjCxYLv4THL2Brw5hWm+aTsQSXtRgy+v+DPQmHMNl7y+w+dXCkH7GonRddl/XOUbigAsG9dlhUdST61hz8/SkPqprNcpX15w8XqRBwq5JH+W5lLFQtXovL/jyOf9keindoYXKhMOdnj2V3endi0ZfteEkZvZRdIeWkNsRbZFC3oCtKjzexhox+U0d552xEFVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4jagkVD4BsT45UU0L9uMOR4TH1D+wYI5al6Tj+wLFY=;
 b=zuwE5tNoSzyIg+23MoI0xIu7U5QXpFATW0uTnHyFi30GIBePMiZ5VT+LXfDjpKwBz7XfUJFz6iJ0Td0WF+astFg+EcO/YCaatcFSG+cD5dlq75cIZTuglEliZZVkyay4MAwNh4QHTveHkVy4OBOOZgax6ebyexgpnpmBkEAIHxaF/b7q2JhcfBIEjBXGYIgnSfoTc96Yk4hKE+d+qw0wf+AdHCJRRiQrVtwFCsnoGoix88nHT5Ecn7cCfOumN/h0JCxT/T94Lx04t/amP0nK7b7BQWmOQlBfCTn+9uThqVz3GEue133n+bOEr/8hRT3eBMw6PWE8lx7xxTuc72mtLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e227c1e-56d1-6715-cff4-33b99df3e212@suse.com>
Date: Wed, 7 Dec 2022 12:07:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] x86/platform: Protect XENPF_get_dom0_console if
 CONFIG_VIDEO not set
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221207102909.17794-1-michal.orzel@amd.com>
 <9d85524d-5c97-e216-4d78-2e5ec02fe321@suse.com>
 <22afcad8-49c5-6e85-43db-f16bad001e37@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <22afcad8-49c5-6e85-43db-f16bad001e37@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 887cfd3e-b087-448d-4661-08dad8433fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e8yeNGwqut7nPQj2CqZAvbFOH1T0twRkvKbk5IeLgZrZSx/8vXo2QwPpQLWHdD/4pYOOXrG9l0XIq3o9ee21hwCihSnOSlJc9eJvKQAm47DPMBBUo/5XgINYoPripETFeSav48ZnaljmuOaI6jafDsSNn3iJdcySAqdZDkdUnF1bJ8PPX6EobhZTZFNJe4zImH4dEhmMl7/Jv6uMh4m1IiDKwMUJ7LvOEGGfy3YmN59HWVrqcwtz9dFw/rb3wAc4WxiCIuUDm5z5rs4qjwnHx73aRL7I7Yy7FyHVlXRSpsB1dZ3ER53N0e7Pume5NmvN49f/+1BJvitwgaYnqs7U2kWqvLm8EmjwAgpB2DBI+qb2cASq5HjlREkq771g6Xlz7jWFpeoEsEw6n+D3/l2eE7kd66dcMCGI1E4XvFvXJNjWDwVDLh8L3HRxZART89RBQCBSzAD37S8IRfvuRsxzkqBZwDPzDFaoAakxO7ems+RddVt37q4LAF9iTY5MoEdBVcv3ys1DiNiu9wB9CVxKWSAloz0/IeCGdsyzGywooc/OO3HRSDd1L3kJSmmYS5R5j5h7NbAm+xQmM/3lJldPA3EQuQNPoE41XCm1t1jWoeIP5/DDZ30R3Uw8DEznwEBDlLSzL+ZwHwvef/tLvjn6YE94BuSKlz7f+Ybiffd+tShhGdPjncZaUJqkprzfJzXS4fPBYe3XHZoymuoDIThFHsHIXPpzULgocmJyRh55DSU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(41300700001)(83380400001)(31696002)(86362001)(186003)(26005)(6512007)(6506007)(53546011)(36756003)(8936002)(316002)(38100700002)(2906002)(6486002)(478600001)(4326008)(8676002)(2616005)(31686004)(6916009)(5660300002)(54906003)(66556008)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWp4Nm1kcVZ0VWtyTWNPd3FJN3liUlZTU0M5Z3V1QWxKbGRGaWtaRG5CSCtC?=
 =?utf-8?B?WG1MVTVLc2NzL2UrenNaMFdCWDkvSjF6aDBwMWhHcVorMnZQOCtJbmhlZ2xD?=
 =?utf-8?B?K2JPU1pDZ3lCRVBnb3VBQWZiWTJBbmNGWU9vd0ZoR1ViZGgzU1VFVk9Ic1A0?=
 =?utf-8?B?Unh3TzlxV21DOWtpL0ZueXQ0eW40VDlicXlhUHVUbzJQUWJmNTNCcmwrQS8z?=
 =?utf-8?B?ejVUT1FkTC8zdlBBWnZNeXUvendOOXFPK1g4bEhLcVZBOGU0bXJFSDZiVzVj?=
 =?utf-8?B?c01wL3ZsdFl4NUN5VGYwY25RNHUvaHNNT2UzMXhLUm80WlRCcWRSdkZEcnl4?=
 =?utf-8?B?WWtTOXhubkxyWkdCSTZKQWNRTGNJZklTQll1T2lXM2JZb0NXK3RHMjhjcmJB?=
 =?utf-8?B?dnJYYTBaRE13eUVaMm5jUWgxNmVCYXpaZS94UFBaa3lOclB1Uk82NEl3RHRi?=
 =?utf-8?B?TWVhUFJiYm55dzJaV0FqRHFkcjNQUzVxTC9KaEFFWnVPNlRGR0pwdHR4aFdp?=
 =?utf-8?B?WHpERGFoWGNza3dwTXFGUkVXRHZsNGtZVWtWMTRPWDBKVUk1RVVRS2JiclBK?=
 =?utf-8?B?UlRFVDZmOWhmRXhWVGU5N00xRytoK2ZpdmcvVlRLRFVJeVZPeUUzU1E3ekFk?=
 =?utf-8?B?UUNFS2xrTUgwN01SaElJZ3pKU3g2SStSWDY1QWVNbXUwWVZQdGpmTzB2elAv?=
 =?utf-8?B?R1BJTlRNRE1yeFJuZndxNmpnZzE5cTlmdWo5M1JoWEJaZUcwU3RmTjhoaDN3?=
 =?utf-8?B?Y2k1RlZPZW1nQVI0Z3VyWHU1MXRpSmxvMk5GOUhnc3JJaTFrVmJaR2ViM2Zy?=
 =?utf-8?B?RzJqUkJ5WThySUpxeWJudFRsRDI4MTlTRlhraDBRWjR3SmVwWVJJYUMyeng4?=
 =?utf-8?B?M01lQytvUVNjVHplU1hLYzRXdXBpT3hnREFHcDRQdVF3aTYycysvQjVQWXF5?=
 =?utf-8?B?cXBBbU9GQ3hxdUNGd0NBRFlVV0hSQ1V6TlJ0b1hveUJITVlCOG9NSWdOeDJo?=
 =?utf-8?B?K1JUdm1LZE9vQ2p4dzM1bHMxM3RueXA1ZUpSK2tvVDRmb0NYWjM4aUZoWXNJ?=
 =?utf-8?B?ZHVBajVCYndEc0J4ZkUrSnhzK3M5cVBpWkdmUHhNdUZNT05ZQmlINEhzRE91?=
 =?utf-8?B?MzhPMEdvUTRxOVUvQ2dUYjBJY01oaXJ1TmhCcENxRWdwMkxHT1VocVRNbWRS?=
 =?utf-8?B?T05CSDdLdlFVMjdyaFBoV3lVWVpWQVlGeENBdGRsNGZZcHFaUFJHdWtVeUtz?=
 =?utf-8?B?S0VYQ0RoYlZXdFliK3N1b3BTL0VXRWxhM2xqSTE3dlpFV2pVUnlwRlBLREda?=
 =?utf-8?B?bXg0bmFSdkFiaVRmMWJWMWtxY3V3UDRxQ1VCcEk2RSs4TXZDRjAwUGxTT09h?=
 =?utf-8?B?OGIxWlV1dUJZWkwyWUVSa3ZyZHIyWHpSMjJUNzVBTk95SEdvQWdxS0hZUjRm?=
 =?utf-8?B?ZFg3QlBkbHhibmFEdkFRSmIzeXNyc29zQ2tROTBMTlorR1JSSCtuSjkvem5C?=
 =?utf-8?B?c1lNY0o3TUtBV2k1aVhPSXM3NnlHME1JUmtNZkFUODdDaXF2cS90K3hrK3g4?=
 =?utf-8?B?aWxJSDlPR2xYMzRaaDlXZ3loemthMVlvZTN5OXRzOFpBV1FvOVpCQjZaK0VO?=
 =?utf-8?B?a0hHVnp6S0ZmR1JUTnpSNlByK3NsRHpKSU1FVXNMajlIMDZ5bk1DT0hYY1N5?=
 =?utf-8?B?SXJPZURteFVveTcvUllNWjhKTmJJRlRDUFlTc0FDZmNIVTd0VmhwYldNOXYy?=
 =?utf-8?B?THU0MHUweTJCTmdwQ3VVNTFGK1ZrdGY2ZUZ5bURlN3M5bkoxRFltRkw2THdH?=
 =?utf-8?B?TFZCMG95U1ZycElPWWQ4emo1Ui9SbW5Ea3ZDSElsMWZRV0kwcjV1RDBHdVNK?=
 =?utf-8?B?UFpOdGZOaHBTL0grcUFyNGxiRGdSTXFJenU5amI4dVRQbHhCRjFYeExSS2Nl?=
 =?utf-8?B?SzlIcGlnN0JTb2N4ZEZrNTNiLzRXUFhDaGJOMWpVajVJY2NpaXpHVGxvdkJI?=
 =?utf-8?B?UFVPNEJNQ3c5b0IwWk5OVHpwYzVEcUkvWitsQnQraUdnczV0NmZYSS9ZV2dR?=
 =?utf-8?B?Q1ZDN0M0M0RmaUpIT2dSVDllRlpkTGwyWmc3TjBiL29HWkFqT1B4VkwzWUNW?=
 =?utf-8?Q?AjbErvJhQApe1YTiv1L3FCUVP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 887cfd3e-b087-448d-4661-08dad8433fea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 11:07:37.5260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgMRhf7wOpXwCA+juoNoaKTrZtu9E42X0NrRYf6ec2znGFoMOx/joByKtxpjx/T3/c6WQN7HOIZxwz/u76dMcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7553

On 07.12.2022 11:38, Michal Orzel wrote:
> Hi Jan,
> 
> On 07/12/2022 11:34, Jan Beulich wrote:
>>
>>
>> On 07.12.2022 11:29, Michal Orzel wrote:
>>> A build failure [1] is observed if CONFIG_VGA (and thus CONFIG_VIDEO) is
>>> not set. This is because XENPF_get_dom0_console cmd of platform hypercall
>>> makes a call to fill_console_start_info, which is defined in video/vga.c
>>> and built only if CONFIG_VGA is set.
>>
>> Which means to use ...
>>
>>> --- a/xen/arch/x86/platform_hypercall.c
>>> +++ b/xen/arch/x86/platform_hypercall.c
>>> @@ -839,6 +839,7 @@ ret_t do_platform_op(
>>>      }
>>>      break;
>>>
>>> +#ifdef CONFIG_VIDEO
>>
>> ... CONFIG_VGA here, unless fill_console_start_info() was moved to a file
>> that's built dependent upon CONFIG_VIDEO.
> The one and only reason of using CONFIG_VIDEO and not CONFIG_VGA is that all the
> calls in existing codebase to fill_console_start_info are protected by CONFIG_VIDEO
> and not CONFIG_VGA. That is why I choose to stick to the current behavior.

"All" is interesting as a statement when there's just one. But yes, I
can see that the issue is broader - 2b8a95a2961b ("xen/x86: make VGA
support selectable") didn't really get the #ifdef-s right. I guess the
change then is okay as is:
Acked-by: Jan Beulich <jbeulich@suse.com>
and we'll need to touch all of that again (or move code around) if some
2nd way of selecting VIDEO appears.

Jan

