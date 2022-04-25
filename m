Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3726D50DE99
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 13:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312779.530145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwh3-0001m1-8Z; Mon, 25 Apr 2022 11:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312779.530145; Mon, 25 Apr 2022 11:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwh3-0001j7-4h; Mon, 25 Apr 2022 11:15:49 +0000
Received: by outflank-mailman (input) for mailman id 312779;
 Mon, 25 Apr 2022 11:15:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niwh2-0001j1-Dn
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 11:15:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e1aef51-c489-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 13:15:47 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-_2Rh9sa7OL-9bSjGcBLjeg-1; Mon, 25 Apr 2022 13:15:45 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB6PR04MB3174.eurprd04.prod.outlook.com (2603:10a6:6:c::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.21; Mon, 25 Apr 2022 11:15:36 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 11:15:36 +0000
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
X-Inumbo-ID: 0e1aef51-c489-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650885346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XdJb7m0oKszlbU3WDt9WCRJi6lBQX26euM6HdNAbSIA=;
	b=VZrVbuM97ZCyPj/45FJKWXg37UzfURKmiL0YR5nTvqOT2LTwkZa4TScianpuGK1/gtM/Mv
	gs7qEH6neRVg9lJKXe3LMNmDyFedYxOUC78POiAyBmLW3JNbKPTDbNgaYFKhG8vda0ADUl
	3gnVVwV+Ik8zWUbUNm6RgxIEw+mffI8=
X-MC-Unique: _2Rh9sa7OL-9bSjGcBLjeg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWsBkm4lqWOxUBKwIYZGi9VQwW2fXMBBbfFjaWDKkVtotqdPZI0fQQRdrYUuu/KQOlw+2kKj6uiGO/6VPkvJ+FZ97NvlryowvF8UxSFSYEEPmRt2dqs8ui76NPQ5Wzyy96flEqAradqmQhhyYQVK604GYSS2glUEFc1LR1yabfRjM6HuG4c55rVtKE9VpmQCYezaaUaR/8PIEen4nA9QaGb40sYidCpNRFxTNrU0HzCYFPWmRHMRnPZsmcQ0relM308zZG5N3cslMQbXE+OePhX6OHXe5IGQCy+/J5n03v/TeRz00TvJJIFqhi4m10sgST0VsJ5bU+jSta+v8/F8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkoC4ma4idfMPFBs/fHpvRbncOgnMKTYgKiGPSBafoM=;
 b=ezrJoyg+jqYvwd2sVY0Y/ANeQ8hVmEjF8FyClgbxC079sYASWKKFb/Ono9V28+ga+oJsGiLTGBshrc7s++3GbZaY/htPUmvfHC4vjNgrphjBD0ofAlFRfXib2HG5C4M+Uv6y34pNM1aG0JUCf/l5n4arpndzow7IGYGx1mV7je9658nR8q9k9T7mbzMyY7dJ7ymAotQlXDooDJRns8CoAddvWbbeLHNkZ/uWXTmdr2acvAb2qway/VkLe3AP7Zg8szUmLMDdZtfi6+ZhxwdvRbgH1oHh4Ba6Ai+WkWihvZEyEgggMTuoY0zpAKlFhcSSjxjL8vCS2Wf+UbwVJknn9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b81be865-55d5-8f8a-020c-6df9fd524ea4@suse.com>
Date: Mon, 25 Apr 2022 13:15:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [EXT] Re: DOMU: Virtual Function FLR in PCI passthrough is
 crashing
Content-Language: en-US
To: Naresh Bhat <nareshb@marvell.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <DM6PR18MB3193BA01B3A6FE2A4A9EAE5CB9F59@DM6PR18MB3193.namprd18.prod.outlook.com>
 <7d1d06ce-6bbb-b4c6-5b59-32ac37e41c4a@suse.com>
 <DM6PR18MB3193E803521B24BB2BBD331AB9F89@DM6PR18MB3193.namprd18.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DM6PR18MB3193E803521B24BB2BBD331AB9F89@DM6PR18MB3193.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0286.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::32) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 429a6ed3-be78-4027-608b-08da26acebaf
