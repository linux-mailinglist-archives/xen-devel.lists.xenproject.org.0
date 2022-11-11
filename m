Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5D625726
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 10:45:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442394.696522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otQam-0001yj-NM; Fri, 11 Nov 2022 09:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442394.696522; Fri, 11 Nov 2022 09:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otQam-0001wg-K9; Fri, 11 Nov 2022 09:44:56 +0000
Received: by outflank-mailman (input) for mailman id 442394;
 Fri, 11 Nov 2022 09:44:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q9GK=3L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1otQal-0001wa-Hw
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 09:44:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60075.outbound.protection.outlook.com [40.107.6.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e7c31ce-61a5-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 10:44:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9098.eurprd04.prod.outlook.com (2603:10a6:10:2f1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 11 Nov
 2022 09:44:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Fri, 11 Nov 2022
 09:44:51 +0000
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
X-Inumbo-ID: 7e7c31ce-61a5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rt4GZIwBCySAJz8mjO2Omdjn3XtZymEZ4MH6p+hgW0llAJdqsVEGPJjH0nnr8fQVPwTQGGYHQ01esqnHSV9CL0LZNaRFQWlyN4pTGCKyCEfEdeSjwpEdtubFv+hQyQSTn403lWUuF+A331QD/Umxxuv5L6ij+Lf1fp1I9kdQzDDorYacOQnR/McBTzvXxdHdY83mijsKxy8QsKx/I8p4g6o3dsRbPxUW1UNKetwK9JYUHY8YgUqmS2enBG1QZ961+rPkXzULhhLSiswrTA7gmcsnVGK7dLR8kvOqt2baui0dx9Tbsu5ho/h36qTehKGM8H9VCQljRSR12TpHOGNxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMdjc1Jw8nTIAr/jG5D1RVh4couVyT+4RZNHhYm/lno=;
 b=WBypLfs+Jwp9OIl/OYo1bmC1iWC/a5IMNjigTYvKiYpcvNwyHsG7JuMcwNLEGjHfP5hC2ibqYQYtG0UEowbWcMwnn+IpcWZQLLeEnh3IfVMENSxsSAcSMXRilwubxXIw4fZ9FwOJ0OHkq2laSMKYS2mqWA1AkpAtlOXACwpKIH5LF+cTSefORH3ooC+PooVhrI5UlzQbo/+GMW1P14GjPO1XJqrCSdIXDRSwbEmIGDB9HHO8T0rnLQoad+8Yc022sWlFRdI/iMo4kt33DuvJpA4mHx8pGyu9ra/j9SbCDPb0EIbC5Rs5+lwqeoWwl47yWnUyN4Wf0pNwkMRDLyXq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMdjc1Jw8nTIAr/jG5D1RVh4couVyT+4RZNHhYm/lno=;
 b=F3lQO7jL7yMZrgPr1vE8OIy5+D6vNadi3jhZucul7UhJKuEhxtLJLCthvm/ArbdRk5G7r2N1fKHYIOMLTeLOajTWs1gZFdNLEnABFOCXvm8J1WXB1d+xYuBD8uOfuC1c4RFcOwZkosD16fDPylntzRRaGUYhmjKT1tApgMRIzmZrSIqTnQ/s4Q1fpO5iH/h/6xCMcmbHTxUpfzkvSv+NG6eruOy2dSkGDuGSCdE00IQFwLMb8bNqIfTtaqSSUkDNBOCQ529fyCwkx2myJTbuXL4SA0DYzdUtZrvRypj+AgbFR5hgWdQMSADK9Y/aN7w0Vsy3swKrJNIS6ItwSQ86hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29e6e6ca-ffb8-3719-5004-0cccaeb5578b@suse.com>
Date: Fri, 11 Nov 2022 10:44:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/3] x86/msi: remove return value from msi_set_mask_bit()
Content-Language: en-US
To: David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, David Vrabel <dvrabel@amazon.co.uk>,
 xen-devel@lists.xenproject.org
References: <20221110165935.106376-1-dvrabel@amazon.co.uk>
 <20221110165935.106376-3-dvrabel@amazon.co.uk>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221110165935.106376-3-dvrabel@amazon.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e21ff9-b37f-45ce-0b80-08dac3c9614c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XPIWHNTnY6mQKlCaBEVQknDUlNNB1Qrk+thqPUCmGGtnk7dlBpDqwBL3wjrVqcm2EuwH8RTOcBcljBDzAkjGOabgy1mRGi/IMKsfetAL1kG2qAA3XGJy3NBeYEi2N9BAZMfCvpGauDRpcinrotSDxESkU3PzcaCzy6pdBp7uEXogtCNh14SLWiDmv8F78lEsMHGpSYDfSb9xZe3DQH8ThGrNxXm+s6nT0VsiKDt7H7PJFQhgAmjewgQQN76TV1TidCzwttsfankMBhTMRokVhLo7a34eVvd27MpDXzIkiu1ux0FJGv5y9u9M2SygCZgFQ/lQsSSZ4Ok5arLBKlrSWff8D1qG5Od6W/YxN8o8EtkfxMLLRyFeSdLnXxtwnk0dHvZK70Ncp4yUfpfYkx51pZG1KClXcnNxK2trtg9JI6wkfcaCIjL/mqRajheCtKhVoO4A+vhdM4BpBamXDzCWrQhcH8PlUjkfa562wNcvDD08qKGOSd+mgLlJeoz5gqBnfSYRPU//0c8sw9NjF2DSxg1r8wBangV2DvbzmFfyU5hDrpbsVI2CjSvKyhCA7OWCMj13pv5mbcxSa+4K7fGB1ejvNC6HQRavjzNVwagFFQhPheEptoXGK+cfwxR0KKmOi32p9fM07XSg3vHfIPVO138TmUnFjJ9wj0RQ6UXWnbrhxZtYAp/IXatCiAtBwzLC/job4dqpehbXZfvE7vxbIN9WqTakUXwWWpMnKV2xS2ozOU6PeTs17l0BgBhmjpZnwUgK/RtPvvZ7ocXmKmin5shu357LqqylAxf1jNnOJHs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199015)(6916009)(8676002)(31696002)(8936002)(5660300002)(86362001)(4326008)(41300700001)(2906002)(316002)(36756003)(66946007)(6486002)(66556008)(26005)(186003)(2616005)(83380400001)(6512007)(66476007)(53546011)(6506007)(54906003)(38100700002)(478600001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckdteUFQL2pnSmk5Si9YVzd6aVMzRjJlTlBNSHgwczB2Z2hDeVA2TXd6RlJ6?=
 =?utf-8?B?WlJURTRYQWhZeHhVczE0R0VUWGVrVmpONVczSDE1VEZNRHduMlRhU3AvWjcw?=
 =?utf-8?B?Y1FWTGdKREVBOTFGdFl0ZXNXUEgyQi9NMFBYMmFGeTVnRDU4dnMwVVVFUjN1?=
 =?utf-8?B?KzJOUFU1aXFTVDNXRW9xY0pzRmRsVGVUZ0FsaXdMOHArRGdZVkdGYmp5OURa?=
 =?utf-8?B?UHhrc3lsQmllc3ZMN0N2YnQrUlZ5VTRTVzFYMFEzOTc4anE5NnJhcW5GaDhp?=
 =?utf-8?B?TlBzOUpaUDZXUVQwMFRFOHk5ODE4Nzh1dzI5cjBDa2g1KzhRRjgwUDUxeTYv?=
 =?utf-8?B?VndKakFFaWlNMnNzS3hXM251UW5PVm5hbTE5RlNzMUlCQ1dNOGtDSkpKbDNm?=
 =?utf-8?B?SXZuSzl2eHJhWngzcnJEZXc3OGt5QzZ2ajh0N0FOYW4yR0NROWhva1J6Y0FX?=
 =?utf-8?B?aTBpSDM2M1FNd2ZCRmljWVQrNnFTMTZLcFhzT0tYOTVubmdvOEZLcEMvV1hr?=
 =?utf-8?B?bFNvQnZobGlZdy9UajMrNWJ3dHRQVlJuZ0E2VEtJNjVBRTVra2RDbythYWl6?=
 =?utf-8?B?dXdLaWFydW5RVkJOSk9YaDR2dDNKMUpreW9scEZEYTJoakd6WTN0UGJJa3pG?=
 =?utf-8?B?cHh3UFdYNWZtK0dmZmZsNkR0eFdDRVhpSkRkR0Z1UXAzTnFBN1doZUdRdXE1?=
 =?utf-8?B?WEdnenZaK3FCMU5GK2dVU3lPQ0FvcjF6VHI3UDN1clFmNUl3dGZEaXJuci9P?=
 =?utf-8?B?WWRlTTZBSjgwcGtDcmhSaU5idVdBelJSb01iVEJlRTJKRmhXNzJPQVNHNmIv?=
 =?utf-8?B?Y0Nrcng3YThqelh6dGlpMU1DcDd3THpmMjYxTm9yNC93VFBaUnRUVzVqV0hk?=
 =?utf-8?B?c1ovdEZwQTg4OU1kU3FLOFRtb1V6dGU3SE95N0hoWmhGQm40cHM5dERGWElQ?=
 =?utf-8?B?aVQrZkVqT3ZtN0hCaVRPYW1zYk8zaWM5Sm5PQXpoSklJZ1QrNXNTUXhlTFBk?=
 =?utf-8?B?aFlPTkRremZEbEtSVnVwWHdTbFN1cTJuRFgraENGazd0VHM5aGZFUVZaN21w?=
 =?utf-8?B?Wk1qbW9CejdWZGl1cXExZGFZQXZFakk0WHJ0SnNaYjRYMk1WOTRzNkg0VnJQ?=
 =?utf-8?B?NWpRODJqNzVaVFdqRHExb2lweGI2Y0lCV0VkQysxUmFEcDkzdGM1TDRQekVN?=
 =?utf-8?B?UnlEQm1kcUJITkpFRXBhZTBwaXBxMFBRa3JFQzBaWmdHTEpwOEdIdXVyR0J3?=
 =?utf-8?B?eEVBZWN4bHZoQXhLdFgwamp2VVcwVFhjbDhPajA3YnZ3T3VhVXQxbit6MjB2?=
 =?utf-8?B?ZXdJK3FXc2ZMSE5Ob3hBV2FGWWo0RnhhK3QveFo3TkhUZm43ak5PTTZYTG96?=
 =?utf-8?B?ZEkyaWpuYlJXRTRtYXFRRjdCL2NDeko0V3JaaW9mOXAxdFJCS2xoUXpzYmRk?=
 =?utf-8?B?SmhVMUR4TGpDS21Oc00xVVZkWTRDbHNVUG1seGg4RFJOZmNDMml2RlhsdkIy?=
 =?utf-8?B?NHE4VTMxSXVqZ0ZMVTduc0dXZ3J4QXNVaUZRSjR1NWl4M0FmRHBwZEw3TDRG?=
 =?utf-8?B?bG5kM0l4VGpyUFIxc1BRYkZyM3gvZ1JLZWJUanQwRENLbXBudlhRSVFoSDFl?=
 =?utf-8?B?Q0l1NFZSNmFKTGo3Q1hCOVZSTXQzcTdPM3h5anlueW54L0Ivd2psV0gwcjhW?=
 =?utf-8?B?OWR4b2VURUNOdlZJVE5UMzQrd0xQcEV4dXh6K0Jrc3ZNUU1VdUtzN20reXFO?=
 =?utf-8?B?aW5yOFpVZHArSmF6c2pZdXgvc3Q4Z1ZGSTBVTVhFaHlhZUxIdGdBWXI4MVpy?=
 =?utf-8?B?Q3pxTzZRclNLS2IvZEsyRmsxU3ZtQzMzZHljRFFMRmFTQ1h2RDRybjd6bHBl?=
 =?utf-8?B?d0VYMVRHTHBRenQwT09KdEZ0NzU0WFNLd3JtR25BQkJITDY3cEVJNDd4N0ds?=
 =?utf-8?B?MlF5WU9aWGdKaUx2WlVKNG56R2dVZXN5YS94R3daMUZ4bHM3S2FkTjJNb1pC?=
 =?utf-8?B?ZU9YU2ZrSUxZSjdvNS9acCtCc1RHWFdxSElVUExyVjVxVUxVNUthOXduL0xO?=
 =?utf-8?B?Wk5QSGNYdjdDMG5GckZENFMwM1lVelplOVk0STBoazV5VDVFZ2ZmYWR1WGZZ?=
 =?utf-8?Q?kbsgD1iNqjKI7kaAC2jNfDnWC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e21ff9-b37f-45ce-0b80-08dac3c9614c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 09:44:51.5656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFvMDHpxwpGHUkOiSnFz6el7VGanTFHY41+l+dOVMDUD1EA2kgP3NBclsthAXIDu3SjgRNe0a6ow6Y3uRLMGXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9098

On 10.11.2022 17:59, David Vrabel wrote:
> The return value was only used for WARN()s or BUG()s so it has no
> functional purpose. Simplify the code by removing it.
> 
> The meaning of the return value and the purpose of the various WARNs()
> and BUGs() is rather unclear. The only failure path (where an MSI-X
> vector needs to be masked but the MSI-X table is not accessible) has a
> useful warning message.

No, you're removing an important 2nd such path - the default case in the
switch() statement. Getting there would mean another bug elsewhere, which
we don't want to leave undetected for yet longer (and hence yet harder to
debug once finally some misbehavior surfaces). That default case may
warrant the addition of ASSERT_UNREACHABLE() according to the respective
description in ./CODING_STYLE, but I don't see the removal of the
"return" as acceptable (also for another reason as explained below).

The idea of the WARN() / BUG_ON() is to
- not leave failed unmasking unrecorded,
- not continue after failure to mask an entry.
This combines with the functions where the constructs are not having
ways to properly propagate the errors to their callers.

> @@ -361,11 +361,6 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
>  
>              if ( likely(control & PCI_MSIX_FLAGS_ENABLE) )
>                  break;
> -
> -            entry->msi_attrib.host_masked = host;
> -            entry->msi_attrib.guest_masked = guest;
> -
> -            flag = true;
>          }
>          else if ( flag && !(control & PCI_MSIX_FLAGS_MASKALL) )
>          {
> @@ -385,14 +380,10 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
>              control |= PCI_MSIX_FLAGS_MASKALL;
>          pci_conf_write16(pdev->sbdf,
>                           msix_control_reg(entry->msi_attrib.pos), control);
> -        return flag;

Both this and ...

> -    default:
> -        return 0;

... this have previously prevented to make it ...

> +        break;
>      }
>      entry->msi_attrib.host_masked = host;
>      entry->msi_attrib.guest_masked = guest;

... here. This is a change in behavior which is neither obviously benign
nor properly justified in the description, yet clearly going beyond what
the title says the patch is about.

Jan

