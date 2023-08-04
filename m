Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB76176FB0C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 09:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576930.903632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpA8-0007YI-VD; Fri, 04 Aug 2023 07:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576930.903632; Fri, 04 Aug 2023 07:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRpA8-0007VO-S8; Fri, 04 Aug 2023 07:23:52 +0000
Received: by outflank-mailman (input) for mailman id 576930;
 Fri, 04 Aug 2023 07:23:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRpA7-0007VI-GM
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 07:23:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dab46995-3297-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 09:23:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8777.eurprd04.prod.outlook.com (2603:10a6:20b:408::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 07:23:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 07:23:46 +0000
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
X-Inumbo-ID: dab46995-3297-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apSjc5Ei0lOGj6XJyieqPtzjCcAsf5T5VIY9SiR80XtRQ/mMYZEpEKzZh3Rz8/Fz6SBcDus8OgPaP3QH3mu9YMRyfDIclxdVDevTq1CBy2LWVbhZG6XiGWXXub3Z6gbSlJ2wFlVFTboAyAM1gYGMP0xt7gLE8qxHrT9kzYjnUth/Xs/i9ix8uIpdXHtXz7ResOBuhV1+Qqwt2AYB/hFd3AzRzT+WRW8/hG9XXrYPis/CZJAMWSsZwKdqxOXF87yCvc2m7SwEpFycFhjVAMToxn1IphMYLAlIHQNDNCnCuNRFiJhFPkOX9de/ceehWwXLT3IKEa66hU2qHbOI7AAqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+o42d1VH0SFcRv35iYgNrFh//GjvXBLjsTkyv2Bq2aM=;
 b=OogiZfXETcJnCIsxs5eyFBoRCJsibeLyY1/x91iybgu99sz2GbK4XYhmadOjre1Goj6tPkTy1xy6qg121QqCMjUPOYztY1xut7uVCCVY10PLvCs8rWMvJIXhmEaTj4dP/B8vNqunS/Eo940yegOafbEaleHhY4axs/78aVi/6MDSErgKr0uWPcIRFSEO6mJit4VgNvDjx/GBN9P6mlEuLkdN7ELSql872lw3rBzy235NVbhTnMF33uckCO0BVolB7Z3iTnywtAxZ679jIHNU/FU/OaBQtTXN+e1t/Uylt4U3ldg2C/Dl/voSDUhTKHIMlUuvrh6p69E0vXxT5S4HVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+o42d1VH0SFcRv35iYgNrFh//GjvXBLjsTkyv2Bq2aM=;
 b=qM6lP1Wa2pjRekE5PpkkNuuLbPlXC6+vrl6oqGcIj1Ogazcn8XPqeyGH1DdpUzGAL6NS6lgF9cXel31XsSZ1ur3rMk3hitHQ9oLDnUn09bouLxhQYCXxL/W5HNW3m+WpsCEzLOKtiv/hdRWkGsLykNDWomwbarQbWx3Z4+IrNrUlgmjwi1pj1nnI/zCrYzIN37HtL8lp9a4c8I+6qbOuGx80AqI7kGctROfBE7qDyPtuH/cBEu3UNQa4rW3h2oVIZIMGmpmA+hER3WGjAlKF3+EOZlmnUCo0ClJXpMNLdfCdCD6gmtYx6u0gZopBxsQ0/nld5xeXepMiYG2/3feo4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f066a57c-3dcf-12f3-26b2-5f61f8fcaffe@suse.com>
Date: Fri, 4 Aug 2023 09:23:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] subdom: Fix -Werror=address failure in tmp_emulator
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Jason Andryuk <jandryuk@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230803203650.1474936-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230803203650.1474936-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: cc35f364-d1ed-4b31-0541-08db94bbbd6e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+23f/aqqS+40gzDchdvjIhcDMoHk1Xx9kSmZ8AmO/vQ9I5HGIeIbJQg9lPL717CA4Hmg6nfk2jIk1tzdmfZw53E2J9hi03hopYDQy2rO8Qmc4dxJdRJSJxOg2o9nrX9CjxacbvgiqM2PbVnFt6E372W+SD4zJ9XPJNfSmKLT0fexYEAHQj3Y/NdBjPASCyqUOOp32WOt8psxUOLNzOgiAHeNMTg8zM+qVLmVo+m1Ipkfsan7FaoSiOidXaBfJMQ7STGjP3rEyhOeFzqgpONJ3TQLxp5LGpMIt3hF/K5S053WGMaAwj92kLS1D31WR9TLpdUEnv1bTNOOVYYz9r6NqN84VFe9gjpNPsht2qLre4NUtLQwIKkBKXSYSchufZx9QUWVyQv/85lVjvdK/2ChegnQ/xa/un0nbgIAYuabB3XQJvv6yJRjAgep6Z7WAangB+PHeAbCZ8azU2UTAuckcdK1RMYizH9IoiSQdiJP+bDLkDkV64yQUy1BgJF1fX2tR703ZgeXyLIpfDgUiI4Ma66x4IgCXU9AQ5EnMilsEgbMyLPDOljS5hUJAuoun/zQPfUaCs1OJn4KYmT8eePKYj4c9Bney1R6t7gZBOIfkE//QppsF05Uzq+ez5n2+rk/MENybva4riVti108VSVLGBBCsbv/m1KFOjh9G4sxnJrh5ouyukrbDuShMdrRHKUc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(376002)(39860400002)(346002)(1800799003)(186006)(451199021)(2906002)(83380400001)(2616005)(66574015)(86362001)(31696002)(36756003)(38100700002)(41300700001)(6666004)(31686004)(6486002)(54906003)(966005)(6512007)(316002)(66476007)(6916009)(4326008)(66946007)(66556008)(26005)(6506007)(53546011)(5660300002)(478600001)(7416002)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emIyd1diRDZ2ZUR3WllEVitGU1hBK0IrbjZwU0NGaUJOMlcyVDBZOWY0V25R?=
 =?utf-8?B?c3k0aEhiWG40NklCOTVOLy9DS2pCak4yZC8yLzFPYm5sKzVla29zQUdNcTVl?=
 =?utf-8?B?Q0lHVFgyd21LMCtmQnlBei9WVlVKWENqM0dxWkxmTjVHYkZwTEtzbjBTTUNK?=
 =?utf-8?B?bDA4WkFhaHNuRVRFT0xmcm5KUnFKb29pZzBvRmUvWGRWdXEydEJISTZiNFd0?=
 =?utf-8?B?UXZldkxUSzBUSWRua0Y3OXV5MGdaUU5mYmlJbit3Z08rTXB3VU9qak5OWWFU?=
 =?utf-8?B?VUhkUGFITjhlUVZpZGhvc1JLZys5TGswWjJKV0hoMXJJRzBMcCs0NEJTR0tw?=
 =?utf-8?B?aXJmZVFVbndYNmtCWFcvbWRLWGZkK2NOMm01MTRqT0lob0VyNUx6TFV2NEEr?=
 =?utf-8?B?S3BpOVRLTE9VZVh1SlBjUWdTaHd6eHJoV05rODM5V29NOHZOa1d1Sy9yMy8x?=
 =?utf-8?B?enZwVFUwQU1UM0tIWDR0cnBua2h2L3BFdHp5QkZPdkJxck1QOXplTlUyYXN3?=
 =?utf-8?B?cFpVZC90Qnl1aXUrK20zbWRhUzF0NzdRNW1JN3JEZGRTRktUOFdrdTE5SVB5?=
 =?utf-8?B?aDdTRzRLVFFhcmk3V2dVczl3SmtITGVJK24yVWNwMW9yeFNqUnRnUHlvc0h6?=
 =?utf-8?B?d2psTCtsLzVIcWVRYlRWQk5NVSs3Y0U1RWowN0cwMXlkZGIyZ0RHQXhwNkNi?=
 =?utf-8?B?MnBQWVExVEU1L2lyM1dyTjVmb2s1bDhDektpZDZwMEtPRXhpQUJHNVZjMFps?=
 =?utf-8?B?MUZlNVlCMGhDZTE5WGFJNTVTQVFCS1hQUHNMY1FuaG50WDZpYWppMStLakZs?=
 =?utf-8?B?QUs4SGp1RmhSQzlSMGYzS2xxVzJjQ3VsbEFoZmxOZ09XdWFZbC9XUmVWbE4z?=
 =?utf-8?B?MDVQMUxRVG03dGVZRUpKNWFFNDlTcDZoVkRrcWJBd05UeHV5c080bGozd2kx?=
 =?utf-8?B?Y2hBYzh3RHUwRFozeUhvSEpLWlhJK1lSMmI2blljQ3cwRVdzYVQ1RENJMW9B?=
 =?utf-8?B?dWJvL05xeE90WllnaE9UdHdHMVNxbjFSYi9DVitCQ1YxM0kyaE95R0JtV2hs?=
 =?utf-8?B?Q2lKRThIZmN5S0FwRWZkYkNRa1c2aXJnTFVXbTduaG5XalhwaWQyaDRxU05D?=
 =?utf-8?B?T21UV2xaSkdyOVR6NDlEamFib0pDOWRodnU1T1FiSGl2OWFNc0RuZDNZOWFk?=
 =?utf-8?B?Z1k1MThKVnZ4dVQ4UW5UQk9OZUZ1djZCeFp5UzRrN2VUUG4rZ1JNK1ovYlcx?=
 =?utf-8?B?WnRFVStkNDBWenVBK1V3bW9mV1NBU2FmUytReStnZkw1bjEwdmcxRWpiY3Ft?=
 =?utf-8?B?NUZoREMxSTJXNWg1N3VuMHdOM2d4QWsrZ3VoeHRxRTdvSDRBWkFiQXpVS1Zu?=
 =?utf-8?B?N05RVTBWclQ1eXBiMUtJTEdUNzJHZkZ1WlkrS1QxeG8rN1R2L3FkallaWGVZ?=
 =?utf-8?B?MkNZTWh4dlUyRzJqaHBDc29QNDJFN1IwZ3RuZ3BnTVRiT2FYY3kyTmtvQkVJ?=
 =?utf-8?B?OUI3OE8vNGhYVzlXYnBTU3lGbmVuUXdTWXFESysrRzRyaGI2ZnJEMnA3eHFy?=
 =?utf-8?B?YkN3MnlEN1JrR0N6VElRRDZoQkFoOXJLeVp1T1ZHRVZITlMvUFJPOUhrR0tE?=
 =?utf-8?B?QmlqV3RzTmx5QkU3ZE5kMlF3YWErSTYxYnN6TVNLeUZ6WTlGZ3N2Q2pSVXZn?=
 =?utf-8?B?VmpQTHg4RlBiTTZtQ253MjNPb1UxVDlUZllFcFhWYm1hcWJoYnpPMlZaMXJ6?=
 =?utf-8?B?dU5MaEVrODl3YjdEU3QycWtkVzdUaVFEbFFyenM2eFpYRFdhS0JhSTIyMG51?=
 =?utf-8?B?cUxVNi9XSWRFSmVMaDBZWW85NUE1aVRSWEhIUHJKdnZrMVJUbzVuNzZHSzk2?=
 =?utf-8?B?VjV6WXNMYm1JMzk2SnRVU3hPSEZiMjZhUWxzbW9wbUgvWGsybVczdkJnamRW?=
 =?utf-8?B?TkFpS3g1SDFReWlyOXdWbENLbEFRTGFqQzVrL1BjbXh4dGwva1d3MmNmeFlk?=
 =?utf-8?B?QW9ydDhjSmN6a2UyNmJWUWY5SEVoOWMxcXJGTXdvSDJZTk1DcG5RczQvSmVQ?=
 =?utf-8?B?eXpUMlhTRUljb1dLRTJFSHl2MDVqV0RiZFdUU1dzSmpiOE1NZVZXWlB6SzVa?=
 =?utf-8?Q?oqz+aXtjyy3G8SLxbxcAIe+oS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc35f364-d1ed-4b31-0541-08db94bbbd6e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 07:23:46.2123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/VeZu1lhtQ9wgCl7L9LJBsCdfSJaG79mgExC46FZhJdzdR5MAI2ur52S+3EQx6G9VTZ0s9vGtxD0YPV7kavQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8777

