Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200502446CA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 11:12:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6VkB-0000Q1-40; Fri, 14 Aug 2020 09:11:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruf4=BY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1k6Vk8-0000Pw-Ri
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 09:11:21 +0000
X-Inumbo-ID: 4f3bc007-c53a-4a68-ac67-fb318048aa73
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f3bc007-c53a-4a68-ac67-fb318048aa73;
 Fri, 14 Aug 2020 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+8hID+kPTdDt1gEgtbcPpMjapDXWia7Pu06s3YalFw=;
 b=05RJDpSWWJdbFl6OJqO+5SiwwuV3edBrszFRlV6xiBW1D3mHcz0+PgzMg5KHljWzg1bRbQcH8oDutq8zB0+dG+GIlE8h0IPiJboe250PbiJNgRCFG/YxhJwjcIvOzL3q4yE2R5CZD3UJOV+J+koQBxHKPVk8ra95JnMH2Bn8hGk=
Received: from AM5PR0202CA0017.eurprd02.prod.outlook.com
 (2603:10a6:203:69::27) by DB6PR08MB2645.eurprd08.prod.outlook.com
 (2603:10a6:6:24::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 14 Aug
 2020 09:11:15 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::78) by AM5PR0202CA0017.outlook.office365.com
 (2603:10a6:203:69::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend
 Transport; Fri, 14 Aug 2020 09:11:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 09:11:15 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64");
 Fri, 14 Aug 2020 09:11:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 850448b57313003e
X-CR-MTA-TID: 64aa7808
Received: from eaa76e93fa40.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2E502C63-925D-4E1E-80C4-14295A1E3F86.1; 
 Fri, 14 Aug 2020 09:11:09 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eaa76e93fa40.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Aug 2020 09:11:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElkPw38ZQoxVg+XJLl8xKUI2aEBxLBskP37nMtZw1Ij/QNjDN4Kbgsv2Kv807lX6ipW+8QPiIl08NHEg7TFwIff4jRHyJ5HIfrA0onK26OgZRLGgc2xGPswVyNJeZdb5t3UIgC78cmav/OmOrS6dZYFk4gecsE4Qw4hpCLoq+O0LnScyud3z3gHz+7XlTU19L7itxr9yaZsqVmCZkUXpijMFylIohAnZDDwRTmulkABaDRqyrYI1RxiEUHKdFiabB71cVzpBD4HWIiS3wEKyA5EtwsrZAxb23UeYan7355vlnpHyVAmdTbA7Hq4sYb/5JUuPIoLfrYCjEoYchPYWmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+8hID+kPTdDt1gEgtbcPpMjapDXWia7Pu06s3YalFw=;
 b=dJMKTsRUOeH4X0/fhlS8V2sLchBYaU3APh3yFLUncxMvdMaRh883U/zoSuw46weyuXe+iZPhXIioPvdijI9BBjCg8yLr9IpPLhYgmFZJlHy57URkcnd1bI8I5uEX4j+HhiPJYzfVAK5h056DPiLoZ5GYSk8QDyF1vBtuOEp/0GRn/veClrhDNEEbjZL8LQqQ817YWnUGtv38npk/+ZR+nXm2Wy7vbITc+THxHURvooeBhlQOr+nrdIoInMOqGhJWHY1muZbV26tOp6aI3cgQe6xIiCZdqIRvx+BB48dzU06PYxvo0+gbenl0fqWH75aSUBSbLzbx3gJer+3cXH20Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+8hID+kPTdDt1gEgtbcPpMjapDXWia7Pu06s3YalFw=;
 b=05RJDpSWWJdbFl6OJqO+5SiwwuV3edBrszFRlV6xiBW1D3mHcz0+PgzMg5KHljWzg1bRbQcH8oDutq8zB0+dG+GIlE8h0IPiJboe250PbiJNgRCFG/YxhJwjcIvOzL3q4yE2R5CZD3UJOV+J+koQBxHKPVk8ra95JnMH2Bn8hGk=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2696.eurprd08.prod.outlook.com (2603:10a6:6:25::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Fri, 14 Aug
 2020 09:11:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3261.026; Fri, 14 Aug 2020
 09:11:08 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
 <wl@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] xen/arm: Convert runstate address during hypcall
Thread-Topic: [PATCH v3] xen/arm: Convert runstate address during hypcall
Thread-Index: AQHWZluWPRKsKyuZRkCQVDwO60tsvakgmVkAgAETfwCAFLS9gIABB2OA
Date: Fri, 14 Aug 2020 09:11:08 +0000
Message-ID: <E440A90F-747C-4245-A053-AA2AEB4C6400@arm.com>
References: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
 <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
 <DF7D0DF3-F494-4F1B-9877-E7B2A8BAAC3B@arm.com>
 <a41e7c14-52e0-d1e4-6ff5-6ca806ff2d03@xen.org>
In-Reply-To: <a41e7c14-52e0-d1e4-6ff5-6ca806ff2d03@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a7b71694-9d7d-46e2-9973-08d84031ff3e
x-ms-traffictypediagnostic: DB6PR08MB2696:|DB6PR08MB2645:
X-Microsoft-Antispam-PRVS: <DB6PR08MB2645800393CE222FCCC5DCDD9D400@DB6PR08MB2645.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: EttmIT7M0WF+R/G0Bc5ZD6Lws00JdqPMHdrmQBv9sMpcfb4lvm7Bg+cZFy+vWKMJUI8hNKHdgXkniFjJbZ9MhJBTmDmi2OcpH6EUv5LULdB96y2vTy6IIcBLwSPLt4kDZu4ozFZU/8Z3z0VGIO5EEsXCEAVXdfxyN8CvaP7zzr1FsKRCAJpJKfec9f34FRtLucQDHwe5lVzoW1QXHn4SAh6q7zQgAaUpwIyek75PMRwapk9XvAhgLRLL9hZLHMr64T4AWGNFRj+Fy8S9vZKBwKntbSTQdhQJF7vRYZ/pkFWCyoNzVpIvadqhpa6gCLFUl129F/m6DxB+FmxGNe87bQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(4326008)(6486002)(83380400001)(26005)(2906002)(86362001)(66946007)(76116006)(66446008)(36756003)(2616005)(64756008)(66476007)(66556008)(6916009)(5660300002)(6512007)(186003)(8936002)(91956017)(71200400001)(8676002)(53546011)(33656002)(316002)(54906003)(7416002)(478600001)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: l7RWCFnKvuGlhRmXgN69gOcib6qOAvcDrQXPBsJzWQ4u5Wh4sumS5bVjU+nhIR+Bisb8hHzPx5mG7Ip5BSk1xsKKu5uos2EcV5mMk9nLBmlEO1pBdTMVJ45lEkWFeLa/PUxkg+ns5v3s5u4ettbplGBuZMdSiFO1RXP6WFPIpIc/lC+TsYiFs2pyAnoklNXiz2wTR9ZTulnQVS1bZN4i1pF6VM+l2H+JGw5igkLixzhhdm3zYyZzWSeiH87BuO1UOefudhbqtV6qR+1fh5dgDwK0bYmcYKQxMvalP2Ne/O+1YNZnzQCN43rcSsgqbJzUCnouqBhwghAQ1rQ2zgF8B2PmBbrwLUZDj2o6/02pCkI64g6O/95qi6QYE8CdAnG6xzqiXtEtTTfLXh3ttM7vVUjpaxg7gcWKttB8tx0uSpFGLOZ7elYc/GiqAE3l7qe1uqLWzXfipZgVB/pl5Esi+0iczlAtEgH+rmZwyWua9gIf0UmiCQApKQt5xcT/88KHeTOE/Wgpo/KBOZIPFE6hz27qW7StZLZS+t9l/UQfK1cjhK7vUJTeazdh9qQI+I1EOxnGrWPdnChLlpTgCjQLGvRqtWFWoRDn8McwJr1UGjtupilA6v/qjXXe4DcvRFxt3gANMA68fRzVH9LpgMf+VA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B6BD810CB86EDF4FA2C592AF8A40DA03@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2696
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0f5da513-ed23-42a8-2ca2-08d84031fb06
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7aDc5ZKqKvEwZlsjV1J7RjzJJlNUhWmu+hlrxzXr+DyPBhxTkztJNwXyLnlCPUXyh4n/LFtniIew299aWxmIYIRwKlcOvqZI7i8Uj6TCiTP+RQv5OOChQfV1g1XYgO2n+cThvVYzgB+DnfUm3R70W5Y6hq4eDn6S6G8YTlGM4fkLOZkotYSWj0mUVUw+R7N7v6uRhbIa0HvwvF39SxTzmJjvnMPXlhZ6oAMcQcD2p/OIuKqQGvgGLGVAhLD+oaQUUIawlsMjRR/7yVmPKd++uQsdumtf/+Mxz64IhortK1dJYX5P1kT7ZPP7tW4YJYyAUB9YFjzKIYCi2+sVDO4Jfpe2AlW4lTeRdaB3GTofrpRMdo70c5xlgD288Qc2sn4DIkRbX8fhGLdC6PYe312cMw==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966005)(82310400002)(47076004)(5660300002)(4326008)(33656002)(36906005)(82740400003)(356005)(6486002)(6862004)(70586007)(316002)(54906003)(81166007)(2616005)(2906002)(36756003)(478600001)(6506007)(186003)(70206006)(53546011)(336012)(83380400001)(26005)(8936002)(86362001)(107886003)(8676002)(6512007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 09:11:15.1663 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b71694-9d7d-46e2-9973-08d84031ff3e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2645
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 13 Aug 2020, at 18:28, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 31/07/2020 14:16, Bertrand Marquis wrote:
>>> On 30 Jul 2020, at 22:50, Julien Grall <julien@xen.org> wrote:
>>> On 30/07/2020 11:24, Bertrand Marquis wrote:
>>>> At the moment on Arm, a Linux guest running with KTPI enabled will
>>>> cause the following error when a context switch happens in user mode:
>>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd=
0
>>>> The error is caused by the virtual address for the runstate area
>>>> registered by the guest only being accessible when the guest is runnin=
g
>>>> in kernel space when KPTI is enabled.
>>>> To solve this issue, this patch is doing the translation from virtual
>>>> address to physical address during the hypercall and mapping the
>>>> required pages using vmap. This is removing the conversion from virtua=
l
>>>> to physical address during the context switch which is solving the
>>>> problem with KPTI.
>>>=20
>>> To echo what Jan said on the previous version, this is a change in a st=
able ABI and therefore may break existing guest. FAOD, I agree in principle=
 with the idea. However, we want to explain why breaking the ABI is the *on=
ly* viable solution.
>>>=20
>>> From my understanding, it is not possible to fix without an ABI breakag=
e because the hypervisor doesn't know when the guest will switch back from =
userspace to kernel space. The risk is the information provided by the runs=
tate wouldn't contain accurate information and could affect how the guest h=
andle stolen time.
>>>=20
>>> Additionally there are a few issues with the current interface:
>>>   1) It is assuming the virtual address cannot be re-used by the usersp=
ace. Thanksfully Linux have a split address space. But this may change with=
 KPTI in place.
