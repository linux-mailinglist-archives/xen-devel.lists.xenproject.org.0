Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1643B36CA29
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 19:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118756.225003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbRHa-0005pl-Fv; Tue, 27 Apr 2021 17:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118756.225003; Tue, 27 Apr 2021 17:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbRHa-0005pO-By; Tue, 27 Apr 2021 17:13:58 +0000
Received: by outflank-mailman (input) for mailman id 118756;
 Tue, 27 Apr 2021 17:13:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdCB=JY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lbRHZ-0005pJ-7b
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 17:13:57 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ee50396-22f9-46d7-8dcf-7fcde2e0f8c2;
 Tue, 27 Apr 2021 17:13:55 +0000 (UTC)
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
X-Inumbo-ID: 6ee50396-22f9-46d7-8dcf-7fcde2e0f8c2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619543635;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JbRKzhpVlf2VbjtmobxWZxnb1SqtXCD1SpVPktVam6c=;
  b=VAW0ik+QltTVFoH1vFb05XpgoBjWTXojYfraiTPuVPK4YGcxhu13pSLw
   Of9hK2y2a1ZqIkFINP8MJD9yjpY5UzWM6eDz0Mhl6Z75CFvAqRnuV2lRu
   TAeSRny241eUY6yzmbH86DAtPQnuXWTc0ufyCcZUIuCnktxgpQMcCsFgS
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qRHSuBtCZr5dASpfiQGim+CKw+WJLb/80628vXnIR4RLhVB4wFhxUE+QAR54WgN9NrF+Yh8nBM
 +09kaKpD0IdNZRXdpuH0aclbF8UiByd7yDe5O9e3AJEmw/DFe8CQi6vOybk8EFpW8weTeVu5Ws
 XadIdM+2aqkyBm1GrCacU7fFqaHQhK8KoM/q3smuDbgHulR4og2FYG4G2jERmNAowbW0KjQv6H
 ujz4IJ8VJEU07VZylv/TsQV8m/CVl5L7LCBxrfsMpnRy+G6w9rgBgyAobMySSA9P4s2CdrL0o0
 uSc=
X-SBRS: 5.1
X-MesageID: 42528467
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:aRa/m68DB4SmEyFHJ1puk+B3I+orLtY04lQ7vn1ZYxY9SKKlvu
 qpm+kW0gKxtSYJVBgb6LS9EYSJXH+0z/NIyKYLO7PKZmXbkUuuaLpv9I7zhwDnchefysd49Y
 NNN5dzE8fxC18St7ee3CCdH8w7yNeKtICE7N2+815XQQtna75t4m5CY27xeHFefwVICYE0E5
 CR/KN81lmdUE4KZce2DGRtZZmgm/T3lYnraRNDJxkr5Bjmt0LR1JfGEgOV1hpbbjVXwb1Kyx
 m9ryXF4MyY3M2T+1v16Cv47phdmtfto+Ezf/Cku4wwIjXohh3AXvUGZ5Sy+BYvoO+u7142kN
 7D5zcYVv4DjE/sQg==
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42528467"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHEiLs9Cjp1fS2kB7pEFGbtx9oE2g21cZkzTGaJYbDFuq0qCGi/qg1QREfnjsi+FUuXQejYwLWcVxp/NwiTWO2/TM7Fdmqb11Nkpj/x7vsCCId/4nURuj/DK8Y2yKM3L6h/xyyzG1XNqfLKU7SCpp7rqIAgxR2XPnqeFmeITWrH/trjrhtbKD6sUQSE0rAvgGVdST43l58GeHuXfYbD8elKC2eYVI2XwOi2d5Jabm5OrJwNlkLvpD0kY4/duZSs+d5LS6fNm9DsIxuxGJVOixiYbFW9siFrJI8PQt11hhDXA0CSgvjdtDKJIogRIQ8Cz7JqXe4XmIex3OvWEffgdBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GipC76gcOYhyuCYNSQNZrDDtl/VDAGbMS971GClrTis=;
 b=nTiFCnnSxZ1eF/9Fu2gCqT6sVh3P0X5SWjKWCQSpSiQtw+/cebbotORWae81gWMdHcEhWnVSxnIVFzZF1Yhh1lY+0RSVAWxSCgk9IQEMTGdXJ8lEE/e7evUKhxw/m8RHjiDOoYtLE5JS5yaYuaT8Hn6frfsfQjvJYY0EhbCDM5VO8lXYHHcSvlmxGgNh61jLfH0IaInCGJ1mMn4lCwlVc147YzRxlDXD985pD9HnOjZiSPsi75j61wn69qui3RFAb3oog4e7v26CgAvSsYI6cpmENZbjSKMXrne8me+xI9SjOcvyWMG9NVrYCGEH/cNr8aZjOMP8HUXsPjXuQBVlcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GipC76gcOYhyuCYNSQNZrDDtl/VDAGbMS971GClrTis=;
 b=Q/9y6P4lXYcJRD7exCleOSCpI3twzJY/MBO9+GyrIeM2M8Ya/HcBIGTqDokCxR6XU8JdyDUCjRjr/piL+fSW05kLUK8vKBgKVjXfiHlun6XT/EbPtyY6bHjkij0q5ioJbybIG4T/0HiliOgKQ84M0IRF+950GlCk6cJepcYDnEo=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
 <0e1d3e9e-ed29-d7e8-e4fc-e48a0454faa4@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/7] x86: introduce ioremap_wc()
