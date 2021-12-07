Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF146B70D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 10:29:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240782.417507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muWm6-0005Bl-Lc; Tue, 07 Dec 2021 09:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240782.417507; Tue, 07 Dec 2021 09:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muWm6-00059W-IZ; Tue, 07 Dec 2021 09:28:38 +0000
Received: by outflank-mailman (input) for mailman id 240782;
 Tue, 07 Dec 2021 09:28:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muWm4-000597-UR
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 09:28:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c8d2c15-5740-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 10:28:35 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-vxk_XcoNPf2WHUkngk-OEw-1; Tue, 07 Dec 2021 10:28:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Tue, 7 Dec
 2021 09:28:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 09:28:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:20b:92::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Tue, 7 Dec 2021 09:28:30 +0000
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
X-Inumbo-ID: 0c8d2c15-5740-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638869314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lfcSPe1W1IJzWhvNWEVpuh7t8+DZxBDrBzdcSgNnuys=;
	b=WKo3Fn8k8l4cfFNssYzktU7IG1sviYp09BTYXjQdITTyVt5p2bIn/hPRZq7pHlXzsA+WC6
	oiIksPYDQ8oVXIF2V16HQ0/pAhX7I2F9L3G99tDQwTokgdOXXHEsMJkXS6E0RhVYBsSrrK
	R24gXMsDGfu8B96QbV4RkNQgIxdub04=
X-MC-Unique: vxk_XcoNPf2WHUkngk-OEw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBgAwGH+erjFAl51lYAhaDXaAXIpPMgRtHxQ8HHSo7Cot4S8/4GOOAE6OA9JtzvD16i3krudw1PXnDSEYdiNoOtF5o6yRRnRJ+wyjQFzb6I2o5Lo/beiqkpvt0XXxKhUhKs/DWtDV97Jt1CnfsKYDBjsQ8F0+4nw2+MfPqERX2xrQpV6pAIGD6VKyo2XOxrpIjnioMFdPtDlCJetoIQXEeUA4M+rPfAo2knJQP3IMssBIhbRpWQ8EFelT1iqB06ezO9P8U1iLrXJHPSy7YnGZbicZkKDGgDSyAqd3IC1zXvlhbdfzhCA6jvdGzxclJ9kweMJyv4IeA/SKscVDdfAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiteJttIURtn9v2zxI5oX4XFbu5Jd/LPlFnN4ErCAAs=;
 b=akBFeAw7e0MinXpHAHUWzSUtA9q+HYp9jKrPrFr5pv0fJJVAa0PPs01SrhShzXU/NjYgj0NccY78y1JF6vVBcIXjkcrvwMY3SwwAuBB9xc8tN0wfpn+zJ1BX1ga9+jh4403w5oAazACPWhTknfl9iHnN5pB5PxXEwaGBrXHBx7IAnCvaxscJ2dHlBJwmq3zVc5u7C5uSJZRM6sH5/ekwzcZdRmXnqZAcBh6OpD4tEF7yT7UqIiq5XRipwin2Jh8V0bDRywOGurspzJ67U+IUtwyoIIgh4OzsK1brz0Pu7pj7GHJ3fFkipS6lwie5VzWvqN8PVLP7GiUp2c189dRUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50a8c9c3-9d44-1cd3-d456-a78a03835799@suse.com>
