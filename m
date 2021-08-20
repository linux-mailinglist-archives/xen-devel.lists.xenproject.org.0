Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E203F2B95
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 13:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169465.309578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH36N-00070h-EU; Fri, 20 Aug 2021 11:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169465.309578; Fri, 20 Aug 2021 11:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH36N-0006y1-9z; Fri, 20 Aug 2021 11:54:23 +0000
Received: by outflank-mailman (input) for mailman id 169465;
 Fri, 20 Aug 2021 11:54:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mH36L-0006q1-ST
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 11:54:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58b2bcc8-01ad-11ec-a6a2-12813bfff9fa;
 Fri, 20 Aug 2021 11:54:17 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-8h6h11nxPn-sd8JxaEAh4Q-1; Fri, 20 Aug 2021 13:54:15 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6863.eurprd04.prod.outlook.com (2603:10a6:803:12f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 11:54:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 11:54:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR08CA0036.eurprd08.prod.outlook.com (2603:10a6:208:d2::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 11:54:14 +0000
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
X-Inumbo-ID: 58b2bcc8-01ad-11ec-a6a2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629460456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kN5vKdCl3WyiWaRzFLkkO3X1ym2mAHBqRSRCmjDkfB4=;
	b=AugmjCDkowrwCtnB61jvQOMKc0lcZ4LRfmswi36cm+lmCsOoELR3xI5AwbnaBCytdUiBj7
	zFOBKWHISmN9OGgtnlvED27MnIi4KbJgh2DlxTJ42LZSmKL+va8BFS0jHy7s4/YRevl1u8
	iu+ebr12UOhzuUWAOFzYuaLGRczzCHE=
X-MC-Unique: 8h6h11nxPn-sd8JxaEAh4Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeGrBNO4JUsGshkMO4OLeDh4bA6Jhp1Np8DL1/gKv0p56RnDlkXdrOFYhsd0pa3uVn+yKekuadEMwzZyonq7SOMVf2xKwfIo1uodORqR+lFbcxefkLuWAXADB9Va8QHLUyWtgh34hISnLhCycVHzlWltbVkSXMh2lC8rCUGfd1e7w1D02GtE+PJf/pS76BAJVgdfkjW2u3lFbYSf7PHJCCSVG8ntWMYrmFi5IWtUnAlzeIxjV/0j+p7YkJViX8iM7wbTtWOy/+AwNvjb6ietyHPrAWf+81CdDZjeibgO45kfMWtFJDlKGypVkx4Yvvq3LyGB3seIy8s/2djRAMdB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8llChDX0beL1a49RdUUuRG/UdkGSb3s2buSNQrdoVg=;
 b=CaaWllUVpYwHgmCaAmSfpuHTc3prqcCnlHe2ZynVFZDA2IeJcwmlmo8fYxffL3AWRl2Pc6wm7vwrC7BQVnGdHLylYtEx+U68jbO7ToiApSC4t4Lw648a3K8iHk3zllYoHO3/iUVZXRo1p41jlbGTuYNTt/WPBDKVoDzrT/fFzjCmhgXRmw6CPBXRCxZiw9xvkOhS+kvcL0dI6xt8fz/zyjbG57asfc2XXqRoTHCd+4pTX4tBYqTvL1kd5HdJDFpXmdKlxwPAScD1uIiA5x3oBueTGeYyEyu3JEcePVgWW8nH8Ni6Jt3okNy+JF3rYUadb4kMeNPqhVZH/cA0vbsB2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1 03/14] xen/pci: solve compilation error on ARM with
 ACPI && HAS_PCI
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <97d39d3ee398d6018bdcaf745f00d039df6a92ef.1629366665.git.rahul.singh@arm.com>
 <5fad114f-06c4-120e-0a48-da7045fb85c5@suse.com>
 <76520AA8-D02C-4207-A722-33D935E76776@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a8982dae-0928-3230-f10d-ada277bc8397@suse.com>
Date: Fri, 20 Aug 2021 13:54:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <76520AA8-D02C-4207-A722-33D935E76776@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR08CA0036.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78a221fc-c6ef-4741-b36d-08d963d13b53
X-MS-TrafficTypeDiagnostic: VI1PR04MB6863:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686312D87296597DECE1B745B3C19@VI1PR04MB6863.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jZe7CIikNjp56IViBDv5jDGfMs5toJjL6i0bashp7dwEoG2YSfK7d7XP3RZtzuFFHIqdl4lwmTOJu/Ea8aBa1qzYiR+6OdU55y+RS+itQodYgO7eLfolf8+JJ4SxgCnn+4GdTaYnEqGXXnTesh+6MRsLalMNsARAvN5ESdFjjbqe2Lf3FSNGOLFTVRz+QSuOGkjASHcgiVNyT252jZF3C3NEh7hauUYetKvjQtJGLaSeCgDo8g5Kxmil5wqRXsjUlJi/tlF+yA988oVoA8Bmj3NZPT/52fi4rwNdDN04m0LfBpdrtOO7WMAoiJd2LzDnn7tdyLnMfVG8THHUpwdR+eqH2OIeZsXS3R8OQFggHj9sqZJaO49+OdBiOPt/JKP9kd+u1z2Ug5d5Y8pN4IAYN+VH0WHEwemQUjT3ZpQCWAkE296p6KEO/KDFMDlg+C1G1GwIk6j0TFcwy153aZctA9r1KHVNVXEwj2ALHK/6eHN3lJbpZ+YFl+yCWhvwTBxigLgyHgOaU+ABPNVtGisRoJj6WKpBwW+3C4DC3hcEo+In9OOfJYUfE+V/pWhm4VnSml6gKOpxMY9ZqKpSIJE6V5gv6kbiCl12u80kQ2N7WCkRAryU7nshJzNDPvz6GS1nDdk7KYwmktdvuTL7zjpqcl1hla58u4DM3Ag6+TPw9GTIT9qvO2hRx+PFAP/9kenXOcmwCaE/f5EAXrBx1/1Hk1QGfPIYXQ/febdoWLEfjys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(396003)(39840400004)(136003)(6916009)(5660300002)(956004)(38100700002)(31686004)(316002)(86362001)(83380400001)(2616005)(8936002)(66946007)(8676002)(31696002)(66476007)(53546011)(186003)(26005)(66556008)(36756003)(4326008)(54906003)(16576012)(478600001)(6666004)(2906002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qalyfjEbSF0J5UFF0hr92rbHyTUd84cmK9OVTaTTLxGhP+SKv1nynLu+W/Ov?=
 =?us-ascii?Q?p9WYleLsItJWMAnVF0Rp/nOOYLCEnRacQhJ6ZlZkYDsoW0Hp2oXs+GVJhgvz?=
 =?us-ascii?Q?PupamSZ4B1paavhyXnc5nupbnURNewQhD+r6nEewvfsbbaMbJTnSHXRr38Ya?=
 =?us-ascii?Q?O081BeGA8cqKtRcrTnqa4zZwildfzTCJrG4SLYGoeMoiMN9A9io9O0+sStSe?=
 =?us-ascii?Q?ymcWsT7uJAayGJE7ihTy+kfoQgyITHZSsXpKuNSxbMZMpMpXVRVQi7aesHpf?=
 =?us-ascii?Q?N7rCYcCstO8z3uIaQgz9ZrdKZS50pQVP8vp98ShMeb/UBwU1SgihZh23G9EM?=
 =?us-ascii?Q?R96zVOMYlYVfDrr5kNWOu4OqWTOM1QkeDGAsYbFhzPKYsoKaFlXGSascmgmE?=
 =?us-ascii?Q?vsWH3acPt1vdPij1aJYJD0YPMGQBI1XyWJZhCrlZvAw1qjMzldPyzOBsy6ly?=
 =?us-ascii?Q?JyaO0tV0C+c3sMvbuZOcCgh+pwWnsZ83eBSbvsfn95bilr5KC8VCJK/ckYJo?=
 =?us-ascii?Q?jGw1f2JZi5r2NKi7AKjSeQfqfJLQbIltSD4odaKMX/LmYijcMfev2vZK8Rkg?=
 =?us-ascii?Q?FtkwAZ4g8fY0S783/C7lzPoh8ReozxzspuCuWQgOonj2jkZuWtg3JrI1LnLU?=
 =?us-ascii?Q?x5mJIzAELJkghJ2A3j4hrRf3QXPcajoHYVVHTnAzsS1+MQ2jQ62QG3c6kRFE?=
 =?us-ascii?Q?Yv0cEOHye8GGihPGsEq2gx6wppGS4rvjPL90/XU9SmpcdXcqCHsMff9hx0ou?=
 =?us-ascii?Q?IrywI2FdeDOQJmGKIWFt5Nw1ll3DGwNde8Oe+KZ0v46/ZI9DrexqiIhEAPUh?=
 =?us-ascii?Q?nnQqk1hvPAmle9dGZ2yXmCJs/VKhNLAI2tJmSnkcgmQ5AmwxS17e2avB7sR6?=
 =?us-ascii?Q?l5ByRupPuO9fYQQE6N7WYavP/w3QJ0KBcslKLTLRVRQBxxDRgte1++Ly7ZRt?=
 =?us-ascii?Q?IeTEMAqJeySxe1OjbuYUo7elus4DNF9mSnRiBOzy+WXy8uTFCkJeK4qWZOfd?=
 =?us-ascii?Q?tUqIMtzfvh/YGmT0j1EiW/Ur/oT45OkpubHx0GGYlNR3WZYEWNeAX5CzO+TX?=
 =?us-ascii?Q?z9a8jB02UyGDJjvuBDlma3jokJxuhrIigvBynvDmIR9GPN9YddO43MPNi0DG?=
 =?us-ascii?Q?6HgC/AoBrLDoiXqTKXFPNyPntI9Yt5jx7HZh2BkjRrNqokFWubrmu9lJZrv8?=
 =?us-ascii?Q?+ZKebwvAR40BrH6acff75thPvw7Lb42tWWbHqjOaib650oPe6fv8ki9Qr0kC?=
 =?us-ascii?Q?ygBC1o7fnn1G111jvRlczoX1XdzlGx0/QATC3rMYE+lO6up81VUJAZNk9sz3?=
 =?us-ascii?Q?2aKS5fCzqNcEYcREdwICndNl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a221fc-c6ef-4741-b36d-08d963d13b53
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 11:54:14.5211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlKDiX9Vl5Yj/31Ap26IHIevrorPtlPFk3CqICZLTuaVlAp0Y//za4e42HOQqvfhnKOTUWni66Z0OlT8Dg/E4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6863

On 20.08.2021 13:41, Rahul Singh wrote:
> Hi Jan
>=20
>> On 20 Aug 2021, at 8:06 am, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.08.2021 14:02, Rahul Singh wrote:
>>> Compilation error is observed when ACPI and HAS_PCI is enabled for ARM
>>> architecture. Move the code under CONFIG_X86 flag to gate the code for
>>> ARM.
>>
>> Please give at least one example of what it is that fails to compile.
>> What an appropriate action is depends on the nature of the error(s),
>> and from looking at the enclosed code I cannot easily see what it
>> might be that breaks for Arm.
>=20
> I am observing below error when enabled ACPI && HAS_PCI for ARM.
>=20
> prelink.o: In function `pcie_aer_get_firmware_first=E2=80=99:
> /xen/drivers/passthrough/pci.c:1251: undefined reference to `apei_hest_pa=
rse'
> aarch64-linux-gnu-ld: /home/rahsin01/work/xen/pci-passthrough-upstream/xe=
n/xen/.xen-syms.0: hidden symbol `apei_hest_parse' isn't defined
>=20
> I found that apei/ is only enabled for x86 and pcie_aer_get_firmware_firs=
t() is only called from x86 code.
> obj-$(CONFIG_X86) +=3D apei/
>=20
> I am not sure whether we need this code for ARM architecture=20
> that is why I gate the code for ARM via CONFIG_X86

So you Arm folks will probably want to settle on that aspect first. What
is wanted to keep things building depends on that.

Jan