X-MS-TrafficTypeDiagnostic: DB6PR04MB3174:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR04MB3174078836B926E0EADFBA43B3F89@DB6PR04MB3174.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KEOhIlTDlHUkeULjZNRd9AyNXWomzHghRyBjLk5usEgvBY7a51vMiq2eMY4FaiEtvtdsZ74OxtJrq2W1V6w81xjK5RpdN2oOfmbBlwcl/WrO0IqN1VlIAtmWRfO29KxH/G9oGXOmwFmWfJgg8e3yrq6/4jeavAzVnv+zMClaOHqGwyuJmOr2Nn/Fer61jEx0eOgz24gmK2iwHAETX0/fFqNxsQzoBg7JMvg0l0b+22Wa4jmaUTEfmTN1HLSHkyjlQJAB7ZLGMCshTR4orG+gUA8hRtGVIXZzNDlpiKf7HnLU+s8prciDE2NrlHTKSvLQ8aHeoUPNRj/j8G7khDYNI6wgEpYhmlvSuyc0n7c1ZXoUO3/mycm+ht3+lR8XkSPZKyebgVhBdXZlp4Jg01lOrhCU67j0KhNKEBc2vhVcwsl3u9wssRCK451jxicV3J7g1z8GPZvNTMBE1lLnXqwsHMnJwBeF6cW50Mq0atyVB93XkWmslQTKpCE0EUNEMZ0ctfzaZMSdPnhP0hyayl7S71i9YPZeIrRtSPBnVc+nWeIlBeCauIadb1P3zlJYv2hg/3rl2Hm/HHOa9SpVLVyGL8D1KxLae9z1I/ftVejjOVrO5Shk+efXH+uT0lmYMYeZ00gng1GFkrNbPcGKp0xdldoNRM0fkXkhdRJ1OARwqAOxpkrNC/sOJNw0HCt1IktVuNFleOIauCnii3nqnM5Kkiqgfp6UZ42Gt0wbybKOJFfIcl/WIQddXAGpRx+UmR36
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(5660300002)(8936002)(6916009)(31686004)(316002)(2906002)(4326008)(6512007)(6506007)(31696002)(86362001)(6486002)(53546011)(508600001)(36756003)(66476007)(83380400001)(66946007)(66556008)(8676002)(26005)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SmFcvOwHJwZuHbKG8lRhWtzLQDzEUG8MURk6ZChWHalVs4XO8Rt5oUV9Gz9j?=
 =?us-ascii?Q?mzG7J3J+DloM4Fga5dFxkOfkTzo5fCNabDfg0sMjBebBPDvONafppEo2BW9c?=
 =?us-ascii?Q?xkpgYI98yUk7RB0FNauI/gUmziKewiYDm/q+YhgS89wX/NqP2tTIQpPzS2Cu?=
 =?us-ascii?Q?Q6Vh4o0bHCLPyNA+Cfd9+YwOnMJbl66DMIbjDke+iIlLaIeRzRxg6PbhYgVx?=
 =?us-ascii?Q?L0g4wA8943gkScDAAzHXSXf5dmj34JyBAnbavtS+0i51EfcPgze7O7ma0cCq?=
 =?us-ascii?Q?wFU7yQlQtwT9Z678n264OtVH2KyltN+tdA5lFAECaSYnbYxrvuUsdQh++HGe?=
 =?us-ascii?Q?WjBRU49bGP1DWcwMdXnil6DGSBqLE4tkoBKHURWMh8KBWp5Y92+H5B2VTkNR?=
 =?us-ascii?Q?Tkv+kvli93bCHHjqQjWgH/sMgqsXQ8Mf7vNtfER93q7PkLyd9WGcHfaIMW89?=
 =?us-ascii?Q?hEjOkmd67y7BzBicOLvAr5BQyVDhuKld46i6GGz+2kGmloYYsOCmUjWy6j0S?=
 =?us-ascii?Q?tYMErnGFpIw07Zd+A/4WBkTMfIWzx2PkI2Z+HPyJyE87N9x6AlxlXJs/eOEq?=
 =?us-ascii?Q?KZxP4WNygDgVb67zn8XTbkl7HI+KsE/XhWNoNoaDCNkSrU46963c5cxac9fY?=
 =?us-ascii?Q?eOMdhKvTrUl4RUeRyK5mYdGiicFksHU3E2l2NttVGiLEqE0eDC2ULPJaeNbn?=
 =?us-ascii?Q?ipRGSBWCWeVGY/ou250ZO5B8WHmlK4X8P9t2H3nibR/yueIqbc4zhVQw/lIV?=
 =?us-ascii?Q?qlxuKZInLye2jEdRjuEDoWElu4CaNRTx9Y5eTzCNm/KadPZ05ZSNtfT/NjO7?=
 =?us-ascii?Q?ctjQnk08I2edAWkKidT1bb8TATlpPkMBjn8T0BWUjbXQBp37dKuZQcGaNcKi?=
 =?us-ascii?Q?WAB/GSAwIECPyLuNCGXlFlFJZlIdg+tWDhgmm09Kb5j5woR6EL64ksMFjx2S?=
 =?us-ascii?Q?Vj9vlllFYWgb5jlOC9nPYiITXply9go/lH6GtPCXDhIZu7rvO5JthsTdki32?=
 =?us-ascii?Q?+jxjWSQ/3T2l6utn+BhOQ02td2syPFCXA4IhIpQCYJ7b3p+ss90N0hhxHl9j?=
 =?us-ascii?Q?DhJGTdjB5ImPhoW8QcqsMIb77YjeyJgYYrSxK7KUplggc9H2MZJQBGtyp4+O?=
 =?us-ascii?Q?1b8twAeh4wVWYnKI5ZUNv+VB0qMSxFwL9XetJ3Rojswy46eAAzyUwqP6K6gH?=
 =?us-ascii?Q?kQJJMed5yeQigXjb9c4Z4SwixH8GhIcrUiMrrxErLFg9mjK9eKlNDsVJjIH3?=
 =?us-ascii?Q?vJ+so28lnWSM/qVr3FnOP3kj0eb7j84gl4cGj9Z67NO14vA6/Hdmq35xEIHX?=
 =?us-ascii?Q?HkMTaqansGVUIi4WphkCGFy8Wh2igN6ZGWG0rBiQvGL1CDACbNV5r9Gg1I2x?=
 =?us-ascii?Q?PQnP2vgktt+++dfN9/X0ISG2Dq0YA7hf/43ieNdqHrGw4/uJcwUIb0vC+lN1?=
 =?us-ascii?Q?txLvg0j85Ro5aMCk5QIaGPOU7lk1ee/VrSQgM/ZnEimFLWTJoU9ophYd6i7Y?=
 =?us-ascii?Q?xXNcsfuFaIGvCFe5m/7OTiCK7h0PITwAr14zxv+F8szW089mFgsVqI0aPaxU?=
 =?us-ascii?Q?1qWY+BRejuC93ytPLhgbt5a5B5pVlVjCD/R4nsy7mAw8N3YbHNn9LF/2jGpN?=
 =?us-ascii?Q?e55QOEN2YtRiWiM3qgP9QlIKFUcFbjHhGWSFIdnjq2291CHr8a1IQh62TCrc?=
 =?us-ascii?Q?Ex5TzbJJYYqZ/usq5YzUxsVEEOtyoDX8IEOq+d4I0xJi0aWA4B07bq+5jVgZ?=
 =?us-ascii?Q?Iog8yXp+1Q=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429a6ed3-be78-4027-608b-08da26acebaf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 11:15:35.9714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkFciziDoeh35XqUIlEXCVIZWwsEyZJrvQ68YCDCeu6Du3IsVH+g6+/Oz/SptbJVvXRIv8WLfRE4HUlO6n35TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3174

