Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131023F5D1F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171241.312499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUeN-0005fF-KY; Tue, 24 Aug 2021 11:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171241.312499; Tue, 24 Aug 2021 11:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUeN-0005cc-Gf; Tue, 24 Aug 2021 11:31:27 +0000
Received: by outflank-mailman (input) for mailman id 171241;
 Tue, 24 Aug 2021 11:31:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QsuA=NP=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIUeL-0005cO-8X
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 11:31:25 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfbca350-04ce-11ec-a8c8-12813bfff9fa;
 Tue, 24 Aug 2021 11:31:24 +0000 (UTC)
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
X-Inumbo-ID: cfbca350-04ce-11ec-a8c8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629804684;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=okCvCL6unY6Oxq6cM6cerbg3mRfQ5bdLQKOd8vwAJVU=;
  b=hexB6h6TV10QHSjwAtdg9Rcxu54WLoY8nUhlbDh5RJFcR66mlyG0WA0A
   DdPDRQ5E+TjL5/Q7ghtnGdU8VJD+ckVM0zWei9eppwH2KopmguSmwRVH+
   doM6Xe0rnCqEqX8FfBgBkrCwi9RBnZnp72GMGe+x0+UQuErvldg2VQX5Z
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CeP/0QVDdfUqVwjc+tmmQgHBviagfe+IrVaUNW8+oRW6gFq4LONLKFCFr31mJCwaqLTxpBJE9v
 g06YejplDhdrcevwIrzep/gJ1A8C6bi1xHbSmXk4w7WhyjZMjO0ezySy1DO9HL0W/jGPulGrDI
 B5UF3bG50trR0//ifydNO75j/iNH0d0b3FE/FQOrm10TOwNxe5mF5umeAwstDVSKv5Ce6/uSxD
 4tOa736JtWRsu/Xz5S2CHKgCXUeyGi/E9FNGUsl2DVYC3lr3HRsep3J9HlwWHgZmy9Gif+QKMF
 bVjozxxAOzsojf5l4mPtIqDy
X-SBRS: 5.1
X-MesageID: 51168895
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:rgm7cql5D8PytzpXvSIdum2fKCrpDfOpimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPpICPoqTMiftW7dyReVxeBZnPbfKljbdREWmdQtrZ
 uIH5IObuEYSGIK9/oSgzPIY+rIouP3iZxA7N22pxwGLXAIGtNdBkVCe2Gm+yVNNXh77PECZf
 ihD6R81l+dkDgsH7+G7i5vZZm8mzSHruOpXfZAbCRXnjWmvHeN0vrXAhKY1hARX3dmxqojy3
 HMl0jc6r+4u/+25xfA3yuLhq4m2OfJ+59mPoihm8IVIjLjhkKBY5lgYaSLuHQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdmjXI4XIL0TvP2FWYiXzsrYjQQy87MdNIgcZjfh7Q+yMbzZxB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjlREOLFuLYN5nMg6xgd4AZ0AFCX15MQMC+
 91FvzR4/5QbBezc23ZhG9y29ahN05DXCtuenJy/fB97gIm2kyQlyAjtZUidzY7hdEAoqB/lq
 D52v8CrsAXcid+BpgNd9voQqOMeybwqFz3QTmvyfmOLtBPB5v3ke+C3FwC3pDgRHU59upGpH
 3/aiIuiYcTQTOjNSTc5uwFzvjyKF/NFQgFjPsuvaREhg==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51168895"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeVGh31uUE9wymK4dXYqU5nJ6Dr8MbuZhQfHV5+NNAVD0wH489bY6pCjW+WyEqwT11xoOX6yzJmj8W9a4tCbhsnTRZJGFuZglgwCVWhFPjPSnRXnXqxk7D5nvU+yT/RKfLNEANniSlFB9qedlTAzm0kYlw+2uFeKVhHLGVD3XH46fXZB2iP+vxlVtuo14dJz2piTeNPg3D5xftiin0lJHh16UuJTzVIqUUZ/jJ6HnpJ714d1p0vX4mMZ+fm4KjZzMdHVVmI9vw7hJbIc1QjeRHRdQVBqwWYm9r8ETyt3iG2um/OfGrY5PuzEMxH4wigb5C03gG6EkBXyxYrkYDEiQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y6QpED9NF6eTrwNlrEL0x9inj4iERROlk8v68fSxEk=;
 b=CF8EFfOn23lwJliLt3gCVn8z1uot7PsTAhHZxqYVEARzs0UZZx1Z6srwHX5N/wvBNh4mRuHGWvqvPSSKvgSQ4MK6vAMleX7rAqBaoAIkdBjwZ9u36Pk0u4SpdD6kAz/MkLX0Epg7rl9dv55qPj4N5eDg3psoHCnfgyzXQIoYXqAQDn1mAjQ6Q2+mNEX2KcHA7AvrHVlTihubynFpigVgyd6ZKNdH6SxeTUax2uBwoT9NqIF9HXSlbSmc06sC7obcMuenhcPMmNyH/UCK8EtIfZWjXjEUPBd8T5pl2w8AMJjRd3YJq35vyR8gh9Irm+o6YCn+X2KOzGuVhmBe62rz/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y6QpED9NF6eTrwNlrEL0x9inj4iERROlk8v68fSxEk=;
 b=Cc04A85NKabS0FXgwH9Ab4NgsruVR10/GqHXKxEsr3mkARVtd2Wo5sYCntVesTZkbxL/kjOdkCweiBCySelddG1HGYZH5q5V8YtVNEgwBLicOooTlqbgDK+SCJhK/Lp+zXPv8RhRY90CvoejfRrDxqzF/0DRcxuVhRdGr7v1RCA=
