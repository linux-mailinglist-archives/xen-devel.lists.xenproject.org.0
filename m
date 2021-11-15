Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEEC450418
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 13:06:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225839.390078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmakw-0001py-Af; Mon, 15 Nov 2021 12:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225839.390078; Mon, 15 Nov 2021 12:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmakw-0001oC-7T; Mon, 15 Nov 2021 12:06:38 +0000
Received: by outflank-mailman (input) for mailman id 225839;
 Mon, 15 Nov 2021 12:06:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmaku-0001o6-Q5
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 12:06:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7abf3a8c-460c-11ec-9787-a32c541c8605;
 Mon, 15 Nov 2021 13:06:35 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-K-_QRKJ9O6SRmk2iidOosg-1; Mon, 15 Nov 2021 13:06:34 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6337.eurprd04.prod.outlook.com (2603:10a6:208:170::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 12:06:33 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 12:06:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0010.eurprd03.prod.outlook.com (2603:10a6:206:14::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 12:06:32 +0000
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
X-Inumbo-ID: 7abf3a8c-460c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636977995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1uQ8GfFVLSGQhxCiZChiDwZTXuz7fOZcKR+98o9ZG90=;
	b=PABfffCw28wAtxEL+RxhcRSHHNCDlxc5l2ZE4aFmChLjm9a1kL08QglIy1PD0rc0uUHXtA
	JgFMhDUeMIYgDqDmmKcGa5jqaUUfe9g87SlrNsB3Fm62Hhph3+1ibmczcQr3RnYBhATDPh
	xp32+/MPr6AZhfYAp9CP5kWSbNggOiw=
X-MC-Unique: K-_QRKJ9O6SRmk2iidOosg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbwODlRmvmnNS9onEFgNgdwdikvibEnLtSVrvmE5bJ8hDXIM8U0hgw+NqEj/gVKQfCAUc7OJKoqsEhFCI7/7j2BGuMhYjKgYqZOQlN/zEogtpFukyaU/xgfgmA9Glv4jdVFNZb5X0FTbKOuLSxLxJrUZsR0yfioWRJQfHyOuARR7Seo09I0T+L/x/NcRoHxOdDSNcJM71GtqZosbsCuVZEaj/InH/Gg8fAINRJv9UiL/XqrX78DGgEZYJwoHbz1tWTGKGovEhnZBKqx3hFHqqcjKnoTcn1wS3eekeV57XAhnOVp+dt7wqj8gXbZWtqGwk936ZqVg8rFXQryae+jdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+GTYTFUICm269A3Q4jbFl1JERSp+SKx9aeCBMsHZpQ=;
 b=cc60UVuIgpJXAaZaxbuArijrOXXwlaUvQckOcNA6OitRccF3+M+je6/Xm6DrI9iVU92s/FLeeRPndcYJWgit9jwPsfufjReA2+ZzDHR3SowUHYQ2Pxf80Pk8sgsYNgzTu0p2+1tZn1f/wWPYr9g8unyJHDpIi7hSYlLH5GTu0Yctt90HGG89x3ObeVCpUYMZx4O9KdLwJ0PfP8Ceow+kDUPqCbkdwr18yq/AHGOO8sGJml6QAHrE0l0ZVg1Xvsp+mSTUBaacaYH3bC+1X8TFPEvAN3jbLwcytktApKZa8nk7WVbx6ZmjnZQw9NFCLUoBTk7b7LcN9fmE3czzsMXEiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f6405eb-94ee-8907-e86f-0f045e48e8c9@suse.com>
Date: Mon, 15 Nov 2021 13:06:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2.1 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
 ACPI table parsing
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, Paul Durrant <paul@xen.org>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <0c006378-964b-3e48-4fe0-4df88e3131e5@suse.com>
 <YYkP/CHNz7bK466i@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YYkP/CHNz7bK466i@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0010.eurprd03.prod.outlook.com
 (2603:10a6:206:14::23) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c58e4286-4938-4c11-7b26-08d9a8305d6d
X-MS-TrafficTypeDiagnostic: AM0PR04MB6337:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6337027C6CF89689B9103B85B3989@AM0PR04MB6337.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hIpgIg1NxWM5Kjn0sOudcVrBH5PrV0vK/+eShOcnmk3E3/oe17sdoQUt5cb0b/I3/CTfhkFoKFNpf4MNj02HZ5N5fMn0ieQjVe8DQH0bG49gbJ0+7DhY7Bg0VhYTwtZbocm+dfvYBIVeokov9oCvACjM3V5R8Tye11ai2ewe1pakdOdmespQfx3EV8DW4fWA6IQ3c+d2b6X0rA96NnLUM2b0U9Oq5YQr48yD7sQ+1sbSL/ROutY4YlvZ2LaiGmasWYBDs+RNoJ4aM07a+pzJpPQc7usE7LoixUPncpfHh6n56x0jE1BIY9FIapaG0PdTta4Sm2jpZMO3A1QKIRmqqJzqmgpIROviWnMdYatilRdbphdA3v2ku0Zbws+aqosRJCwHyYG+HiYRXDYOU/6ueGXhRcXQWxmZUpaqKbj1Z8RC7zOa6NjKVWeOUOivcxwdnru4Fe1NuwhWV71sUmpc7OEWuDq6vCz/1RT/JUSOE+4P/b+Aua6e9C6qPVXNR/yJd/SDhGpfYsCo8pNJu3LSPtJT+kdLSSbR86w0bk4ZL5sgyQFcAhf54fSptx0nJQaL2qolxi2DPNRSx6flS9l8FQ5JLzUKFxqLgCL36iJP7O6Ll3/eaV+ew83BQXNn//P57tDSn1PFTNJ1TUJLrKVw2QN29QVrqyxGqGslYHAtiEKmZRCBS82Lumv7hAO6fcbcubskopwI1/PQnaOU3BwpH+TiYhEUL2ocHLci3m3yUI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(54906003)(316002)(38100700002)(4326008)(186003)(36756003)(83380400001)(26005)(8676002)(31696002)(508600001)(86362001)(8936002)(66476007)(66946007)(6916009)(66556008)(5660300002)(53546011)(956004)(31686004)(2616005)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TG5TJSt09FvinZugWBIgoT+ioCLtXqPFYzbzM232cayzqX8JwoE49NYzO/N8?=
 =?us-ascii?Q?VMx1gCQbAQ0zWuoMAUUarJv+QoV8rQKipwtdHFTQrEhrERWv5XFsyiBkumxz?=
 =?us-ascii?Q?jeClGwlNTrIbGWypjVab2lfs2iMp3r2lkzWg3LU1S0RTi1lI+PSUVmI0XxZ3?=
 =?us-ascii?Q?qOFmSfAVQzd4EjF0oJ/jtPzWaEh/VhTvQmb+XtqJwCmbjTPI9lTa1cA09qw9?=
 =?us-ascii?Q?oBVQhy7eOPMqqSzeQ9EC0Ga8s8+wz3CzYPaRV3clyAtEjb6TbaiA3visOZ6h?=
 =?us-ascii?Q?5tyBu/PY01YeGErLFIVrD55HqhOEHsr3+T0NcMVfAmJ8C2ZfNKVDCdE1uSGx?=
 =?us-ascii?Q?7FNWrPMbrtNQgLjLe6W5h4E16P3tAPNexXTvt0tSdmNNx+mrBgxwexAGJFiu?=
 =?us-ascii?Q?mIyV/8DC8643EeYbdkb9DMdurijAwRa2dOUQMOJ9Fncl106dR75lLkuRxogc?=
 =?us-ascii?Q?weFbtkUCLo9LRJN6Ea66PDgJwXXFq3BUCliLhSmtb6GiiMBmbe0OK1hk2XSR?=
 =?us-ascii?Q?rwIeLJEq2iTQnzsBDljhBVa75ZSHecaqnjCFDrRF1FEHe0+O4bbO+6VpM1Si?=
 =?us-ascii?Q?vwGhXYe1Ea0VnxPLFs3XbbK8apGNWc3WZINUW1q1dB0gNNuYbBi0CTVb3YxR?=
 =?us-ascii?Q?gKseLRP9JYoRQVYzdZ5C/SA2TNi8j7268pDvr+PUMQqiosb+iuVtIEMg5UUt?=
 =?us-ascii?Q?m+ucVg51bOmQvs+xpvH7ZWh0U2ixBBp0y4qiF9Q6Tbu7jBqDgnC5AUhZyi60?=
 =?us-ascii?Q?RerAPvqP+Rhnnr1nEOhEcEN45yniPUBHBuohxbAthf3oIelv6OzV2Aim7/8f?=
 =?us-ascii?Q?KSV+p8C/72lKPrrLCQatypvy52h4UTg+VgdNW57mAlo7x1jIQxAqUBEHAGGu?=
 =?us-ascii?Q?9PkX0wqjxKd6Nfi13Sdtd+NVDdvr4D+9DUhp2NPL4tjAXdi1esgI5nQW2Cq/?=
 =?us-ascii?Q?kqTwsP+6Ek4/WmWkYb3VpOMNjNT4kIhLnMjNy0Wh2A1zxTaxWHsBENnfRPxl?=
 =?us-ascii?Q?0aQj8S9sEDnDEu5uKfiJuq9Bc9+pP7p5PXCR02ZI6Dmntv0ihL6kFHOKBqGs?=
 =?us-ascii?Q?U27CtNiPX88nTtRZFaQPmCnxr/m83AyMpPzH8S/prwxI6B04Q+S6eVWG962w?=
 =?us-ascii?Q?AwnvpNCT0FLMyNYreaD6O2yzqT8et3Ty1WEv56AzhuMHy4FocTIpgRA77Rif?=
 =?us-ascii?Q?K5+K45Bq5Q2LTZHQ91acY7kJJmH8W+rz6xqocUdicY/txA9fcmY2VbqI8NNQ?=
 =?us-ascii?Q?dTG77lAFCsONkdms9fgrtf1exXhJdgQgV4Cgx/399PnMTlf8rgajCDwVssF4?=
 =?us-ascii?Q?br9xDDj15PcN8rxrzPzJmJttzSs9FiA6ZmlRTHEqsDTNwXOKFPwGVn5vaylc?=
 =?us-ascii?Q?vB9/L+xKZwWl9wOiGsrguq2viDym1XDnf0Gds1wPAHduOEujjGmk7ttYoyqf?=
 =?us-ascii?Q?6qF88COZ+RNiDRumk8lRQic+zRjqnMOmoJoIs0R+yYiy0IB60yuYYc0PxL/B?=
 =?us-ascii?Q?xnE8JA135wRRT6MQta1jn/0HiuWSA1S3nolfVcvBw6GUtbLMUov5GegbWoRW?=
 =?us-ascii?Q?4rPa+jP3kZvddDxu19ikBG7NkpWDz8S5YNqaVwavPpkjkY2zPTOGViMir3xv?=
 =?us-ascii?Q?QaCVWK0cJJF/ZyC1rPz4RD8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58e4286-4938-4c11-7b26-08d9a8305d6d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 12:06:33.0457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANVeniVhlVJvQTUprTUViA8sTd5a2fjaUuOngLnTN/QKg6u3qlxmS46lSOo00jA/QPBVY89c0MitsLLJo6gM4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6337

On 08.11.2021 12:54, Roger Pau Monn=C3=A9 wrote:
> On Mon, Nov 08, 2021 at 12:40:59PM +0100, Jan Beulich wrote:
>> While commit 46c4061cd2bf ("x86/IOMMU: mark IOMMU / intremap not in use
>> when ACPI tables are missing") deals with apic_x2apic_probe() as called
>> from x2apic_bsp_setup(), the check_x2apic_preenabled() path is similarly
>> affected: The call needs to occur after acpi_iommu_init(), such that
>> iommu_intremap getting disabled there can be properly taken into account
>> by apic_x2apic_probe().
>>
>> Note that, for the time being (further cleanup patches following),
>> reversing the order of the calls to generic_apic_probe() and
>> acpi_boot_init() is not an option:
>> - acpi_process_madt() calls clustered_apic_check() and hence relies on
>>   genapic to have got filled before,
>> - generic_bigsmp_probe() (called from acpi_process_madt()) needs to
>>   occur after generic_apic_probe(),
>> - acpi_parse_madt() (called from acpi_process_madt()) calls
>>   acpi_madt_oem_check(), which wants to be after generic_apic_probe().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks, but testing again revealed a problem, this time on AMD. The
dependencies are yet more complicated, so it'll need to be a mix of
v1 and v2: acpi_iommu_init() needs to be split out, but
generic_apic_probe() also needs to move. That's because
_pci_hide_device() relies on dom_xen to have got set up before.
Expect v2.2 after I have actually tested the outlined change.

Jan