Message-ID: <8cb67c2c-d5f9-a72b-d0d3-9289f6c9b512@citrix.com>
Date: Tue, 27 Apr 2021 18:13:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <0e1d3e9e-ed29-d7e8-e4fc-e48a0454faa4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 358c9015-33b8-47cd-568d-08d9099fd4a2
X-MS-TrafficTypeDiagnostic: BYAPR03MB3493:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB349377FB1580BCA9DE14EF78BA419@BYAPR03MB3493.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ty6aVe2YFgU5xjIQF2XrqstRH7YTv2V0tWDCg0jUkvkfvK1KTDVE6eZwgoIxsy11eZomOcw/PLrpSYHKtWDUcWH3A+SLI3dL+pXPGMAW0E4NS09V7qmhNOwo+0Fra0anN5oFP5yKL+RGwD4sKZF5u/LkSIMhNf66489EiScfH07cgANqMryrpWkliaQPk2uLGYcuFPQmQQbFw9q01u5oIym7synsjzYmw8mb2M0TXWBucRVCn4Rgeq8YJiJeFpWRj6Z7znsZbt7BqNmNgpMt1eSYa26O+GNiGPJOZIxy5l07Znt/1GuexiCjrzqsHj65eFyEtjGsvhi2TluBZj22KpiXXVaZcnMEYVB+By+YqWwMbCNVHITcPvVdvovCCi9DisFF2Wj8FBt97xF+GoDkeXN8qJHLbOaZrxsmm0pSxTZdhFaLhRseitH663DgL7gfA4wby3qfjzXdOrFiQfYJDiGNhLQQMrvh+Bt5lwmT2sbUkPDJKlsJbez6XGWTpP0SArS/xbnQmE28g2PpP2EFd/kLxu1onguwk2djtKx1RrHBCBBCPdFr6QRFzegVuAC/xhshpr4Lo++KjWsz7krdrQZx7qLNTeS2AF97WtBUODW7QTxiMNODwgKtE0tM4doZ+poVfiXGNlzCsgn3CWLKRL427rzZc0odz9tMlYgNF5xkBUaPD+qCjn4CUWp9HZjY9+rdWVAXN0JlOL3MdMsyRjbfWDGxfo+C2NQcCNuw0/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(136003)(346002)(396003)(5660300002)(53546011)(316002)(478600001)(66946007)(66556008)(8676002)(31686004)(6486002)(107886003)(4326008)(83380400001)(66476007)(31696002)(54906003)(110136005)(38100700002)(8936002)(16526019)(186003)(6666004)(2906002)(2616005)(86362001)(36756003)(956004)(26005)(16576012)(45980500001)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RHRySnJKQThLZ3pzTGovYkU4Vmp6cnNicXlneC9ob3pmV2xnYmg4bHVGWXVh?=
 =?utf-8?B?NGJSakpaeUQvTytITXl0VHZzZWI0YXJZOEwwRk0wS0tPNE43QUhOU1pldWVP?=
 =?utf-8?B?QWk3Y241b1N2WmJDd0NFbkZnb3FFL3pQMWtFZXdvSndpc1hsbXpta3JPbytr?=
 =?utf-8?B?WkgyY0JQdU8vTm05d3ZWMHpRWEVFL1RPSk8rejFnem5FSWlBNDQ4S2s0SEcz?=
 =?utf-8?B?K0RSa2RzUGRNSHBlU2hGNTQ0MmFaUVF4Ymw2ZHpJWXJWaWFMOC9WTWJhRDBu?=
 =?utf-8?B?UTFNTnhSdFlCa3hFYktlbkZUMW8xMWhMdTF3bUp0RTRkS0JBMnl3R2hicllD?=
 =?utf-8?B?aXdielZNZFUrVXJLUVNJL0NLcm1nVllJQTEzYjN0MExLTkhxcXNMOC8wcUE2?=
 =?utf-8?B?TDlhMEcwTTZwYmpvbDVtUkhxY09FNVdab0dWdTBaaXczeURZSlMwWUpiam16?=
 =?utf-8?B?VlZDNnB2eVducTlQTGF4YWx2L3VwY2Y4Tkl6SmdBRmI4dUNUR0h5ZjVINWlx?=
 =?utf-8?B?T3gxMWlEUzZVcFg3Nm03TU8wYS9tY1JnQi9BUjNjakFPNVl3ZkV4VjFRWW5s?=
 =?utf-8?B?WldkTEtQdXcvUHhYN1FBL3RaVUtXUFFJMFl5NHp0QVF3cDlTNURsbmZxREhr?=
 =?utf-8?B?RVdLSkpqMHNab3kvd2NZYmxZMms3cFRJSlB2R0x6MzRwQ0YxcVNBSi9KdklT?=
 =?utf-8?B?MHpweWJhRURoc2xpcmI1Y2swbG9tVjJYelFuM01JVFZRUXQxL05lS0J6M293?=
 =?utf-8?B?eE5TSVlJSnBiVDY2amo5UlB0VTIvbHQxQnVFa0lQNnJQbDErNzhRRlFVOFRR?=
 =?utf-8?B?ajdCMXAvWlMxeWpJWXYzZTVtWk5BT2k0eVpkbVJKZi9PSDlZeXBMZlJFMHox?=
 =?utf-8?B?akI1VDlNU3NzOHpIbjVJS0hxME1uZnJYcG1CN2RZeXFoSkpaNjFvM09LT2kz?=
 =?utf-8?B?cmg4VVJiN3JNY1F6T2NkQ3kxWE5USEdwdm40NHpNd2xjcUVPV0VOazVZaXVi?=
 =?utf-8?B?YUFZcG1SZktlVHAzZFlrblhqWEdUUlZnT1hJVUpxMUlzaURPbHdWUVhSell0?=
 =?utf-8?B?RDR2SnI3RDZLYjVIY0crYnZrZW9qUW1EMDdWSVN0RjB2WEtLYjBLRngrL0lq?=
 =?utf-8?B?YjBTY3lPTU9jSUpHbmVRRTlhVVRCL1k5dHZrVWdDbERDK2VwdmNud1FZbEZ6?=
 =?utf-8?B?S21QdWNYZk9EeDhzd010MStYQVNIMDdBVzEyTjMvWjlid21LOGJqUFpJaGhx?=
 =?utf-8?B?SFNvdk9mMkFXbnl2NWhZL2tNVCtIU3lLeWIrQU4rYWpZUlRsSklpWU5MR3NZ?=
 =?utf-8?B?bzZmZGhocXphRmdLNHdaNDFUeDdZVkJCZDV4QnlDQ2ZnbHJVMllTSmpnWXZI?=
 =?utf-8?B?Yk1hSzJEYzdHVGttY0s3RDZzSVJDdFZXdUNObU5QeUNCdUwwQ2hOU0dDYkJE?=
 =?utf-8?B?dG83SnUxWDFET282aWo1L1VoZTFnU3gxa0c5ZWx3aTFGeDdWMmppVm5ORXlt?=
 =?utf-8?B?VWZvZncwTnMreVgxQWRwN05DUUNzVGVUN3lXRHAxUnpSLzNmaEVGVFgyazkw?=
 =?utf-8?B?TnBBZktkNSs0N3ZXM2xvM2hiR2VsRWw0QUIxUGxPNSsxRk1ubjluZFI5VHg0?=
 =?utf-8?B?VHBLZ21iaGJQcHF0d3hWRHk3TVdHaHFpdFU0NTFjTVE2cUtxdDloNTNldzBG?=
 =?utf-8?B?WjV6QmEzWXpuSmYzT0dEQ255S0ZwWjl3dGs0ZSttQS9FaTZOVXR3Z1RvVlhW?=
 =?utf-8?Q?nwy/rkHz7TXoTjFszpcesVhAPAtAthYRwVYXTPA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 358c9015-33b8-47cd-568d-08d9099fd4a2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 17:13:52.2983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxnOQXEVvmmiwH7cMi6ilw+Jc0zrNVmLSKTx966BKgtkk4bNSwkoT/+moabFiuiloF8cg0GqK61acc99G70JOUYiFvrABnNTrO/rWg8aNYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3493
