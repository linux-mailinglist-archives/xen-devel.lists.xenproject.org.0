Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8450692C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 12:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308027.523510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nglUn-0007CT-RA; Tue, 19 Apr 2022 10:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308027.523510; Tue, 19 Apr 2022 10:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nglUn-0007At-Np; Tue, 19 Apr 2022 10:54:09 +0000
Received: by outflank-mailman (input) for mailman id 308027;
 Tue, 19 Apr 2022 10:54:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nglUm-0007Ah-Uz
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 10:54:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09645d59-bfcf-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 12:54:08 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-u_EAGbj1OrKxVgDgG071JA-2; Tue, 19 Apr 2022 12:54:02 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4097.eurprd04.prod.outlook.com (2603:10a6:208:60::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 10:53:59 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 10:53:59 +0000
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
X-Inumbo-ID: 09645d59-bfcf-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650365647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7h+da+QdWxygBAW2R25rF/7lk6rFTbxvXXUPBaw9IBg=;
	b=RpYb4Lp8qoNKLfHnleNU1yHm2j/JQXeLT7dhCvDY+SlfO7LQ6KtGUNjfSw0y7FXnpxzvjs
	l04liptKuwkABNo5EmLSMNbGITUFaxKVzxYC81NRdVaK1SBfx6FGRtB7GNIGuzafgJikqV
	Ntyg2HiE362ze/ZLXfXEtWFjwJZBJ6c=
X-MC-Unique: u_EAGbj1OrKxVgDgG071JA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oAxfRj8QT0FtEhQbUwzQ5e8g5yzvvczW9rz5bjwNpXR1j7Aqz+yZEH21V9fXYzKIRqwlSmRcVDXYBtn8KZE/qcL846klYsQWqzR2syFl9EihmSJEu481xJCqeseNpwzC3Rs5+/w3PKYwQt+yb+6OuGpUKXajGpAsoVBclyV5/RuD4aQpcjAcofsIM4GVQ40LTUM+dlRrlekQDUpXB4iScIFT3XjPWJ8VGzyBD3uSAB4gUDFFxWN6eVazdTtpX2VLvqWFMPXaffi89wIEIcuoGqzvXRG4TBsYgocKBf83fu3wJbAVMe4VMEbBG31oBTw8xGXnf5zp8OBSrppDz0cxVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoxhfr82Occigyy5m+24ZIHn+JCHCGZqZG110RjXNHE=;
 b=VYRrk4KnEnZmShOIwSslyqFpnBB41twvPgjFt2A3/w0plHzVX1sjd9bVIMojt0uBF1Z6kcQH1HY2AePtYx7ODKQwjShrFdpV8wCd6obDXRMzzaKfHscBUMtX5oD89uiaoE8NTBd2NqxVZu7wK6BXJQfzmxsXrI8VCAp7uuht561j/6YHeM7FON1ZlHURTRXzAUUyuTEv47Prp6O84jPBCyy3If92xqtOdcUm/jnUbdVuvB5yEwEaDA/MeS8GqFsokC/gNYs8FtqgiqxYaROlyE3cdj7RB1ZVdN1HEKwpQL8So4Ny22bNkH87CGDGV3GlTa1LA6CEV6xDWktw57vYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bb52891-08b1-eac7-7bee-7d6038d12e40@suse.com>
Date: Tue, 19 Apr 2022 12:54:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Cheyenne Wills <cheyenne.wills@gmail.com>, Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220419101850.3045-1-jgross@suse.com>
 <5c6f75d7-d5d1-856f-c8d0-da1bd823be63@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5c6f75d7-d5d1-856f-c8d0-da1bd823be63@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0050.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::7) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89c565dd-3936-49b3-09e5-08da21f2e891