Subject: Re: [PATCH v3 3/6] arch/x86: rename debug.c to gdbsx.c
To: Bobby Eshleman <bobby.eshleman@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <9ab53497cdd52e3aeaeff8079d934dcee94d6479.1629315873.git.bobby.eshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <897e6c6e-2d41-5a0b-931b-f94824fa581c@citrix.com>
Date: Tue, 24 Aug 2021 12:31:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <9ab53497cdd52e3aeaeff8079d934dcee94d6479.1629315873.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0406.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd153b15-5d2d-4aca-d7ab-08d966f2b272
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6272:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6272E965DF10E8C524C07C63BAC59@SJ0PR03MB6272.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nvmdBElL/1L+Zm1n90kvMoYue6N+YMnEnZ2iCtF1yma1i3PjUftesFEpXFCMfHx73rHtV+wb9yCu4klcjWt/54sLD/DiKXBWHwpunWCbMJhMS7ZgAw621oxMyvbcSQa4ymAxpnrsZQjhwvMWsJdGKZlVL+x0HvG2+aPK/wm8EtY4RqSbP7AgycGz1Ps1tCJV0dPs7g1t/oXktf2H2spoYyWUJhaB9SWO7wwAPW/L3eoEHPvPQPk9xcMwZSMjM041ORvV2IdQdf5iiBx+3bqULkZP6cEly/nCFZ6E9N8uZ7zAos5AsZNVObg/mUTPaVwCQ0ZyPvu+UdnLjAHAJf3OJaeS+cCSdT9GqFmAT05dNurUFi8JsAgxX1nvDmT1hZbMu1Y9Igg/yNIA+9LCArs06dy7n7szBlVM6Z1L4aNtIJ4ZAGmI+At7VH2/QvAGBCbl6sCS3yeDc5dXLasju4v5dAth3lEZMX1OVzohSUWP7UVTeKI7R81mmqqcaLYoMrCmXhRr02POx5qcgsWrvidWXVvPxrigOcstfQXphmAQAwkx22Dfst2CdWqCVyK7rfsGm88HXs//PjR7m5iJuAf9Aplv9Hs2vVjSBr3LYGspzNmiJTfugDCD599dhw70wNEqYPPpKt/FrdajrC8egy1s5E56s80tgP4hDZt48xhItFzFvUikCdVZdfklAkP18jDbdJndElZbGRmkxR0b1JPYcWxoHdQtIkhex5tG2y6Zhkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(31686004)(316002)(66556008)(66946007)(478600001)(5660300002)(66476007)(6666004)(4326008)(6486002)(54906003)(2906002)(83380400001)(956004)(2616005)(8936002)(186003)(53546011)(38100700002)(86362001)(4744005)(7416002)(31696002)(55236004)(8676002)(26005)(36756003)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEZ5dEtBTkptbi85Y2phQVNGblBsSUE1SGdLaUsrRDJLakRDR0VkajFkUEdl?=
 =?utf-8?B?bUcvRXJDWGxYQW9hdUhDa0dNYng0d3JHaTlJNGh0RWR6YWlqSGtZeVd5Q2tE?=
 =?utf-8?B?UFBYeElLdE5MWFhNOHh1ZHZnc0xzSVFxUUNYSXh2WGdYWmlLdHQ5TklySUFI?=
 =?utf-8?B?dnlDTEtWRWVxblFJeGRIU2IvVWdKMjFHTTFnL0tWZHpkV21WcjUwVGFxNmM5?=
 =?utf-8?B?WlBGTmVaME9SWjFxVVA3R1dRRjRVU2FJcTBEVjNLbkRtMUUrU3lmQnRoMUxW?=
 =?utf-8?B?aEp0VnR3OEhMbDlVaGRGK2xMK01TbjZIeGxTNDZxOHVyTXJ4WFZVTVcxNlJh?=
 =?utf-8?B?MzBwMk9JcUNKVjRIV054SmZkbVRiQks2eDBISDJyd3RHZG4rWThJYmdycDRa?=
 =?utf-8?B?bkhPaVU4b3lNUVNVblJaa0E1RUJicTBzNkdnWU44RlRSbTdxODlnc3NMVHdv?=
 =?utf-8?B?NkU0WmlQcHhuRHRZanljR1ZlV1M4cjIxOWxHam03aW9oSVJrY29wSHoxRGtD?=
 =?utf-8?B?a29IdXJLajhvVDZGMG1paDlxZkk0SnNpbjkwc3RCZWlHY3ZZS2JON1JhelNO?=
 =?utf-8?B?bkc0M0tEVEJOR0tJM0RnL0JJM3J1OEM3eTJPQnBoT0NXNVc3elo5MkJVNnVu?=
 =?utf-8?B?UG9vL0UyWkh0Nk9WL0xQQXlZWnN2OWlTbWlrZUxPaVl5cVl5STB2RDZpeGc3?=
 =?utf-8?B?RUNFSFVzY3pOMWpPcnkyS0ptQnN5Q3lpc2dYRkMwb3lXM3JYSnJ3WlZ5UkdE?=
 =?utf-8?B?Qkt2d1cySm1kVHJZRkZCdUdyTUtWVjFseEpxY054dERVT3pQVVpYYzdkUHp2?=
 =?utf-8?B?TnE3dTZXeHJKRzcyQnNzZVhtVUhKcWRnVXpEeFJMOWV4TGJHNXZNWHl1YnFu?=
 =?utf-8?B?MWR4d1Mra3UrSGh2UHJSZ0tKVmluVk9qdzlNM29ENDA4YWx6VWlzOWxGQnVR?=
 =?utf-8?B?aGU4TVROVWNqbnN2MHNzSm5Gc251K0tzSHRNM05rYm5teStNeGN2MGtFNUZ4?=
 =?utf-8?B?MW9GZnVhczFlWU9NalUwSEFxb25sRFFMOHRTdUwvSGFFMnBUeEFVdUppaE1u?=
 =?utf-8?B?cEtMUHEzK2FCRFBEekJva2ZuYSt5WXVsKzZqak5vN3lRUWFyMG5YMEdackNy?=
 =?utf-8?B?cWgzTy9LNWRYNHFYTlA2S3E0aVhNN0dXcnFUZUdlSzl1VlpkTDNjaTBvcGk5?=
 =?utf-8?B?dmw4YklWSXlBTjVlRzUxMXBKT2p2S2tRVHpEY3BsOE9od0lYVm1ST0NhWm1V?=
 =?utf-8?B?QmJ2SHEzdkR1RmhnTU5uNUViYWk3eUE3RW1MOFM0Rm16MVpDeUcxRVlBd3VF?=
 =?utf-8?B?ck9EZVZjMDQ3a0l0dzltcmdVVU1vRU9VdnZ5ODcvUGpiTExDWTZkd29BUDJh?=
 =?utf-8?B?R2hoTForVG4xSG5vV3hlczMrb091UURvZTNuZG54YzA5R2ZnTmlzYzRXQll6?=
 =?utf-8?B?TUdyMGZIbHNWMjI2bHVYM2ZaU2pIVDd2MCtMM1ZaS3NHQ3BIY1Z0VlRlbE9u?=
 =?utf-8?B?YUZ1WXFJaEY1dmx6d0RDaWVaZFBZRHdDOW94YXF6L2pJelZDbU9qenEyQ1Rn?=
 =?utf-8?B?MUNBK2ZZczA0c0VFUWNUVlMzcXlmbVc4U3ZnclE2aEk2emRXM2ZROUFLWTZI?=
 =?utf-8?B?aVRWUkF5NlRkSXZQanVLV2pySkJRNHZGamFldTFnemRkSmk3M1doYXBHbHFx?=
 =?utf-8?B?SlpNRHV5WmdCdEpxTUtPN0JURStlNHhlczh3YWFiZUdKUWZwVk01S09rOHUy?=
 =?utf-8?Q?AJz2jnxlzvAJ6kr5M7/VtqUXXzvW+zQTmzRWgxB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd153b15-5d2d-4aca-d7ab-08d966f2b272
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 11:31:21.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMSPu+jEAqwN1EwH9RYd1JOPJ/4KXwMBNgTE870AmAakRoKGP6BJM9mR4vt8kpass+c32zDaer3SngdCCZ1dT+g8LKf7Iudt0kUy7PeBf2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6272
X-OriginatorOrg: citrix.com

On 18/08/2021 21:29, Bobby Eshleman wrote:
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index fe38cfd544..ef8c2c4770 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -20,7 +20,7 @@ obj-y += cpuid.o
>  obj-$(CONFIG_PV) += compat.o
>  obj-$(CONFIG_PV32) += x86_64/compat.o
>  obj-$(CONFIG_KEXEC) += crash.o
> -obj-$(CONFIG_GDBSX) += debug.o
> +obj-$(CONFIG_GDBSX) += gdbsx.o

This wants moving now to retain alphabetical order.

> diff --git a/xen/include/asm-x86/gdbsx.h b/xen/include/asm-x86/gdbsx.h
> new file mode 100644
> index 0000000000..2b8812881d
> --- /dev/null
> +++ b/xen/include/asm-x86/gdbsx.h
> @@ -0,0 +1,17 @@
> +#ifndef __X86_GDBX_H
> +#define __X86_GDBX_H__

Broken header guard.

> +
> +#ifdef CONFIG_GDBSX
> +
> +int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop);
> +
> +#else
> +

Need to include <xen/errno.h> to avoid breaking the !GDBSX build.

Can fix all on commit.

~Andrew

