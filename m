Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ED0725716
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 10:13:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544457.850250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oIb-0005o6-A9; Wed, 07 Jun 2023 08:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544457.850250; Wed, 07 Jun 2023 08:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oIb-0005lV-6X; Wed, 07 Jun 2023 08:13:45 +0000
Received: by outflank-mailman (input) for mailman id 544457;
 Wed, 07 Jun 2023 08:13:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6oIZ-0005lN-CL
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 08:13:43 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3603cfe4-050b-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 10:13:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7225.eurprd04.prod.outlook.com (2603:10a6:102:83::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 08:13:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 08:13:38 +0000
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
X-Inumbo-ID: 3603cfe4-050b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcCn4mTusHjKvxYDaeV003VfWJaK/zNKSPgOqXQycWWkDE97z2Cxe4HYngShDOy+cXZ6M7GCNSuWF8cnuEg2MCnIiaWwBVSZGUu/6K8jisP5E4Je72Vi9t15A0nqUYXhKPGPCOv3obG1qHZ9FovYqBd5WpqLOCOgcSfM8wSP5TU85qDGg7b/HOS23Xwv6xUyeq3u40xAZg/2jwu4DkN16K5BIwYgN6kKaiD/ilorAneTSC++3sfbnHZDCCzLlSen0zeR+LGJ01118uBQX2CH/lQHeptNmFq2lroUPPlPI+12YyYNTSq7Um66rF6wof1c7Z6rCCm9B83Oe3w7X+tiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQuieCQht7QvH9PfzDBJ9uA2cMqJbgzwV1uDb4MegoY=;
 b=h7eAjaidmfmwH0z7BkUddBVt2FpAK58LScMrRWhhWkunMqj7rkrloEmy5uFNim6sGMyh5rxDttdjn5G1UWF0TCf+p6ufD7EkguZYq5lDG5oFcSTgxQp13qlCWIBUiXoVByODY7slwZxUhnNXIUJW9CVp5ZhXuFMhuc0xwv348edWZT0q5CWkpdjiyMiXHEbnDJNpKSzbGV190T9nKZSYCIttYzTZFEvwXr01dfpysV6LAP1GsQCb5q9GS5xPYiVriStPP64gQMFvQrwuNPvobcn3KadQnXz2P+E4rmlfTmfSDdPlnr/qYnaeRpZw9qtX6HxjmjzN6AoSmAEC7erwxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQuieCQht7QvH9PfzDBJ9uA2cMqJbgzwV1uDb4MegoY=;
 b=B0AOBGUYZm8JPxxo28lJbqz7OT6ct3E4583wzrvbljeQD39Q1xgfUN7H+MUwG3gmUrgPCquKZ6mX+8hm0OdThWW1KeSlAVCIHKcnU8J/+dV7CPCm2e1k1l+ptveakogNd8yoVHRODD1NRA235bZGPhEyw8YBjAa6LsgiIjQ6Sr9SmdsP1YcYjr5qK58vxzJ4L2yFzsO6dSky4LOV4pHiJaJI5prSEOeBvk5JxKtX5LPhvndBWUXTpBgrxt0j0IhRgzOI7R4vPngHf8oHOR3g/HywM/wurLZSUasVBZRQ21gNY/i6I3nf18/1YNOdN4whlS3/FkzEh54RQ9k8n1wHIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f43f1fc8-2f88-6589-5acc-7dce2eb64b12@suse.com>
Date: Wed, 7 Jun 2023 10:13:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] livepatch: apply_alternatives() is only used for
 livepatch
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20230606172307.38857-1-roger.pau@citrix.com>
 <0fd63050-7592-c308-51d1-f8445d3fbd4b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0fd63050-7592-c308-51d1-f8445d3fbd4b@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: 2086f867-2e2b-4ebf-38fd-08db672f193c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tQeLZfyMd7EULpjGqW2iVu00F2jkiF5s4R0H9juamJASNd7qAlRgHthTHAPH/1Ad+3c9SwkbXE/0I4g5KZ4bBUC78HuHVvu9IhknRWcahLI7mDFodOnBzd5RPqAxrR+NFyP5d3GwTvhZkbo9iAsSIe0Ej2OU/C0FtVCP/1uc+N0eDsi8UHdQqaSFtbevPJiq7PSF1uIMmU9sxS32OU7F4bIoAtQeqplf/MeeW1DOeT+w7kYP12rcRRi5fROVB1T/nA0K1ShK7HnGhAiUO+PJ0FWkvONlG5HcHjQNJ+cmD4FRNBpXeoYsd7IInOyv2f+xQEGR4oa20FxUD8r3SU9VF/nwvX+rgXh2dcyDxjOH0sHE79ssNzq6Y38SR1Owk5m6ZIhpNFZEJY2yclJXsvD+azGh+SUG8aYWH0OB9xOVQgHOK6Lo2FdHZS+fsGCKmlLErUBEAHsI481BIqEQ22U43UhgIHUtylZsEETNCJ3pMI4onj5PfQ8oCHBuwPWTZqNeaWO3rOHCa7vmbFVlPM8Pf3Pr2WkIjh34eHej57YSUV/qndnCVSKb7WRlgZ3kCg8YRgHSs1aa9BquGJZxo5Dyd90HsRTUsVGDaGJVNqc7+pcbbTKrX3tmrEeHo7KhK3+oOW7BGnu0n1lab2XHHLz9xg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(66556008)(66476007)(66946007)(2906002)(4744005)(31686004)(186003)(38100700002)(4326008)(5660300002)(36756003)(316002)(41300700001)(8936002)(8676002)(6916009)(6486002)(54906003)(478600001)(86362001)(31696002)(6512007)(6506007)(26005)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUFHNm96ektVaWNDcTYydXVGVzdkZXFnN1lQVUhuS2ZsZC9ydVhjN1ZYZ20v?=
 =?utf-8?B?M09wTHM0UVhMY1N2T3NXeGI1MWxBTzlrVjl1aDlMRllLbUNaNVJZQ3gyclJl?=
 =?utf-8?B?dHd4NjhIOXNVdi8rZEY4R3ZBU0xMNEtjQXBweUQzclRPUDV2YXNraU9mZGgy?=
 =?utf-8?B?YThJaFVzOERnY0NxQkJsejJCb3ZIZEJmbG1va1ptTXJDYnJjZVptNTFxUEhx?=
 =?utf-8?B?ZkVsS1lxdWVrZWowSkFYUG9YWm5MZnJHZXM5WWEzNXVjZHdTN2xka3BFd0FV?=
 =?utf-8?B?andsZlloZzRVY09SZnR1M0lJdHZZa09uQ2p5ZXpCTmdmd3FwWEtBc25QNkdk?=
 =?utf-8?B?NEwxSEpyRnM4bC9LZnNDKytkVE9PSjNxZGhkY3ozVFBkOUhZRnpuSzNoS01D?=
 =?utf-8?B?eDJsdlp5aEQyUWpkekVUeG8vdXNYQlc3QjVXQlZQeVhJMWRXeCthWXJtWStK?=
 =?utf-8?B?KzJqNjR5eEZtck1wcGJkdlQ4QlRiOGZUV3pDTy80dDJ4eVlLL2ozSG5tRCsx?=
 =?utf-8?B?WEdiVmtCcVlZUmNXNEdQV1Y0TzFrcVlLSHRWQ25BT3BaK3UyNEFmSWZJWXRE?=
 =?utf-8?B?ZU82WnppS01sM29tL2VtSng0d1R3c05ldHhYa3B6ZDlxaExTbE02Vm5yeWUx?=
 =?utf-8?B?N0dya0pHR1FoTjR5TnEzZnVtZEUwaCtQVGw0VlJ6RlM5RzE4SzdubzhVN2Ir?=
 =?utf-8?B?azRmRGw2OG1JRy9KVWU4T2w5eHd4NDVkcUFGaUxFbGdGdWt4TWpzcndkdkFx?=
 =?utf-8?B?NWF2T2R3WmRUblZwVDA3cWx0TkdBZWNMZU1GcXN1K3Fpanh1dnAyT2lxcm9L?=
 =?utf-8?B?UGl1V3dPaWZMUkdzMXNOZ0htbytvWGlhbjFKNlBsbS80dkI5Rkh4UUVGME81?=
 =?utf-8?B?NG1OaTYzck1VOFg1Y1J1U1BLbHVHT1MxUzBSR2JJS2lMbTFzbU45VnIxdCs3?=
 =?utf-8?B?aUZ4ZDNUS2NGZlRHL2pCV015SlRXSlJZV3dyT0M5elFyZStqRXJIWkprNlRn?=
 =?utf-8?B?WHpLT2RSektRNXRwS0NreE80QVNnUUV0bFFtcHhXSHptMzZOL2tVbXdkM2FY?=
 =?utf-8?B?UkFlQThUT09BTHlLQ1VEZUY3d0I2cFpwUnVlZVVIZ0loY1F0R0I2WXd0Yzht?=
 =?utf-8?B?YnFaYVF5Qk5IVmhUT3owOFZnKzFiTVBoUmtUdG8yQWs1ZUJueC9yMFIxTVg5?=
 =?utf-8?B?M2I0aXZjZ0YwSG40QXdXU2ZaYURacnVYblBrOE1CNitwS3ZGK24ycGpUVGtL?=
 =?utf-8?B?S2JQYjZOaWRRNUhTWFJIUTh1RkJxc2hiZTQzeFVPbWFKL012NEhPSGtvbGJj?=
 =?utf-8?B?cWpCOU5ZNmZaZmlYbUcwWnZRNFF2RktMRkZLUGJ2WGdpYUk2L1ZUdDNGOGc0?=
 =?utf-8?B?Z0JyU0Q4UWNROEhtT0d3UEZVZDFNVVRPUUYzMjBUTFhhODJHNHB3ZWRDaDFV?=
 =?utf-8?B?VVJ3cmdtZHpmSHhqaDc5Ym00Qy94dXg0cEJYY1BRUnBUbUNoRUVKeklUVHl0?=
 =?utf-8?B?V2xpT0hoK2IvM2xVcWJocE4zR0pDK3dtK0JUU3VGNGIwdFZkTzVXTEx6MFpj?=
 =?utf-8?B?STkrbGh3QldLQ0dGRTlTcVgrY2VoRnhNenNQNFZGdmVyOXFlOWsyT3ljNVhT?=
 =?utf-8?B?NDlUbFU3UGJoZ1BsV1VrQjJ4emdLMWxJVnZRUHRuWlRuUElRNkRSeXhxUDM0?=
 =?utf-8?B?ZE91WmxCMVpvYU9EeTkxWllqT2RKNWplNlVXbW15THN0a3ZPMjlkVi9uRm4z?=
 =?utf-8?B?U0tQUW9YeE9jbXh4MnhWWk1PVU9TV0VkU2RidVVJbXVURXV0SHg5UVVsQnd2?=
 =?utf-8?B?MFEvQW03ZFVWSFVQWWVwSEtzb0FZYThUeFNEZTZoNVlsTmZGSjNBQ3Avd2ZG?=
 =?utf-8?B?b3ZVMHZEcTdieEg5VG5nMHdjSGFIc3JmVzREOG9pRnJuOG9GWE5pK2hGMyt5?=
 =?utf-8?B?Z1l6M2pLZmV0VVVxdXliVlJoLzFucmFkWDlvOCtRU2huamlsRFg0QTZtNHBD?=
 =?utf-8?B?RjFlbW55WHl5blhBcThmSm9JOXFoSWNwb2Q5QjFSUTR3dktZVi9LZ1FBZitn?=
 =?utf-8?B?T21qZkF1TVNQK01DSzV1aTQ0QkZ3RzRGdzNDU2JCbG5EK2cwTURIemh3U2Ni?=
 =?utf-8?Q?8nk01fM2zqvTVDMCim4j13z8N?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2086f867-2e2b-4ebf-38fd-08db672f193c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:13:38.8806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1HWq/9P6YySyxtTCFR8OQrjevYM27SGOxTDY74hrL9L9uLhV6UCT4J2iFp2plTMrFW5870hSCV4sXhnNx2MoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7225

On 06.06.2023 20:10, Julien Grall wrote:
> On 06/06/2023 18:23, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/alternative.c
>> +++ b/xen/arch/x86/alternative.c
>> @@ -358,11 +358,12 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>       }
>>   }
>>   
>> -void init_or_livepatch apply_alternatives(struct alt_instr *start,
>> -                                          struct alt_instr *end)
> 
> NIT: It sounds like the init_* was a left-over after commit 67d01cdb5518 
> ("x86: infrastructure to allow converting certain indirect calls to 
> direct ones").

Iirc this was intentional, to avoid the need for an #ifdef.

Jan

