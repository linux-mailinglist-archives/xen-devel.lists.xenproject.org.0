Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCCB4542A1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 09:29:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226636.391687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnGJ8-0007BM-KC; Wed, 17 Nov 2021 08:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226636.391687; Wed, 17 Nov 2021 08:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnGJ8-000795-G1; Wed, 17 Nov 2021 08:28:42 +0000
Received: by outflank-mailman (input) for mailman id 226636;
 Wed, 17 Nov 2021 08:28:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnGJ6-00078z-9B
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 08:28:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d4e156c-4780-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 09:28:39 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-b2rKcIdaNoitie0wYQjizQ-1; Wed, 17 Nov 2021 09:28:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5165.eurprd04.prod.outlook.com (2603:10a6:803:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 08:28:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Wed, 17 Nov 2021
 08:28:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0502CA0024.eurprd05.prod.outlook.com (2603:10a6:203:91::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 08:28:35 +0000
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
X-Inumbo-ID: 5d4e156c-4780-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637137718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZqmx/f9SxWx6HKq+SKbz6qRkXxJuCzX6FjMoUHU+TI=;
	b=CosIbDsJMx92ZVVdFDcpF59A2O7GWyYolM2O4KDVuObg9dqmoBI33b6nyO0M98VNUXZzcg
	/3zhsVpzz9PEuMLk7DiR8W43W4I+tC8u0bwl8LZUwdm2RhAopA8gC/kaCTMSw/XpdOun5K
	/m2i+y430pOQFFcMcr0rikGyMEryy1Q=
X-MC-Unique: b2rKcIdaNoitie0wYQjizQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LT6tPDzLpEvX1a1N9Q6UFRxdqTNoppdDeFVOsHMc6wyNhtpiky7XijKy3Fwka/tCDXkVxLdKh8x9fea05s5GveANO+HkQvzMUwRKEUjnRJhmAAjy6E7P4CQaf1/AX4DfsOMueoo9ST8QJiv1V6Fgbl0E8OpeUvpvawNDb9OV2l3QLz4W5Tlp+pDF4WmlJx4MNRcMo6q1yjhiZE77XJCSDf9gB6N8L0udQa8r83GLetpCF7ttc5lf7CRfx6UzFYjx670Q+9bHJR89qTT9h81YhV2uTv22odE39bvZIW55+nNP0bKFIuwDFhSU/QA5IAp8is0UHYADygFjUltSMuT43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZqmx/f9SxWx6HKq+SKbz6qRkXxJuCzX6FjMoUHU+TI=;
 b=gLyiLwGbbQ5pvBo0kvP5jdbKM2Si7NBi3oskhaRMlgqu+5Kttp1pNteCkRHQ47b/UXWwA7is2S2/9e1yniBRl6ZlQgHIBVPVGAURwLLUHmfnPX+RK5xXchYxI/o2Jua7RWvlit8kw2PKJZ6EHjOUSs9oNhTpY2tFA8EYR1QIfky6XU3oeU3TTj2XNRd+7a1DWDmB01nmKEmFdYVFQR6S9vIdsMNSkDEhLUIGeGJE4XnLJ5bPTbRLO5T9U60i4X62j4sl1GM7hMc9Sw++39CM8WcSIY33TiR+8a1s6kvad5JmkcTXXkoqR1OixKwBLRtmKuI781aadi6Ou2JKsE9f2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cf0d5566-5629-76f2-ec8d-a05e6ecb4248@suse.com>
Date: Wed, 17 Nov 2021 09:28:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>, roger.pau@citrix.com
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211105065629.940943-3-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0024.eurprd05.prod.outlook.com
 (2603:10a6:203:91::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c0d4edd-4d05-4d0d-6794-08d9a9a43fd1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5165:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5165E9F48C25D44952BA51FFB39A9@VI1PR04MB5165.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kcslf0TSlfIOyrPabVI2Qe8jvVlp/ROmz14AAWNvj8TwCWWSi9cQIsZNn7rys0iiV0ClEQdCZlK+q7FXtthpxcKsqc8/zC7sONcsXtFC1LlStKtqKLf69tfMTlB0wJV5jk6F7ykQK0/6Wj/YsvDIRkVX8ZOCod0XM6eLJnu0tY13bJQ5glNrDXE3AmKEK54dmyMWzr0bQwfGuzflAn7eVb31IN+vCyAH79ilx/DkgvTz/odjJhKcuSbWsf/LAMySRl5ADJwYe0SXTMDte5HzP54f0do14vg2H982NVkBo4eV5FjN4S2Aevk9vjAitXwnyenPdSDqi6aBy22Eh+w0xR7W1cP5oNOXtzm9I7uYoIqc9Dr09sCb2yAjeJMc/JJVjEawR1zdrvrBaBh0Pcq3uVgJ/phRDteXmlm0KvT0HO/qdJTO9aJ0UN5g1vL/9H9MTWMNiyT27+rw2NDy0zQtJ90qN6cfc+ISJ+So4GvuxgMhCpgCIC/WqxQ8sd7wS0NW0+r1jp0njZuxmQx/Q3YgU7T97seSzg08Br32WESbw2CoaAoUDPxQP/uLNv4hi0M+05z04nmzMDTvXsRXIdvMjlLVcVrjZ9FM/Y5PmVSOyufI/pHcMPLt9brNEZxLiKkx49Bu68N/jkwkA69OppqG0Z1kvnFQyVQ6uBzEpDot1BarckwFciyyucdDgQNqdUXJiWNXM82rrwSm4rvwZAqybCYsMWoobkZVuc9J0j+i/co=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(508600001)(7416002)(6486002)(8936002)(31686004)(66476007)(38100700002)(5660300002)(86362001)(66556008)(31696002)(66946007)(2906002)(16576012)(83380400001)(36756003)(8676002)(2616005)(956004)(26005)(316002)(186003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlE5d2Z6alVZU05LR3BJcDRyZGk0TWpVS29yWlIwVk5zNHljUXBHdzFxemZZ?=
 =?utf-8?B?bU5KbjRGTHBmT2dhaTFUbUNwei9MOTVZUi9HY01aR1BwN0MvQWwyNXdMYUkr?=
 =?utf-8?B?UklWcG1xOE5BanpkS3F1a0NnUXFBQ0FVQngvYzJIc2ZwQUJqY09BOFllY1ZM?=
 =?utf-8?B?ZGRTMU9DbVJkSmtiSEhtMjh6TERIK1JTL0ZDMVd6VnovQklaRUtOS0NwblVl?=
 =?utf-8?B?ODlLK1JZTVhGT1F4WEZqZi90MkpFTWltZXkzM3RaUG1tNUFEQWhPOTRzYXA1?=
 =?utf-8?B?WjFvRDVVc0gzQmlXNHZYMmdSZUM5VFp1WldCTmJDeStDQlNma05BSC9BT3B4?=
 =?utf-8?B?dGU3am1ZaXVDcVpWNnkzdXFjOEFnazE1eU1NMTBrSzFuMU1QK3ZBVEt4SE0w?=
 =?utf-8?B?MGNaYzZtVXFIL3FrRnRqVjJIRzE4L1hOWjg5QTJwWEVKS2JZRGVBaGJBWW5W?=
 =?utf-8?B?VTd5aWc0TUtoa1NXaVhTNUhoOXhFQkEwRXVTcHdkVE9MNnd1RkR3NGNnYzFm?=
 =?utf-8?B?cGdJM2xWV3AxSkVkelhQZE9udy9yNnVnQ2pnUVp5K2FZS2s1Sk1VL3Y4ZmZ2?=
 =?utf-8?B?Q1NkRVFRNzh6MmlSazlDcjB5c2liL3liY0c1QTdGdkxVSmJleGM0dTEyZGRM?=
 =?utf-8?B?dnk4ODFHcE9SY3JFKzA1RGFsWkFyejFtalBNRnByMGZ2MEpEY2UyaGRzTE9B?=
 =?utf-8?B?b3doV3c1K3hIUmh2cWhUNzdrSExpTGw1aURlM2dOS0hVME4zdkduc1lMNnU1?=
 =?utf-8?B?MnJIZm1xbis5SkZSZHo5OGVEQS81L0ZET0dYOU43amFHaWI1M0d3WFcycHYz?=
 =?utf-8?B?dHI5cEgvYzFRREJOUnoybDRhUVF2RjFZMlNjV1V3K0V6RVdRVlhLQktpT1lN?=
 =?utf-8?B?QVpNLzh2TUZna2wxcG01cUtrM1F4Q0tVemRiL0tJQy91U3JSRFZxb3YvKy9a?=
 =?utf-8?B?RmVZRVNFaWRGV25ZK3FJa2Q3RURHemMvdW8wNkIvMVlsNzlFbk9PQjExUGll?=
 =?utf-8?B?dzlFdlNCMWExVWpDVUNOTVZlRWsrOHZRUk1XRGlmdEx3OW02ZTEzU1hhcWhw?=
 =?utf-8?B?U1lLVndqRnFINGpDd0R0OGxoWlpBQ1hmQlFuVTcvZVl0MVVrMno4SFVPSUpE?=
 =?utf-8?B?QTRSOGt6NURoeVU2YVVqZm1YRktnL0VNQ01vZEFhMTRqMk5VRGR0MzNMZ3lI?=
 =?utf-8?B?ZDVYeWFIZmJyQzZ3Q3RPREJmSlZTL0luWWFRNDRkTCswdGo0RE1NYkpCaDlp?=
 =?utf-8?B?eUdITlFGN1JkREF4N0syT3g1b0hWYTI2WEdhYUFWUFhnUURYQno5eWdpU0F2?=
 =?utf-8?B?TWxGUW5ocHowdXdQelJpOUxYUVJHeWRxL01NWXV2a2dkcjBGOHZuOUtEa3Jx?=
 =?utf-8?B?N0tacUJhQU4wQjFMVVJUdzdKRzNMeWwzTG9sc3RGR2dFbFcvZFF3bmF4WElJ?=
 =?utf-8?B?SHhLeWhWY2JLdnQ4cXJMNUo4bDVTMmZ5SWtYMThZZ3FoSWlEb2dXeU9DWlhN?=
 =?utf-8?B?bFl2YjRoeGtaSHg4RTVPTU95WHcwckhqQUhSRkxxNmpwek8rYjI0RlJRNDlx?=
 =?utf-8?B?aUR1U3dIMkJxRlVQc2hGVmJWY1Y0d3pmUExSOXFnWVNRTysrZmQrRDZxNVlm?=
 =?utf-8?B?TERkYzAza3FrT2t6ZHhDNUI1Rjc3Y1hVZ2NxVzJnZ0Frblpwa0JlRWZBcjlz?=
 =?utf-8?B?elQ0c3JZYTFhbFZMQzV1dmJ6YTNzSWRzWDd0NlRPVWZmL1BwVEp4VU5tdWY3?=
 =?utf-8?B?VS9VODZPZDdVVXlLMkYxUHAzVG1FaEZLbHUwY0tPVjl6SFBWeHZ1UjRzSitz?=
 =?utf-8?B?RHBsMzcxU1ZCdGpKdUFkeHFCVVRYSmhQbDdlOHRIenpQQUxBSUxTSmphRzVo?=
 =?utf-8?B?QnM4RGsyS3dRTWtNVER5NTZBWEMxbzVicVF3eCttN0R4ZFYvMkd4aHczR0dw?=
 =?utf-8?B?N1ZyQTg2c0tFc2xPZ2pUZDAzbUxiT3NxMTVuWTgxTE8ydWk0STZzbndTWCtl?=
 =?utf-8?B?YngyMlRTOXlnZmpqSkhGei84aENKNDZ5U0VJbnRNNjNzMjJOMkUxK0hhWlJQ?=
 =?utf-8?B?QmErOWZwekpjVWwyTTJlbnppb2IyZ2lnV2lkUFI0M3Z2bVRER250RGo3LzNk?=
 =?utf-8?B?ZjYrblNwcFhjSzFkNk1KT1dJbEY0U2p4VXMyOEJxTmY3Rkh4WEZtV1pJZ252?=
 =?utf-8?Q?pEaTnSUK9JgLmrjNFsH5QOo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0d4edd-4d05-4d0d-6794-08d9a9a43fd1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 08:28:36.1553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KI9beLR3yAqGqOngJ8NNSJFlHhWo0X9pGjAFC8jqzgRxrR1ItahqlGx4ZH8GtKm5ZGJbzZAHWaLbtdezWz72Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5165

On 05.11.2021 07:56, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a vPCI is removed for a PCI device it is possible that we have
> scheduled a delayed work for map/unmap operations for that device.
> For example, the following scenario can illustrate the problem:
> 
> pci_physdev_op
>    pci_add_device
>        init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
>    iommu_add_device <- FAILS
>    vpci_remove_device -> xfree(pdev->vpci)
> 
> leave_hypervisor_to_guest
>    vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
> 
> For the hardware domain we continue execution as the worse that
> could happen is that MMIO mappings are left in place when the
> device has been deassigned
> 
> For unprivileged domains that get a failure in the middle of a vPCI
> {un}map operation we need to destroy them, as we don't know in which
> state the p2m is. This can only happen in vpci_process_pending for
> DomUs as they won't be allowed to call pci_add_device.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Thinking about it some more, I'm not convinced any of this is really
needed in the presented form. Removal of a vPCI device is the analogue
of hot-unplug on baremetal. That's not a "behind the backs of
everything" operation. Instead the host admin has to prepare the
device for removal, which will result in it being quiescent (which in
particular means no BAR adjustments anymore). The act of removing the
device from the system has as its virtual counterpart "xl pci-detach".
I think it ought to be in this context when pending requests get
drained, and an indicator be set that no further changes to that
device are permitted. This would mean invoking from
vpci_deassign_device() as added by patch 4, not from
vpci_remove_device(). This would yield removal of a device from the
host being independent of removal of a device from a guest.

The need for vpci_remove_device() seems questionable in the first
place: Even for hot-unplug on the host it may be better to require a
pci-detach from (PVH) Dom0 before the actual device removal. This
would involve an adjustment to the de-assignment logic for the case
of no quarantining: We'd need to make sure explicit de-assignment
from Dom0 actually removes the device from there; right now
de-assignment assumes "from DomU" and "to Dom0 or DomIO" (depending
on quarantining mode).

Thoughts?

Jan