X-MS-TrafficTypeDiagnostic: AM0PR04MB4097:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB40979764A227994051D6160EB3F29@AM0PR04MB4097.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MxaZKtp0qfohAZ/6RHivrWgCgrYFb0cd8pAeapDbhLnkPOnclm4hVRVB8V6KH9PpWL4v0r3WuPjH7t30ffls5nEFeEPg5kAnj52tdUOY2I4+iSYKnzKTxanzEaEA5pK+V/gXy6pWnex3th2P+K38LWiaQLIil4Dyr2GcpedEQYUAvfm8GZk8iyCqEpA4rulGQpJW+HjSUP6OUpItzwH6UcaAb3OIwd3pOWnstV0l9C9TPe1d1KetJrRCjt5HNXxgQ1H/4u8sDzoqLrkgm2gKomfQRm92ygPsqMaGvn6B/402pZ+aTCPaKO9JaysFl6PMO566AJCIRR5fybbTxUq2gduhKHKJau2VKVXRTXA2GWPf25skuo0vQsUJb4TNE45jc03ztIcJVtxBjdwfdgIjGOb8mSbWf/hkz6wUrGUU2cxkFa/LrA6rB1kxBCGytwtF46hjGSdZOaDSrjHxPNR4YpTsm0/pM7phNMkFiCiUQQxwyNlL78K4KAu+dw6mctKbKmXYEkjpWJnXnRoeWZWf+aGgCskhnJJEx+usv9prKsnewXSJ9f/t+PGVG6yWqyK+uO8iJBvSmzln2+gjPkeujuxe2UaniGiZBDhXFeBvMtSMLgNajG7Lk9LYH0yaUl+Vj2vWeKYH1j2S2wQMHeMEISkUTsna9z6fbVWajRKZNxfRjFJ1/xNrOrVixAG7mz9wqY61oiuYOU0IAF1h0p3n04zQui8kL9LYbp9/Aztysko=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(6512007)(186003)(4326008)(66946007)(8936002)(31686004)(36756003)(6486002)(2616005)(5660300002)(508600001)(2906002)(66556008)(54906003)(86362001)(66476007)(26005)(6916009)(31696002)(8676002)(6666004)(6506007)(316002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ez1iDW+3c04mYlXAZynjWwhSZO9ZMoHZvRz5T2EJrcM7VhCFY9Qd0WNYxcIn?=
 =?us-ascii?Q?X622+XW+EnVuS4kekmYCcawLZ9cPSTq5qcx5gTRdhSjD8OlZCsmILuwzwofH?=
 =?us-ascii?Q?t4v0ZTxQnfz3MYrrzGM+Q3bnlE7N/3MNTffw0ojUH+X/bvsv4f0DjM2Hq+wI?=
 =?us-ascii?Q?C4Raa0oZGlGhiHOx/9YiTWwxu7ubona0jV0QYDvaRZJwkxU2nt3r3nG6EcP9?=
 =?us-ascii?Q?OpLHsMDWOND8peNENQnHfLwthbfPqIGrxDPb2tlXfdv4+48y88DeMI/3lZrh?=
 =?us-ascii?Q?WdvRn0heODXHoBDh0tKotnDcS+Tbl1v68xvTrKqtJ7pozvwdgZXNYzN7XMG+?=
 =?us-ascii?Q?8umZ0+3eSfjQ2xVTmS+UvwATSMlX4HKRItYYkiVkXwlYgk1ekaWr2RwHxuQg?=
 =?us-ascii?Q?3DAuY04iFswlbs+9O3P18aLhb+hr32RC5CHZtdcUBtooSjSr22zCqFDn2s3W?=
 =?us-ascii?Q?6uKWiuaxkueGyf0EwadQ9jPSWIBvAvNh635sfGNruXFwpLTC9LxtYggWVjrq?=
 =?us-ascii?Q?0kr1eH7ZKDYX/PCoaLDPyGRj8AO2KD45axW5dM907Lk4dPSfGnIJ3qJh1V9A?=
 =?us-ascii?Q?1/aEH9K30VHkya5UUNbOjT4yuGS+KBVEo141F8RcFdbyQbP1V960BJ+IkEuT?=
 =?us-ascii?Q?5Rch/4qMRIEJTTQFDGiz4wDytzfFdTrqCJEwI40/EyxvDrDvleo6XNYuAAmk?=
 =?us-ascii?Q?6d0u9tLrh9l7SGf1U1B0X4HH89nGAodZDIKGXLMFdsEzVUm++io80DPwVR+t?=
 =?us-ascii?Q?zJBz5nBuiMbzt8cx2ACdqmb1Mks//vMJjGkbk/lk6cz2T0gdAdaHP/uEbzkj?=
 =?us-ascii?Q?D3Hrkt8StCezLk9QgJf1GstJvhxhageLiY6un7ywIPCqO2lodasFuZfqjPHS?=
 =?us-ascii?Q?dGk2OIsTEuhwyvX17kIZmYCHjCmkGMRfm1l6bMB2HXIP8fnHKPs9cpvg82cj?=
 =?us-ascii?Q?mwKsNe9Qjt7uaNkTqC6peQQuNorTHtbDLWb4JB3jiT0F+NXgKGZUAQCXb6MH?=
 =?us-ascii?Q?LuNdhglw2g2rp33gKFHljQ0ceJAbYV7xYxvO5Ja+RvfGGr5YrRziVXUNws75?=
 =?us-ascii?Q?VfXmEZ5ZkVK9ilBFbtCZKcpJg2g9x3ZW9wI9+bzF5aopH5EHReAmUQzOD+Ba?=
 =?us-ascii?Q?1BfnbtR8eT+JeuF7z0gJJenMmNyC1IEQWGskFQOs3dAl4ndjpgDBxj6SV4fe?=
 =?us-ascii?Q?NIqEnYZhwoTB+0ZVcTIqzbOl0XwHzvYwpvXu/uL4Ozhb7QbpAM7A5G5Bblw5?=
 =?us-ascii?Q?iSa9pMBl33ErHZxVQdYrc9GhIQccjqs883G6xtLl/wrLTHI05Vfy3UoNVZTD?=
 =?us-ascii?Q?+0GmVGaVIqPgFiKVt1C4wQZQl8uz0Aoa+Ok9C254PnCA5H7oHzLQCtHNUHDu?=
 =?us-ascii?Q?mWtBzgtMQmL5VbW0qEkRmM8Y790Va90Mso4nyJsc4MsjoqaPFEs3FiXPxq49?=
 =?us-ascii?Q?ghg6ITmpfSiuYqvjhOV/Ddw4e6fb3LJ/rh8kgTIcIgq+/UckvPRK6+c025/K?=
 =?us-ascii?Q?5mPpIGflUidF4L4M7j4Wo2KSJvYZ6cRwYDzwFu4HBjS1Pr8bQhAJBQm0SVmN?=
 =?us-ascii?Q?zs1WLI6OOgOcYeI43N4L8tdYStBJgXeahpIikcHl7rPZxgVNayOVPRZMG3E3?=
 =?us-ascii?Q?/qGg7N7PAnyJd0V8vaHj2+GT5k9PIk+16EoXkdz3Ky3KHPv9vrkvCRPwYXQj?=
 =?us-ascii?Q?gaXrKv77Eap28cEd4lJF+LBk79jcpplnAoruzSZWvnkAc9lQZq+wjAun44Jw?=
 =?us-ascii?Q?cW9zxdSVvw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c565dd-3936-49b3-09e5-08da21f2e891
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 10:53:59.5530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6vzw9LNMX3IC51cI8c6uDv4feFzDIPQznZZT1pGARjFRV89KgpvT3TYZxdH0V362N0GiRE+s2nbzYivmIpYFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4097

On 19.04.2022 12:40, Andrew Cooper wrote:
> On 19/04/2022 11:18, Juergen Gross wrote:
>> A hypervisor built without CONFIG_GDBSX will crash in case the
>> XEN_DOMCTL_gdbsx_guestmemio domctl is being called, as the call will
>> end up in iommu_do_domctl() with d =3D=3D NULL:
>>
>> (XEN) CPU:    6
>> (XEN) RIP:    e008:[<ffff82d040269984>] iommu_do_domctl+0x4/0x30
>> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
>> (XEN) rax: 00000000000003e8   rbx: ffff830856277ef8   rcx: ffff830856277=
fff
>> ...
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d040269984>] R iommu_do_domctl+0x4/0x30
>> (XEN)    [<ffff82d04035cd5f>] S arch_do_domctl+0x7f/0x2330
>> (XEN)    [<ffff82d040239e46>] S do_domctl+0xe56/0x1930
>> (XEN)    [<ffff82d040238ff0>] S do_domctl+0/0x1930
>> (XEN)    [<ffff82d0402f8c59>] S pv_hypercall+0x99/0x110
>> (XEN)    [<ffff82d0402f5161>] S arch/x86/pv/domain.c#_toggle_guest_pt+0x=
11/0x90
>> (XEN)    [<ffff82d040366288>] S lstar_enter+0x128/0x130
>> (XEN)
>> (XEN) Pagetable walk from 0000000000000144:
>> (XEN)  L4[0x000] =3D 0000000000000000 ffffffffffffffff
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 6:
>> (XEN) FATAL PAGE FAULT
>> (XEN) [error_code=3D0000]
>> (XEN) Faulting linear address: 0000000000000144
>>
>> Fix this issue by modifying the interface of gdbsx_guest_mem_io() to
>> take the already known domain pointer instead of the domid.
>=20
> There is some explanation missing here.=C2=A0 The adjustments you make ar=
e
> within CONFIG_GDBSX, with the exception of the final hunk.
>=20
>=20
> The actual bug is that non-IOMMU subops end up in iommu_do_domctl(), so
> while this is good cleanup to gdbsx_guest_mem_io() it, along with Jan's
> adjustment to iommu_do_domctl(), are not suitable fixes to the crash as
> reported.

Whether non-IOMMU subops ending up in iommu_do_domctl() is a bug is a
matter of the position you take: Considering how we chain common -> arch
-> IOMMU domctls, this can also be viewed as intentional, with further
chaining going to be added anywhere in this set. The downside of your
approach (which otherwise I think would have been the way to go already
when the IOMMU domctls gained their own function) is that at least one
higher layer will need to know which specific sub-ops the function is
going to handle. If that was acceptable, I'd then question whether the
top layer shouldn't also know which sub-ops the per-arch functions are
going to handle.

Jan


