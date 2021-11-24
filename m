Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49D345B76A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 10:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230223.398001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpoZR-0004Ka-3A; Wed, 24 Nov 2021 09:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230223.398001; Wed, 24 Nov 2021 09:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpoZR-0004IS-03; Wed, 24 Nov 2021 09:28:05 +0000
Received: by outflank-mailman (input) for mailman id 230223;
 Wed, 24 Nov 2021 09:28:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpoZP-0004IM-GP
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 09:28:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1fe62f1-4d08-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 10:28:02 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-j3zuJ-KEPi60R3r7-J1pBg-1; Wed, 24 Nov 2021 10:28:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 09:27:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 09:27:59 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P191CA0071.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Wed, 24 Nov 2021 09:27:59 +0000
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
X-Inumbo-ID: d1fe62f1-4d08-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637746081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL49A7fFJT8RK70sCHBQGjra/68N5jzRNYZF6Trmi8g=;
	b=bA7YTgnwTBVx02er3Mt+p5ILwU44+5U/C9mM744ivhmyhSxgDmbQrfpWCYnI3rReU8dbLH
	0MyXf5Cddl8aWgQpYlZNdclczfp/m6BlIdfd5DgmJq7zsisIpBm8mbaIaY2IN42C3I7oKS
	WHNyynjbjmXVn/sdhbUsY6hJ95y4UrQ=
X-MC-Unique: j3zuJ-KEPi60R3r7-J1pBg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+/o1zue2L2qOxbsQHCI7JoA4UCAQjsfbWN6OJ1MxmRH71UChPLenJ5eCwK1EonxkorJhJgl0v/f7DYY0wab+T2hSem5ZYOoa+b6iAPi8Q4EQWkcwzOHLHhiHjcw7JioJDskYhmpWm3QjwetASTTbv9zpPYV5TCB8MXgQ3CNTSeeFQuQbMgllkUJ0QC6FZsD0Ep1YlFr3QvjKWuQbnEQGL39sa2A16ZDuzzIzGmUU8p0asotD4JaiB7UooXuq9c8t0XYzDE7qJ56KaEgUlBstu6DzFZ59Vzj7FEkGn3a2eK4V4EUSzqjttI5uOS/6ut4AJdiUEFwIrQDf/bS7aqbhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2fUj0CDdS/oldh4HviG8X4hWIFMDRKJv4Fua3//H5s=;
 b=cTW7QRLNdcn/mbXreIWuinB1WfAoQwNdBk2e4rZKmr9PBqYbhIxAPUNjOSuHU/0lmaIi2+LltoBACl8Pq2dZ6IWiWSnJCVQ6FaI3I+uG7420JB/QZIQ6HiQhz0GyDTJvOqinGntrup1qNls5FyeATL8OpEeHnz9ECa4eie97fpiU3YeJ/o+v2kUYv9hkZ6vr5RVVPkY/iplYMNckMmkLmX26keHgrkVCOm2EwK74nWMpHlqXAicCk9zqQDWYINEAG+q/6YG1MiQj+q+YmdBwsclTx+7Ncmzl7HIXixA/3Ac3YsJqs8yVqF3/ZZj8Gt1C+a/lsysmr5uGmluNpHKCtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b6ae1da-a9be-2e37-e993-05f1bb095f80@suse.com>