X-OriginatorOrg: citrix.com

On 27/04/2021 13:54, Jan Beulich wrote:
> In order for a to-be-introduced ERMS form of memcpy() to not regress
> boot performance on certain systems when video output is active, we
> first need to arrange for avoiding further dependency on firmware
> setting up MTRRs in a way we can actually further modify. On many
> systems, due to the continuously growing amounts of installed memory,
> MTRRs get configured with at least one huge WB range, and with MMIO
> ranges below 4Gb then forced to UC via overlapping MTRRs. mtrr_add(), as
> it is today, can't deal with such a setup. Hence on such systems we
> presently leave the frame buffer mapped UC, leading to significantly
> reduced performance when using REP STOSB / REP MOVSB.
>
> On post-PentiumII hardware (i.e. any that's capable of running 64-bit
> code), an effective memory type of WC can be achieved without MTRRs, by
> simply referencing the respective PAT entry from the PTEs. While this
> will leave the switch to ERMS forms of memset() and memcpy() with
> largely unchanged performance, the change here on its own improves
> performance on affected systems quite significantly: Measuring just the
> individual affected memcpy() invocations yielded a speedup by a factor
> of over 250 on my initial (Skylake) test system. memset() isn't getting
> improved by as much there, but still by a factor of about 20.
>
> While adding {__,}PAGE_HYPERVISOR_WC, also add {__,}PAGE_HYPERVISOR_WT
> to, at the very least, make clear what PTE flags this memory type uses.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---