On 25.04.2022 13:01, Naresh Bhat wrote:
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 20 April 2022 18:37
>=20
> On 20.04.2022 14:48, Naresh Bhat wrote:
>> I have the following setup and try to test the Function Level Reset feat=
ure.=C2=A0 Any suggestions or pointers will be very much helpful.
>>
>> DOM0
>> Distribution: Ubuntu-20.04.3 (kernel 5.8.0-43)
>> Xen version : 4.11.4-pre
>>
>> DOMU
>> Distribution: Ubuntu-18.04.6 LTS (kernel 5.8.0)
>> PCIe device with SRIOV support, VF (Virtual Function) interface connecte=
d to DOMU via PCI pass-through
>>
>> Issue on DOMU:=20
>> 1. Enable MSIX on DOMU (We have used the following kernel APIs pci_enabl=
e_msix_range, pci_alloc_irq_vectors)
>> 2. Execute FLR (Function Level Reset) via sysfs interface on the PCIe pa=
ssthrough device in DOMU
>> =C2=A0=C2=A0=C2=A0 # echo "1" > /sys/bus/pci/devices/<ID>/reset
>>
>> The following crash observed=20
>>
>> [ 4126.391455] BUG: unable to handle page fault for address: ffffc900400=
29000
>> [ 4126.391489] #PF: supervisor write access in kernel mode
>> [ 4126.391503] #PF: error_code(0x0003) - permissions violation
>> [ 4126.391516] PGD 94980067 P4D 94980067 PUD 16a155067 PMD 16a156067 PTE=
 80100000a000c075
>> [ 4126.391537] Oops: 0003 [#1] SMP NOPTI
>> [ 4126.391550] CPU: 0 PID: 971 Comm: bash Tainted: G=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OE=C2=A0=C2=A0=C2=A0=C2=A0 5.8.0=
 #1
>> [ 4126.391570] RIP: e030:__pci_write_msi_msg+0x59/0x150
>> [ 4126.391580] Code: 8b 50 d8 85 d2 75 31 83 78 fc 03 74 2b f6 47 54 01 =
74 6e f6 47 55 02 75 1f 0f b7 47 56 c1 e0 04 48 98 48 03 47 60 74 10 8b 16 =
<89> 10 8b 56 04 89 50 04 8b 56 08 89 50 08 48 8b 03 49 89 44 24 20
>> [ 4126.391606] RSP: e02b:ffffc90040407cc0 EFLAGS: 00010286
>=20
> The RSP related selector value suggests you're talking about a PV DomU.
> Such a DomU cannot write the MSI-X table directly, yet at a guess (from
> the PTE displayed) that's what the insn does where the crash occurred. I
> would guess you've hit yet another place in the kernel where proper PV
> abstraction is missing. You may want to check with newer kernels.
>=20
> [Naresh]: We have tested with latest kernel i.e. 5.17.0 kernel, issue per=
sists.

Thanks for checking.

> As to FLR - I guess this operation as a whole needs passing through
> pcifront to pciback, such that the operation can be carried out safely
> (e.g. to save and restore active MSIs, which is what I infer is being
> attempted here, as per the stack trace).
>=20
> [Naresh]: Any idea when the support will be added to Xen ?

I'm not sure there's anything in need to be added to Xen, except for
an addition to the related public header (io/pciif.h). It's pcifront
and pciback (part of the kernel) which would need extending. I'm
unaware of anyone having plans in that direction. Maybe you want to
make an attempt?

Jan


