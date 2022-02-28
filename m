Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94454C6D87
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 14:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280542.478515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfrH-0004T4-Eg; Mon, 28 Feb 2022 13:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280542.478515; Mon, 28 Feb 2022 13:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfrH-0004QE-AB; Mon, 28 Feb 2022 13:14:35 +0000
Received: by outflank-mailman (input) for mailman id 280542;
 Mon, 28 Feb 2022 13:14:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A4HT=TL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOfrF-0004Q8-Qt
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 13:14:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5de7bea0-9898-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 14:14:32 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2055.outbound.protection.outlook.com [104.47.8.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-4Eev3sAWMSeVX_AD0QmVgQ-1; Mon, 28 Feb 2022 14:14:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB6220.eurprd04.prod.outlook.com (2603:10a6:10:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 13:14:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 13:14:28 +0000
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
X-Inumbo-ID: 5de7bea0-9898-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646054071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Um5wEw1f2ufoSKcJchQ47VCEqmRtpI8I7nyn3bbyGfY=;
	b=lAyqKqV9Izxe1MYX7o6f0jJDN8IAF8ED2D1hxW/f+YLYvhW98DRVtFoyDe3CYKuIskRoMI
	BM8UFtCT5OdYtri2i0+HFVHSZvFCfva0aIUrnmxHqqk/D4wE2OaacU4FjdN8P6ZX4H/FV7
	ssBivtl66mrtaJn9YAfWc9dW/LZG+kE=
X-MC-Unique: 4Eev3sAWMSeVX_AD0QmVgQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I71I0zHNrw5MbMczNt06F6ZFRhRbJMQfXCP2IsDI6woArhrL5DpNaXVS4kmT3CguXnEkrnv4Ouo7qdpo83g6l/stUgFJncRPhgjjr1nVfBWaquG/Lujb59gsGuf6Vlj6PbJJoLgGM3ANWTA7zs3UNdZDi2JRX+sq8/NtBR27aSTmlSCzoyAL6VWtOIccvS246+9kZ+Vtjpvh5y1hRcEk2ctQKvftZ+VymwJ8OEnKZHntwi/hWtI+yl3tLyOv5J2GrldVpzQl1a1pLvihabogmtk6m5Uj6tb17h47nShF3w5i5d3M1T+KnknxOq1aRHZR1QfQKKPAzry0VfarcH7Zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IKE2iV1JMgL6mQHZgo3tA2XMoT0PL676W0/BB6Faqo=;
 b=btlGAQK/th8TTKmbmbAmQZVeop20hhT49h8BUbVcH1F5Th8WI10GCcD21TsaYSKxw17+dN+bl+RUTh4Fm/duashsh7E83uRmcBUEkYdDbM3Nei/+mQFbWphC3Fk4EOht0qTI7SpfWRWD/FRPpeQu9tIVutmXnAgBWS9HWTqEwApdMozRc0NVJcsuVkviBAGCvIzEN00FZVG6BNZ7miXHvCU6FlTK1RGywZBMkKq1fgPtXZwebcaFB5WfLHfIEPMLlIrca3yqD2tYijSw2GI8TuM/FgIYBnziudKGLqLgHb7SCFWP+WCbgndKXBQU3UQNlXTps5J8NZ2tUTyHqclNPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7ad79609-bd67-aa44-56e0-1070f3ee88f7@suse.com>
Date: Mon, 28 Feb 2022 14:14:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-3-jane.malalane@citrix.com>
 <b83773ec-c97a-7aea-e61a-c2e34b270816@suse.com>
 <Yhyv6Ui4ap1wOeNd@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yhyv6Ui4ap1wOeNd@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P251CA0010.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e59bda3c-9bda-4b84-bfc1-08d9fabc4007
X-MS-TrafficTypeDiagnostic: DBBPR04MB6220:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB62208420F97C3FA2F9F2401CB3019@DBBPR04MB6220.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gwoNfgFJzqAK2HW4X+yaSrSES369qvNuSYQrfVoZ3WmtFATJmTR0Ig9DhF+BSSYPW9Un84/FXnYW+AqcUyNRt8zxqtm7cLUs8rEvLN8H9EcFyNMFUdQD4Qh76VaXInYm9y7mJ1MHmhCBfk9eCtsnLd1Z+Dn9FI6ypQRy2Y4bPMUgVwWJTyERDqJRvKqK7uFYsE6bzFjK7NztKCLHUnEFJBs6FuMqoQCvcePcPE+E+ps665jw/4jbvrAp8oBN2AI7SZSZrXEiAmaQixractMiqSMYra/mGZ8CqeZVl1vsoJzo5+xqltov3yiEX4aa+yZBawvSiLIwa2gwt2HjEpAZ1xkJ5iaPe32akYUWmGcVN299KcHiG0YjW6ouIf1j11PVNzxLcjAfENYcmJ7xZmSBlM0yYi2KFHZUawM16T4poh/GG1XY59r+JV1FVZHaRGE5pt6BehoeM8OUIn3Qnztmri7XDWyerbudaQE/u9vROZ4E6iaYjIQuzi3OzT/vv7PHq7ujCYo0h18A3D1djN0RGgUruOT3n0dAHXG7/6AHYuJBOfg99eCT//HIJ6rgt9a9pzvLn6ReaJwu4qgnQisgQ6cx836Vqv3dHA5hMPWb2vuW02Dx3Umfw5k17wnUgsOLoLknwyh4PNNC6ZQCktCcwYhOMLHllsOKhL/jtuPNjwow/SY96cMQnAdY8+kqnCrsHiub45hthXlubA2f87LFkx10zGzF2C1BjRfTwDTmaqBO97idSGn5ZPW0BPVJ8jVX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(4326008)(8676002)(66946007)(31696002)(26005)(6916009)(6512007)(38100700002)(316002)(186003)(53546011)(6506007)(54906003)(66556008)(36756003)(508600001)(6486002)(8936002)(7416002)(2616005)(83380400001)(2906002)(31686004)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6qADXP6qupXQRACkpNo9x9wiFiwbnhN6j/V085FsO0C/xj3L7/Dwtt0l9fvp?=
 =?us-ascii?Q?M+MudJHnbptb77bNUdTU9lvsSLkGZ/nVNJ0T9UkbfA+l1GHZlFK0ofWWmfV6?=
 =?us-ascii?Q?3PeiEO3N+QpCenFuGIglrVFc2eyvH43LqwVjw3IiYryY6amEeX35HuuhwB0n?=
 =?us-ascii?Q?/SMq6Y5rgnhI6lf7cRcAPmgyjU1QPSQM8Xm0R+7SDv3EMXhwGeaXwhPy0FYZ?=
 =?us-ascii?Q?n7CvbPoEkWT18b+A2869cpUDSosH1t60DzDgkPft2jOebVYTv9y03szOCYaF?=
 =?us-ascii?Q?EL1X3j85a8MhGdjZ5IonBxu0BVoyyZyGfMXZVBsFydUVm/EVBgZuDbqTCzRk?=
 =?us-ascii?Q?vNn2OVT9fS7ilfPpAOdfD7s7bVNdezbH/giU99zkTdxqeFix1ag3wrrd3BrT?=
 =?us-ascii?Q?I4DgxoaIsp37NFmknKHxZZ+x38dhc+FGGS7IPYfqq2ZAMyI2sKKbkGXtQ66B?=
 =?us-ascii?Q?wAxsAlyL09jEbNon7sjbo/oxwxx9oJ5NSdXuZbnnefvYQ2WqOP1VQAQF2LqE?=
 =?us-ascii?Q?MmYn+0IwLYdQ60fvmAfGS1dMB/cZ6DEEKARzcQsvvMi3WW7gzJFvTtRFtDNd?=
 =?us-ascii?Q?0KXg83J65H2CqP/78f4lb2dyVJosDsNPm3DYHVclDYakVaF3S5kirLwDpzyB?=
 =?us-ascii?Q?+Tlyc2wwDL9IeViyATT4U+rkQOkGxUjj3wWT8jmrELMznrpo6L5ttczbRrYM?=
 =?us-ascii?Q?x+GsgHRv0WiLH4YpgLuGZe24Kh94/nu2zW/7Nu1sExQq1pPH33NmqH72OYog?=
 =?us-ascii?Q?hmcVA1rBMJSsNbvlRnLX5Rq4khs+/witdvo+4xIKQvSEGf3rMG3+IoPDkxIo?=
 =?us-ascii?Q?/irYZEghwsfRRgCnnhW9sgTFYUL+a+0DbCL7sz5H9HXYYm/5QQ+//mdoqTpy?=
 =?us-ascii?Q?LqbczKb623MYrlkVqHti0B69KOodNhY/XyJLBkndBWBbWAbrTSU3e4RbeSGQ?=
 =?us-ascii?Q?VhkuPebYlssqFHWAz0PaNSRBiYzSRvXi8kwsKzRSjpgj/Yg+oH8Ujxn8Iugs?=
 =?us-ascii?Q?HJDH1b6g3qQIOdSfwlFK9XlNint1aKgUB/m1kP0TGn9Fg9MpeKzPar1/5lGf?=
 =?us-ascii?Q?fa8RfKxEKH+/zVYQCbg6dqcfSGMRX+GjZ2DB3vNej4MCDr7HrmNnnXM7whp9?=
 =?us-ascii?Q?Wj/U3X1ztOneAZQrRaB9I7xasgm9DOC8reDxEGPq+9Lj4qsY4Oi3CBPKzo2Z?=
 =?us-ascii?Q?xydfheF01GOPZ48oDJJveCzJ5a7b0v2HtXbSeAIPcNB37oNfrdlOoFWIeQ6b?=
 =?us-ascii?Q?IDZdh6k8RZcT6rsWekXQ7PUYbM8hgZ112V1fHEbo00q9qe+zVuF9atXGI/7B?=
 =?us-ascii?Q?IapqdoMmqoddNHCXjIfZL4OybbEmtfJCruhOCDp3D/q9svggIKh84b+px1MM?=
 =?us-ascii?Q?DTUHHYXqRvptp8Ab10qLsCIGGNrXcC7CobGgVAhR3UHzdeBuyWocMIu2en6n?=
 =?us-ascii?Q?TrheYCWgE/0XL/EoVF2TKD30umvbZ/GnkGvY4BR84IAGxGCuv7AL/ku1P8CF?=
 =?us-ascii?Q?zZfhWnXLq4l7P/zaS7XXUUlhs0Zc1CUP6xa/ijHUqOXa1j+ZExppw0Pk/3F0?=
 =?us-ascii?Q?U5RAUHo4lJ5F/6WJASUEMFQYjtfbFDsnCL10feAIBGkBNkvEAC0+PrlvjqB4?=
 =?us-ascii?Q?rNMH4jLY9nq7b+IX/fGYIa8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e59bda3c-9bda-4b84-bfc1-08d9fabc4007
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 13:14:28.5774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZtMtKLI/e7N56NJR6gP9MrJuCdbaPfzwEtUTHQUk2PxvbIGu7+4vWMppMsEcWusiobWJVGOH7/TiWLv3l5BdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6220

On 28.02.2022 12:20, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 24, 2022 at 03:16:08PM +0100, Jan Beulich wrote:
>> On 18.02.2022 18:29, Jane Malalane wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -3333,15 +3333,15 @@ static void vmx_install_vlapic_mapping(struct v=
cpu *v)
>>> =20
>>>  void vmx_vlapic_msr_changed(struct vcpu *v)
>>>  {
>>> -    int virtualize_x2apic_mode;
>>> +    bool virtualize_x2apic_mode;
>>>      struct vlapic *vlapic =3D vcpu_vlapic(v);
>>>      unsigned int msr;
>>> =20
>>>      virtualize_x2apic_mode =3D ( (cpu_has_vmx_apic_reg_virt ||
>>>                                  cpu_has_vmx_virtual_intr_delivery) &&
>>> -                               cpu_has_vmx_virtualize_x2apic_mode );
>>> +                               v->domain->arch.hvm.assisted_x2apic );
>>
>> Following from my comment on patch 1, I'd expect this to become a simple
>> assignment of v->domain->arch.hvm.assisted_x2apic (at which point the
>> local variable could go away), just like ...
>=20
> I think we want to keep assisted_x{2}apic mapped to
> SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES and
> SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE respectively, so that in the
> future we could add further controls for
> SECONDARY_EXEC_APIC_REGISTER_VIRT and interrupt delivery.

If we want to be able to control more (most?) VMX sub-features, it
would seem to me as if this would better be modeled accordingly
right away. At that point there would likely need to be VMX and SVM
specific controls rather than general HVM ones. Plus then it might
make sense to match bit assignments in our interface with that in
the VT-x spec.

Jan