Seeing as MTRRs are full of firmware issues, shouldn't we also
cross-check that the vram is marked WC, or we'll still fall into bad
perf from combining down to UC.=C2=A0 (Obviously follow-up work if so.)

> TBD: Both callers are __init, so in principle ioremap_wc() could be so,
>      too, at least for the time being.

I don't see us making use this at runtime.=C2=A0 Uses of WC are few and far
between.

> TBD: If the VGA range is WC in the fixed range MTRRs, reusing the low
>      1st Mb mapping (like ioremap() does) would be an option.

It might be fine to do that unconditionally.=C2=A0 The low VRAM has had kno=
wn
settings for 2 decades now.

That said, the low 1MB does use UC- mappings, which means we're entirely
dependent on MTRRs specifying WC for sensible performance.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5883,6 +5883,20 @@ void __iomem *ioremap(paddr_t pa, size_t
>      return (void __force __iomem *)va;
>  }
> =20
> +void __iomem *ioremap_wc(paddr_t pa, size_t len)
> +{
> +    mfn_t mfn =3D _mfn(PFN_DOWN(pa));
> +    unsigned int offs =3D pa & (PAGE_SIZE - 1);
> +    unsigned int nr =3D PFN_UP(offs + len);
> +    void *va;
> +
> +    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
> +
> +    va =3D __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);