On 03.08.2023 22:36, Andrew Cooper wrote:
> The opensuse-tumbleweed build jobs currently fail with:
> 
>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c: In function 'rsa_private':
>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:56:7: error: the comparison will always evaluate as 'true' for the address of 'p' will never be NULL [-Werror=address]
>      56 |   if (!key->p || !key->q || !key->u) {
>         |       ^
>   In file included from /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.c:17:
>   /builds/xen-project/xen/stubdom/tpm_emulator-x86_64/crypto/rsa.h:28:12: note: 'p' declared here
>      28 |   tpm_bn_t p;
>         |            ^
> 
> This is because all tpm_bn_t's are 1-element arrays (of either a GMP or
> OpenSSL BIGNUM flavour).  The author was probably meaning to do value checks,
> but that's not what the code does.

Looking at the code, I'm not sure about this. There could as well have been
the intention to allow pointers there, then permitting them to be left at
NULL. Who knows where that code came from originally.

> Adjust it to compile.  No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Jason Andryuk <jandryuk@gmail.com>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> CC: Christopher Clark <christopher.w.clark@gmail.com>
> 
> While I've confirmed this to fix the build issue:
> 
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/955160430
> 
> I'm -1 overall to the change, and would prefer to disable vtpm-stubdom
> entirely.
> 
> It's TPM 1.2 only, using decades-old libs, and some stuff in the upstream
> https://github.com/PeterHuewe/tpm-emulator (which is still abandaonded as of
> 2018) is just as concerning as the basic error here in rsa_private().
> 
> vtpm-stubdom isn't credibly component of a Xen system, and we're wasting loads
> of CI cycles testing it...

Question is whether people might be using it, and I'm afraid that's a
question we can't answer. Would it be an alternative to disable vtpm in
this container's stubdom configure invocation? Obviously as other
containers have their compilers updated, the same issue may surface
there then ...

Jan