Date: Wed, 24 Nov 2021 10:27:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: About support for memory event on AMD CPUs
Content-Language: en-US
To: Untitled YAN <yanluyi2010@hotmail.com>
CC: "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "aisaila@bitdefender.com" <aisaila@bitdefender.com>,
 "ppircalabu@bitdefender.com" <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <OS3P286MB1995471B56ADDC423A4EDC9FB3609@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
 <ad9abcb1-0a17-644b-5338-8c305e9ce4b4@suse.com>
 <OS3P286MB19953CFD3B3D4B2B71261DD9B3619@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <OS3P286MB19953CFD3B3D4B2B71261DD9B3619@OS3P286MB1995.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P191CA0071.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 385b4c53-4864-4e38-d8a7-08d9af2cb4bc
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53256A8C70A0325A968CFAB5B3619@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wTApM5bc93TBsnaH31liQGoCQ9p9ogCys4Xi+XosD1Z44rzZQ3nSCXh5PkbU5LoLnAfG5tL2N0oxLsGEhhg6pYXnxQ3UnRNQR40zfh+95e/+WrGl2ItRgvMIBW4HqzAChEMfmd2ddVyHAKT6N9IhBGuaHEkH7Inwv4vQ1UIwvXKPNgxn63uedyljvC7ZQs3iasVPDnmk/Ek7C1/IG2qRHWTfXeGeJq7UV8JugFbVui0f6NfbodXeysMFvDaaoBNRKxNQrhfTqVAvJE1n4PpZ6wVfxVd+3xqYE6LGm+HXYxrMnkQydviXMO0qKVtsfuI39KAYaz6ABYpFjJiozKPcUkx8agqlpacQTicsP4FwrIWBu6U1kfJxP003Xajk///OakotA6VK5Vxe2dcY75ojbiBLTeAxvr9aKt/Nm/Iop8myJBe2s+sjBrXshKaAKADMxKVjbYOH0vvuq3n2Bj2jpENtV2/HUuSC/EcG1H/8/H3YUMwEMlU+KBhH/mepPMJvQyYSIfqRbiEhwFth2PZy6hWnpBth/742tpDjYMw/YVV5DEDr4vqmhzWEoCekRb4lX5tPOA62GL9SBlLyyh4+CrLi3Hzd+5zpIUWlppuOwbHptuSZdXsa2JAPIv1qAiAQfcPj4HZiLMDWwkAWLTaiGpCKWUqqQmrT5BWiWHEND22DU12wh8yLVDzDb/jvN0GnMyMyzW6NrTPA79IZpoOfaPw99gc0QZx0dN9vCR7+hbxVFwlDigtbfSS5kvUFQ5zcyKsLo+GI5fH1Rz4KD2lb9rB0xeaJP13L+9uSSqSnM6kfhDX7PK8+C1KOaQx2tLvZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(16576012)(6486002)(508600001)(36756003)(31696002)(5660300002)(53546011)(8676002)(8936002)(2906002)(316002)(26005)(54906003)(6916009)(66556008)(66946007)(38100700002)(31686004)(966005)(86362001)(956004)(2616005)(83380400001)(66476007)(45080400002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rwoa070tG7ACnFVntN9bTBhmrb/qrPXF+IAZ8gRFswT5im5qr9R6ZLG/o/i4?=
 =?us-ascii?Q?akRMOWdLP6D0mnDz5BbAXnz4QBEm3chNQ3vcvzvJqsl+Wf2AxiLZEP/ZuMBf?=
 =?us-ascii?Q?24D9tGuhhD85tdOmHlbMoEZkP8y7vSdWKBFjrWAzGziyJ5Znsr6FJL6M8oi6?=
 =?us-ascii?Q?RqsCaR2EQ+5dULmtG3JiLINdnIQzu6Ra1p9wPBfbuyKtHv+dKIgxel6L+5P6?=
 =?us-ascii?Q?BrzfaEeOEVwhAsj2rDIAxITHxYBQ6eHFy0TvO3DQ33vUovN5ivwxDnlJ/jEp?=
 =?us-ascii?Q?ixhLDUN5lk60ARMlxnz9uiHnOh6BSIM0+oqG6qDRhi8d2GjeK3iMw54kl2kX?=
 =?us-ascii?Q?ZnamKvwjrh8ZuR4Mw5nQCIHw5XFzQxz5rEpgom76/OOb53J9qTF+IRXF2M+9?=
 =?us-ascii?Q?jgJWvegh1aca15+Ui+2FZfATUjm2CJCPvgXIENSM0asvB0+vurEjcX5/gp3E?=
 =?us-ascii?Q?cs//bOEal8/rCjlqVc0NhX5vV3DwfmF9bWbuDqrcYREXyBktpKzRFDWyk99x?=
 =?us-ascii?Q?pyIUs4zyljL4VJwMVkNt7wp8TdDJp0qL30ZHNygMKstU/HgafC5URgicroGp?=
 =?us-ascii?Q?qDyr0e+xdDWoUc6wQjPb6lklO4T2E61wZk/yiKT5jfqJmaalTVUHM8db2+/2?=
 =?us-ascii?Q?EvhcDpaqUsumrr1w6cxMDLq7y4ludOgmwVmjm+2nIe41jX2q/Jvep3C6ADo6?=
 =?us-ascii?Q?HRmD3LKKczlGb/AA9B8kEErnSJCLtUH03WkozoImF7xRdNenzNSZngIknx1V?=
 =?us-ascii?Q?YHyYw/AX7tltzF+E1Ly2+aUPSEjdUlAXGB3nchRzde4LlVn1oZaF2rQpov5w?=
 =?us-ascii?Q?nTFML+UyHJRaU9Vgw+wx7wy1HB8AmDtDW+BmQm5Z9JAMHlgudXZa41uGfbuQ?=
 =?us-ascii?Q?wT7AUj7SLKvCIyt2ct2p/ZwArAEQvSbnDTkJXL1qyZZAXTgKo2r/TEncSTxE?=
 =?us-ascii?Q?a5+8bexJgiqrmqQnY7LBx2/9R+H6K7f2ktDzXWaciedpEXuuTt5MBFqFT3ao?=
 =?us-ascii?Q?K7F/VzA8rHkRShnsv5PkHTfuu6gO4DmwCiQi+IPvtbv4EU1d4fXfIuiPYzI7?=
 =?us-ascii?Q?U1CjegXX+fVKh/JHxODJWEtNnvty/dxcXP8300paPnXLZ3duVn4eEUdf33M+?=
 =?us-ascii?Q?IHL6zHKmWSywwdIsfJk+4O8UqOEkEPZVTUJNo3vVie8Gxvjss4sxLdcCvE5n?=
 =?us-ascii?Q?KkBVSegdpW4dH4+V0uokyAxAVkCT0Z/E0zj4ZMcbqHWMwSnuYbl/hBvsxq9b?=
 =?us-ascii?Q?OJPI39F6IcMnNiFlMGK0etSEQAhH3QoAlqFY6rdRetxL0vKAW9E+dxgC7jcd?=
 =?us-ascii?Q?Qq702CSXkrSrTiyKwk8CJIkCsQFLqX32UotV85vABk+TCnh08gjKivo3TecT?=
 =?us-ascii?Q?n5uXlLRMHjOPh9YsvJ1Yy+3tQfG0Q5eXIrgmTOuk419/Kyfykkx+RNYy7cIB?=
 =?us-ascii?Q?7HVPJDNuiHrd/9o0rQugsLaUONSys1FJHO1qZE8LjlYZEB1HoI5wNjpRHKvY?=
 =?us-ascii?Q?ZOf6NJAc5rolcE/7LgbvOIMXSKztwVCDkaGSVVRnVKibAM2KHvwj60OVtXWk?=
 =?us-ascii?Q?kCEkBkQMEIsoQ05uDUtZ+pvZXODN8itsO+cE/c1ujz5B6fOB9N5i1/I+ZTps?=
 =?us-ascii?Q?pHFOVsaPA7cOLAtklWYne0Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 385b4c53-4864-4e38-d8a7-08d9af2cb4bc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 09:27:59.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxapN59GNPoCjANz3BpBgRxrigLwvheHmgvIytSF+5k4DXEJwz8cWtgY0AM6IC+yVgA5McYp77ymGlRlep3bWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 24.11.2021 10:23, Untitled YAN wrote:
> Original email:
>=20
> From: Jan Beulich <jbeulich@suse.com>
> Sent: Wednesday, November 24, 2021 15:54
> To: YAN Untitled <yanluyi2010@hotmail.com>
> Cc: tamas@tklengyel.com <tamas@tklengyel.com>; aisaila@bitdefender.com <a=
isaila@bitdefender.com>; ppircalabu@bitdefender.com <ppircalabu@bitdefender=
.com>; xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>
> Subject: Re: About support for memory event on AMD CPUs=20
> =C2=A0
>> On 23.11.2021 18:14, YAN Untitled wrote:
>>> Dear developers,
>>>
>>> Short version: is memory event supported on AMD CPUs or is it going to =
be
>>> supported?
>>>
>>> Long version:
>>>
>>> Environment: LibVMI 0.15.0 + Xen 4.14.3 on an **AMD CPU** (5950x), 64-b=
it
>>> Debian 11 Dom0.
>>>
>>> What I am trying to accomplish: register a **memory event** handler, so=
 that
>>> I can capture all memory accesses within a specific range issued by any=
 thread,
>>> or all memory accesses within any range issued by a specific thread.
>>>
>>> What I got instead: an error from LibVMI saying
>>> "xc_hvm_set_mem_access failed with code: -1".
>>>
>>> Some investigation: by inspecting the source code of LibVMI, I find the=
 direct
>>> cause is one of the libxc functions, 1) xc_set_mem_access or
>>> 2) xc_altp2m_set_mem_access, returned error code -1.
>>>
>>> After some searching, I found someone else having a similar problem [1]=
. I also
>>> noted LibVMI says:
>>>
>>>> Currently only the Xen Hypervisor provides these features,
>>>> and some of these are specifically only available on Intel CPUs
>>>
>>> However, I can't find the exact confirmation for the availability of me=
mory
>>> event on AMD CPUs from https://wiki.xenproject.org.
>>
>> Aiui underlying what you want is altp2m, which presently depends (in
>> the hypervisor) on EPT being available (and in use for the guest in
>> question).
>>
>> Jan
>=20
> Dear Jan,
>=20
> Thanks for your reply. I really appreciate the information. After some
> searching with the keyword "EPT" I found [1]. So I checked on dom0 with
> "xl dmesg | grep HAP", which says:
>=20
>> (XEN) HVM: Hardware Assisted Paging (HAP) detected
>> (XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
>=20
> And the guest is an HVM guest running Debian 10 with kernel v4.16 built f=
rom
> source. Most of the configuration of the guest is generated by virt-manag=
er.
> The "xl list -l" shows that there is no explicit configuration for EPT, R=
VI or
> HAP, but it does say the "type" is "hvm".

HAP is the term covering EPT on the Intel side and NPT for AMD.

Jan