This doesn't look correct.=C2=A0 granularity and nr are passed the wrong wa=
y
around, but maybe that's related to the fact that only a single mfn is
passed.=C2=A0 I'm confused.

Also, several truncations will occur for a framebuffer > 4G, both with
calculations here, and the types of __vmap()'s parameters.

> +
> +    return (void __force __iomem *)(va + offs);
> +}
> +
>  int create_perdomain_mapping(struct domain *d, unsigned long va,
>                               unsigned int nr, l1_pgentry_t **pl1tab,
>                               struct page_info **ppg)
> --- a/xen/drivers/video/vesa.c
> +++ b/xen/drivers/video/vesa.c
> @@ -9,9 +9,9 @@
>  #include <xen/param.h>
>  #include <xen/xmalloc.h>
>  #include <xen/kernel.h>
> +#include <xen/mm.h>
>  #include <xen/vga.h>
>  #include <asm/io.h>
> -#include <asm/page.h>
>  #include "font.h"
>  #include "lfb.h"
> =20
> @@ -103,7 +103,7 @@ void __init vesa_init(void)
>      lfbp.text_columns =3D vlfb_info.width / font->width;
>      lfbp.text_rows =3D vlfb_info.height / font->height;
> =20
> -    lfbp.lfb =3D lfb =3D ioremap(lfb_base(), vram_remap);
> +    lfbp.lfb =3D lfb =3D ioremap_wc(lfb_base(), vram_remap);
>      if ( !lfb )
>          return;
> =20
> @@ -179,8 +179,7 @@ void __init vesa_mtrr_init(void)
> =20
>  static void lfb_flush(void)
>  {
> -    if ( vesa_mtrr =3D=3D 3 )
> -        __asm__ __volatile__ ("sfence" : : : "memory");
> +    __asm__ __volatile__ ("sfence" : : : "memory");

wmb(), seeing as that is the operation we mean here?

>  }
> =20
>  void __init vesa_endboot(bool_t keep)
> --- a/xen/drivers/video/vga.c
> +++ b/xen/drivers/video/vga.c
> @@ -79,7 +79,7 @@ void __init video_init(void)
>      {
>      case XEN_VGATYPE_TEXT_MODE_3:
>          if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTION=
AL) ||
> -             ((video =3D ioremap(0xB8000, 0x8000)) =3D=3D NULL) )
> +             ((video =3D ioremap_wc(0xB8000, 0x8000)) =3D=3D NULL) )
>              return;
>          outw(0x200a, 0x3d4); /* disable cursor */
>          columns =3D vga_console_info.u.text_mode_3.columns;
> @@ -164,7 +164,11 @@ void __init video_endboot(void)
>      {
>      case XEN_VGATYPE_TEXT_MODE_3:
>          if ( !vgacon_keep )
> +        {
>              memset(video, 0, columns * lines * 2);
> +            iounmap(video);
> +            video =3D ZERO_BLOCK_PTR;
> +        }
>          break;

Shouldn't this hunk be in patch 5?

>      case XEN_VGATYPE_VESA_LFB:
>      case XEN_VGATYPE_EFI_LFB:
> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -615,6 +615,8 @@ void destroy_perdomain_mapping(struct do
>                                 unsigned int nr);
>  void free_perdomain_mappings(struct domain *);
> =20
> +void __iomem *ioremap_wc(paddr_t, size_t);

I'm not sure we want to add a second prototype.=C2=A0 ARM has ioremap_wc()
too, and we absolutely don't want them to get out of sync, and we have
two new architectures on the horizon.

Perhaps a new xen/ioremap.h which includes asm/ioremap.h=C2=A0 (although
thinking forward to encrypted RAM, we might want something which can
also encompass the memremap*() variants.)

ARM can #define ioremap_wc ioremap_wc and provide their inline wrapper.=C2=
=A0
x86 can fall back to the common prototype.=C2=A0 Other architectures can do
whatever is best for them.

~Andrew