>>>   2) When update the page-tables, the guest has to go through an invali=
d mapping. So the translation may fail at any point.
>>>=20
>>> IOW, the existing interface can lead to random memory corruption and in=
acurracy of the stolen time.
>> I agree but i am not sure what you want me to do here.
>> Should i add more details in the commit message ?
>>>=20
>>>> This is done only on arm architecture, the behaviour on x86 is not
>>>> modified by this patch and the address conversion is done as before
>>>> during each context switch.
>>>> This is introducing several limitations in comparison to the previous
>>>> behaviour (on arm only):
>>>> - if the guest is remapping the area at a different physical address X=
en
>>>> will continue to update the area at the previous physical address. As
>>>> the area is in kernel space and usually defined as a global variable t=
his
>>>> is something which is believed not to happen. If this is required by a
>>>> guest, it will have to call the hypercall with the new area (even if i=
t
>>>> is at the same virtual address).
>>>> - the area needs to be mapped during the hypercall. For the same reaso=
ns
>>>> as for the previous case, even if the area is registered for a differe=
nt
>>>> vcpu. It is believed that registering an area using a virtual address
>>>> unmapped is not something done.
>>>=20
>>> This is not clear whether the virtual address refer to the current vCPU=
 or the vCPU you register the runstate for. From the past discussion, I thi=
nk you refer to the former. It would be good to clarify.
>> Ok i will try to clarify.
>>>=20
>>> Additionally, all the new restrictions should be documented in the publ=
ic interface. So an OS developper can find the differences between the arch=
itectures.
>>>=20
>>> To answer Jan's concern, we certainly don't know all the guest OSes exi=
sting, however we also need to balance the benefit for a large majority of =
the users.
>>>=20
>>> From previous discussion, the current approach was deemed to be accepta=
ble on Arm and, AFAICT, also x86 (see [1]).
>>>=20
>>> TBH, I would rather see the approach to be common. For that, we would a=
n agreement from Andrew and Jan in the approach here. Meanwhile, I think th=
is is the best approach to address the concern from Arm users.
>> From this I get that you want me to document the specific behaviour on A=
rm on the public header describing the hypercall, right ?
>=20
> Yes please. The public header is usually where an OS developper will look=
 for details. Although, at the moment, the documentation is not very great =
as you often have to dig in Xen code to understand how it is meant to work =
:(. But we are trying to improve that.

Ok i will add some comments in the header.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