Date: Tue, 7 Dec 2021 10:28:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 01/10] xen: introduce XEN_DOMCTL_CDF_INTERNAL_directmap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
CC: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>, "julien@xen.org" <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20211116052506.880728-1-penny.zheng@arm.com>
 <20211116052506.880728-2-penny.zheng@arm.com>
 <DU2PR08MB7325137A71A2D7277F1A1650F76E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325137A71A2D7277F1A1650F76E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97822326-73a5-4dbb-84cf-08d9b963ef3e
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63044BCC594BB552D98A1717B36E9@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LnWrOc/waiwiMhMMnB0P6Te9SGz3+6efik7gyp0m3dlkhYfoLMUZGL01MPzF4Tkg+1be0/tUw4VnEZOz7Du1bpTxBxYn4uriYtx6asUxSgyOkT82p2nJR6VnYTpE3XwUKEeRplEK9rk/uhL84sQEYBefI5x5cXBSBfEzXUqQebcfXlY9zZgujLFpyN/z8OOWCuO75Jvxz5gZj6SJSweYlJXEMUpacutjdlX3AEJVXohh2MYwt/jYqbMMf1bj9yZdMJNn9D2yj2Z3PfgUVfA/f24Doe7l1ZhYArZdHDmR0kLRkIcvl8OGplUyDdT8FefCrw3LH11fOw9mCaQ0cREgWSof/n3q6nKQZv74rLkTVZuftf53/WhlXqQ7UZ5SsL85T6H7Sgv5hmAKKcnvWHu4PWBrSfOYmWPaoCwNbRwqzxuYYuVW2dqolNaVpZHYcEZMI3axrYZLMtgsJjv8TJyvfB+1ThslbRldtHMHscUT78wbExbzPVl7e2yyKXb57on/BbhpFHgwO6jb8obG50E1M91AAKsD3w1NWw7COuvOjdgX4BTjZac7DiQg7jvmOUg2Fm42LuQ+wAFpiD99sYZq8739BGcM60MAzfgtbygjnJcf1UH04m5eM0tlZ/x7ZdZ4IkAmDkJO8OXLK21Uk5g/1A5O0v3hAh4QcWdkmGpRhdEPvjI5m09kWRG4tAGBesnLLj6Qcmil8shmpv6c9YGMm/QQoHInf2DA4sKkvTTnbX0D6D6v4PhsDAGULIjN6Bafo77Tk0LA2E26856Vbnc7kxWFFgbNOpkHJ1lmcWntHGQptRvC/jjLAO8WhE3NAZQ8DoBe0A4Xt6RN/MSoFbC8rw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(5660300002)(6486002)(36756003)(31686004)(66556008)(8936002)(31696002)(38100700002)(316002)(16576012)(54906003)(2616005)(86362001)(66476007)(66946007)(956004)(26005)(966005)(4326008)(53546011)(6916009)(2906002)(508600001)(6666004)(186003)(83380400001)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cI6ehfjnwfQtWbYCMhq0ToRKDTq9cFzpHUSc6nKLeeYmpHkxRhkq9qlWshY0?=
 =?us-ascii?Q?LOFW3FYDreoh8FlXszcxnsgyxhdVnKT7+tqMopwQMUjyTKkPkuArx6KjAAd9?=
 =?us-ascii?Q?LIh9HYhs+Lq+R+UhPKrSBmY06bJ25fA38IPnotyGIr1DOdPMNQhYvAqeQ0Nb?=
 =?us-ascii?Q?r6qOXVJs7NfsEzPlw9NJ1HjiPFmFi5H2uzqgfCbsbY13Ilq60hxL58EqG0ct?=
 =?us-ascii?Q?xqqElHF09SkfuFicgYQaqIny0uoZDduUJo0tFG1biy+/gukLVRN+K4xBEA61?=
 =?us-ascii?Q?1rIxguXEOEC3G6p6Js0gdvtux1avdPQ3kQMon1rwtgW/uAYUN8uH3B7VLNx9?=
 =?us-ascii?Q?LoU8DCgzjkkhofyOc+agF8mGgF+whX9TGfg5GUAAjJQEYkm9cBlVUoVIXa+t?=
 =?us-ascii?Q?A+crqS0Hm/ddVvcYDGohHtH3DVgy+cX/mwbpl9KWd5zI8Ph1q4HpyIjl5cek?=
 =?us-ascii?Q?fOraDgFPqHwEBKiUJX6bQA+vn2OPwSLvYr5/B2NZ5NVFtRY1PyeKVmoapdXq?=
 =?us-ascii?Q?6bFCMgKatn1XW0v2xGdElpxbtJ76towHESNQe5YlDtXTXglpqhCjyap0mRHn?=
 =?us-ascii?Q?Lq8rfGB4FSrJQkclD347LJanCwXVF+lKwdpw1ibgB8dhPang8oFD6YdqON+t?=
 =?us-ascii?Q?MLzbDgOfbwa8Y8Z/+vPNhLZKVF4GZK1hIIBB/IfkR+WFI2iLuRHuEStDthiD?=
 =?us-ascii?Q?Lgl8oA8/5rtSOrF0euZ8CNnmNGXW4VHjpag28GKRnNn64xA8/yg7KPfb+k3e?=
 =?us-ascii?Q?XFxYKEskaa3b5xO761UmEfhJvRlafWsWH5bkW/kg7LI3JHsQttpp169Fq9+H?=
 =?us-ascii?Q?xlKftuogbvGtJIvgKXDUt3P3urFXchXbct2PbOEMDtJFUzhnAx5EHD6cb/nD?=
 =?us-ascii?Q?1ZAaCo6WXtTJiz34GR8neeCkxi17MMSiuYYApLxOd6dhf2do8chnO8G6DCY0?=
 =?us-ascii?Q?j4Yiikyr1Mqdms9jGNAs6buxb+p6bHRD9lrs7pLZmMDQepOlkh5rCeiKB6fT?=
 =?us-ascii?Q?pB8+u4no+y/hOIvi9X6ToZc+k3l/n/XKqYnterId6xYzry590nIq/q0EfPcl?=
 =?us-ascii?Q?Dp437X339aBEFaDzGEu5H9dR04YHXEq5oDk7+iACE62yoIQ8v0AKmL/cFchn?=
 =?us-ascii?Q?2+SfjUwuTcxWoJg+tMzJVm8ZaQ8jKUWZY9sgxQQQZn6gyud5xlVPqKcDw6Ri?=
 =?us-ascii?Q?q4idTVITG+foaSWvHeIqhrqWmdGUJuGUWQ7NAaldfMsX48hVVRwz6Keunwa+?=
 =?us-ascii?Q?34NeMTj9dz/VW83eP5fqTsWjwi5m8Yi+h1S6hUsO/etYfA0ZdbHPQ3BrNt47?=
 =?us-ascii?Q?9zDA4AcVNxaCvz9e32hp6VKn0UOWIPNHZCgFmtsdJUD+r6FIlaK0Q0aezn5n?=
 =?us-ascii?Q?v9wxgs7R0m7+ksU32IjNpCxO/YsOGfrdk0Wf0T1/01TsxvE2xeHnkrFIbhgs?=
 =?us-ascii?Q?Iy2HhiVd8viwofQvVKafkawVAtYDe+JFmcid/+3gjOuTOR85iRxiiC2gN3+y?=
 =?us-ascii?Q?YcUYKlCXizCwc3yWAcN40mxqz2m25sv6FndsWg9Y7+tTQtldIohABmwysgm+?=
 =?us-ascii?Q?XE297KPyDudMJqSET2hmVZmS/0sTA/CepMiV/XOlnaGNE+sgoZDzJkv3+Yxp?=
 =?us-ascii?Q?mJjWLCsK2SzkX8rc8rAycKM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97822326-73a5-4dbb-84cf-08d9b963ef3e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 09:28:31.8517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbaCD28dTVHJz+rM3Q3pq7BC7Et3GPbdqBwtCD/WhgwctgVgCi1wXPbmrkZkC8JOxiru4QsvOJrmHupCEVr/8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 07.12.2021 10:15, Penny Zheng wrote:
> Hi guys
>=20
>> -----Original Message-----
>> From: Penny Zheng <penny.zheng@arm.com>
>> Sent: Tuesday, November 16, 2021 1:25 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: nd <nd@arm.com>
>> Subject: [PATCH v3 01/10] xen: introduce
>> XEN_DOMCTL_CDF_INTERNAL_directmap
>>
>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>
>> This commit introduces a new arm-specific flag
>> XEN_DOMCTL_CDF_INTERNAL_directmap to specify that a domain should
>> have its memory direct-map(guest physical address =3D=3D physical addres=
s) at
>> domain creation.
>>
>> Since this flag is only available for domain created by XEN, not exposed=
 to the
>> toolstack, we name it with extra "INTERNAL" to distinguish from other pu=
blic
>> XEN_DOMCTL_CDF_xxx flags, and add comments to warn developers not to
>> accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag=
.
>>
>> Refine is_domain_direct_mapped to check whether the flag
>> XEN_DOMCTL_CDF_INTERNAL_directmap is set.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> ---
>> CC: andrew.cooper3@citrix.com
>> CC: jbeulich@suse.com
>> CC: George Dunlap <George.Dunlap@eu.citrix.com>
>> CC: Ian Jackson <ian.jackson@eu.citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
>> ---
>> v2 changes
>> - remove the introduce of internal flag
>> - remove flag direct_map since we already store this flag in d->options
>> - Refine is_domain_direct_mapped to check whether the flag
>> XEN_DOMCTL_CDF_directmap is set
>> - reword "1:1 direct-map" to just "direct-map"
>> ---
>> v3 changes
>> - move flag back to xen/include/xen/domain.h, to let it be only availabl=
e for
>> domain created by XEN.
>> - name it with extra "INTERNAL" and add comments to warn developers not =
to
>> accidently use its bitfield when introducing new XEN_DOMCTL_CDF_xxx flag=
.
>> - reject this flag in x86'es arch_sanitise_domain_config()
>> ---
>>  xen/arch/arm/domain.c        | 3 ++-
>>  xen/arch/arm/domain_build.c  | 4 +++-
>>  xen/arch/x86/domain.c        | 6 ++++++
>>  xen/common/domain.c          | 3 ++-
>>  xen/include/asm-arm/domain.h | 4 ++--
>>  xen/include/public/domctl.h  | 4 ++++
>>  xen/include/xen/domain.h     | 3 +++
>>  7 files changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c index
>> 96e1b23550..d77265c03f 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -629,7 +629,8 @@ int arch_sanitise_domain_config(struct
>> xen_domctl_createdomain *config)  {
>>      unsigned int max_vcpus;
>>      unsigned int flags_required =3D (XEN_DOMCTL_CDF_hvm |
>> XEN_DOMCTL_CDF_hap);
>> -    unsigned int flags_optional =3D (XEN_DOMCTL_CDF_iommu |
>> XEN_DOMCTL_CDF_vpmu);
>> +    unsigned int flags_optional =3D (XEN_DOMCTL_CDF_iommu |
>> XEN_DOMCTL_CDF_vpmu |
>> +                                   XEN_DOMCTL_CDF_INTERNAL_directmap);
>>
>>      if ( (config->flags & ~flags_optional) !=3D flags_required )
>>      {
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 19487c79da..664c88ebe4 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3089,8 +3089,10 @@ static int __init construct_dom0(struct domain *d=
)
>> void __init create_dom0(void)  {
>>      struct domain *dom0;
>> +    /* DOM0 has always its memory direct-map. */
>>      struct xen_domctl_createdomain dom0_cfg =3D {
>> -        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>> +        .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>> +                 XEN_DOMCTL_CDF_INTERNAL_directmap,
>>          .max_evtchn_port =3D -1,
>>          .max_grant_frames =3D gnttab_dom0_frames(),
>>          .max_maptrack_frames =3D -1,
>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c index
>> ef1812dc14..eba6502218 100644
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -692,6 +692,12 @@ int arch_sanitise_domain_config(struct
>> xen_domctl_createdomain *config)
>>          return -EINVAL;
>>      }
>>
>> +    if ( config->flags & XEN_DOMCTL_CDF_INTERNAL_directmap )
>> +    {
>> +        dprintk(XENLOG_INFO, "direct-map cannot be enabled yet\n");
>> +        return -EINVAL;
>> +    }
>> +
>>      return 0;
>>  }
>>
>> diff --git a/xen/common/domain.c b/xen/common/domain.c index
>> 56d47dd664..13ac5950bc 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -486,7 +486,8 @@ static int sanitise_domain_config(struct
>> xen_domctl_createdomain *config)
>>           ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>>             XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>>             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
>> -           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
>> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
>> +           XEN_DOMCTL_CDF_INTERNAL_directmap) )
>>      {
>>          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>>          return -EINVAL;
>> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
>> index 9b3647587a..4f2c3f09d4 100644
>> --- a/xen/include/asm-arm/domain.h
>> +++ b/xen/include/asm-arm/domain.h
>> @@ -29,8 +29,8 @@ enum domain_type {
>>  #define is_64bit_domain(d) (0)
>>  #endif
>>
>> -/* The hardware domain has always its memory direct mapped. */ -#define
>> is_domain_direct_mapped(d) is_hardware_domain(d)
>> +#define is_domain_direct_mapped(d) \
>> +        (d->options & XEN_DOMCTL_CDF_INTERNAL_directmap)
>>
>>  struct vtimer {
>>      struct vcpu *v;
>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h i=
ndex
>> 1c21d4dc75..054e545c97 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -72,6 +72,10 @@ struct xen_domctl_createdomain {
>>  #define XEN_DOMCTL_CDF_nested_virt    (1U <<
>> _XEN_DOMCTL_CDF_nested_virt)
>>  /* Should we expose the vPMU to the guest? */
>>  #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
>> +/*
>> + * Be aware that bit 8 has already been occupied by flag
>> + * XEN_DOMCTL_CDF_INTERNAL_directmap, defined in
>> xen/include/xen/domain.h.
>> + */
>>
>>  /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */  #define
>> XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu diff --git
>> a/xen/include/xen/domain.h b/xen/include/xen/domain.h index
>> 160c8dbdab..2b9edfdcee 100644
>> --- a/xen/include/xen/domain.h
>> +++ b/xen/include/xen/domain.h
>> @@ -28,6 +28,9 @@ void getdomaininfo(struct domain *d, struct
>> xen_domctl_getdomaininfo *info);  void arch_get_domain_info(const struct
>> domain *d,
>>                            struct xen_domctl_getdomaininfo *info);
>>
>> +/* Should domain memory be directly mapped? */
>> +#define XEN_DOMCTL_CDF_INTERNAL_directmap      (1U << 8)
>> +
>=20
> I run into some trouble with defining this flag internal in the new serie=
.
>=20
> Let me explain in details here:
>=20
> 1. Currently XEN_DOMCTL_CDF_MAX is set to XEN_DOMCTL_CDF_vpmu.
> So we can say that XEN_DOMCTL_CDF_MAX knows that there are 8 CDF flags(0 =
to 7).
> The corresponding ocaml tool has a list of CDF flags and currently it kno=
ws that there are 8 CDF flags:
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dtools/ocaml/libs=
/xc/xenctrl.ml;h=3D7503031d8f61c2dbcd4aa803738c83e10dfb7bb8;hb=3DHEAD#l64=20
> This tool performs a check to see if the XEN_DOMCTL_CDF_MAX is equal to t=
he number of entries in domain_create_flag.
>=20
> 2. Here we are reserving bit 8 for internal flag XEN_DOMCTL_CDF_INTERNAL_=
directmap. As this is internal flag,
> I do not want to modify XEN_DOMCTL_CDF_MAX.
>=20
> 3. Everything is perfect until someone tries to add another global CDF fl=
ag:
>=20
> #define XEN_DOMCTL_CDF_next_flag  (1<<9)
> #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_next_flag
>=20
> XEN_DOMCTL_CDF_MAX shows right now that there are 10 flags but ocaml tool=
 sees only 9.
> then we are getting build error.
>=20
> Hmm, would you please help me find a way to fix this dilemma, thx.

This was already outlined, but let me do so again: You do _not_ want to
overlay with XEN_DOMCTL_CDF_*. domain_create() already has an internal-
only parameter. That's a "bool" right now and wants extending to an
"unsigned int" covering both the existing "is_priv" (step 1) and your
new "directmap" (step 2). To make visible the relationship, naming the
respective constants CDF_* (with no XEN_DOMCTL_ prefix to represent the
difference) might be appopriate.

Btw, as a result (if that's not the plan already anyway) you then
probably also want to decouple is_domain_direct_mapped() from
is_hardware_domain(), and hence create Dom0 also with the new flag set.

Jan


