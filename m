Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF6C8BE52
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 21:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173373.1498424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOMMU-0000GT-O7; Wed, 26 Nov 2025 20:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173373.1498424; Wed, 26 Nov 2025 20:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOMMU-0000FG-Ku; Wed, 26 Nov 2025 20:43:38 +0000
Received: by outflank-mailman (input) for mailman id 1173373;
 Wed, 26 Nov 2025 20:43:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GqHT=6C=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vOMMT-0000FA-ND
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 20:43:37 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94bb1e56-cb08-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 21:43:36 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by AS8PR03MB9365.eurprd03.prod.outlook.com (2603:10a6:20b:57d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 20:43:34 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 20:43:34 +0000
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
X-Inumbo-ID: 94bb1e56-cb08-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ydgu9tX5vlM1Gpi3C/XI1ACsooiwI36O4ePvDOaOc1Ei9Mqv3VDPxCCAkdEL81o647TOUQtHjlyLxUlobNRkIgQj/MitWZe/TtB48r6scDHFR6bKRJFyv0rjxBJN90oH+WlmVsBd9e/981RN6Xq5QJLIZCt5Sr3x/vu5JcecIYLOfdSZ3qIkL/qEBT8ElBweoWQjZMi0NATV/kwpZJ8DPR+gaidp3aVnGAPXYsW8N+LbFaMPBB6VRzB+73WMoZIardB5ZY6f0crpNh6T+9PiyGdAsEMHIrCqYG0Ge2d53oJlKyvSFg8S7TjLyiZ+irBNKNRlWWcpm0NFSvRy7To9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBEEGLxxDOMI53usn298E14bczWJBowDg6S13fKQHeU=;
 b=pRG6+QyxdRyUBUQD+KkA4ottXdAdsQlm/8gq3/gM8fGJcFm0uyAQisv4HLWDrHCiyKRWa1GJ7xDPAOPuFqA9s9S8+7FS1svD3UkIeUN6NQnKM0h8+p186TlYi3bhuU5sDW4pRaeEydZQvu77Z/sju14CPeBB4GhFdoJe7/aykvFGPr/Rzxz0TuRYwKApA0T02pjD+0qzb4VzFdsFB/6q2K7NAr9U8vebAX4yUJWKuY9WvJB9nKczBk4gTwz3dKxhv617DlLd2lDMYA5TPwmIRB7s3oBOazguQzx16/usa2Kt75u5RVs45Aq7ik+AZUeH89O7uixQiseJsVdepERHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBEEGLxxDOMI53usn298E14bczWJBowDg6S13fKQHeU=;
 b=TY4CvBXHX+GNZMA5AbknrH3J8pT6tiUqsagsg38FBlWk6cXUj6rJ58YzA0/xIIwZZ6vCyzn3HabJte37I1g28iWHPmVkSesDzkRATG7L/jLYGOy8W+3e7C8yLkThR24aIH8rTQM4cLMX1rzItA2WkVaoSRwlPX+wucuvqzO2FsvmF1AHT5JymblWUcT92m3JQHwNu2fmY1Ca7QPeKR//LnIPWkoxNXbGT6FWxajaqqgGKLTCccTvbR0dh212q7JpUcQFKP8rXATL5VeGT7c7iRu5tkD60mCZuSNWaie2v41GCJ3gkjSTTd45ZBrNyGqSwL0AJIkSrFmcGfoTZ3w+wA==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: [XEN][PATCH] xen/x86: move d->arch.physaddr_bitsize field handling to
 pv32
Thread-Topic: [XEN][PATCH] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
Thread-Index: AQHcXxVULfwllMsejk6EF7IYoXzQ/g==
Date: Wed, 26 Nov 2025 20:43:33 +0000
Message-ID: <20251126204331.3395888-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB4600:EE_|AS8PR03MB9365:EE_
x-ms-office365-filtering-correlation-id: 00b29634-d351-48d3-d61d-08de2d2c777f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?U4ewCBKz6y/YgfyVTcKLDRPRDwY+5GcNXGjtnLxiR65HKB3pLWcsEe4GD9?=
 =?iso-8859-1?Q?nRGh9RANG+PGQ0B5VJI95aEP9B24jWRB1CVRH7Tp/idpCsfEeQt+jjrJG6?=
 =?iso-8859-1?Q?2uZIKqSJWpExw+wjxPJi/mZEwklCpy39WfiRzF61Yg1MKhrjCvYZ4IuFRS?=
 =?iso-8859-1?Q?hHWpR6wz2y+/d2rire8VVl2jr+ZbewMNYgkOAhQQ9xG33gWEUm2KJJm+hv?=
 =?iso-8859-1?Q?ho7bP20fT+lT0BL6mnWyoSgbfDYNy5+wyD6k3tVf9IFMzQDqy275yL7kWJ?=
 =?iso-8859-1?Q?VHJyXAtMH+FWQAAGERzNqPtkQYmM6qkEp/Hhg6Chj8+DRDEBsb3hIPVMoo?=
 =?iso-8859-1?Q?cLjusD8VoIzHj4LgqkN+pPjcH+ZemIcDXi99MMcDtncGZGaxzkzXyw9b3I?=
 =?iso-8859-1?Q?fr0KjeEKD/vsrZSvgaPZ7NqBL7FEvONABhk6mG9JAaZOUa7ycXYG3R/hhy?=
 =?iso-8859-1?Q?j59BK848QCXyqheP28wBYiCNgat1MfIs7FsHya3AixaHUhyozaEMJzv9Qm?=
 =?iso-8859-1?Q?KRL5ikNGcKHpaWhFP9crj1/nizVedv5Lyra+OuUMZqvw6ftzqHhBf9iJVz?=
 =?iso-8859-1?Q?CMdAqVt3ZbWv5FlqFqpY2T/VmsvktMSHi7T+Vm9WVTKzYqp9/pc9QBQ2eS?=
 =?iso-8859-1?Q?SA0Ozy0aH4QzHYtYcNF93+duCuJA27h5XFKMld0mGn5Fg3ClsN9zTsDFye?=
 =?iso-8859-1?Q?KtRmbqUBowAHADWC9cgK9UUyQaBc+wisxtN3VzHhf8mPvUWb0GvHKbGSrn?=
 =?iso-8859-1?Q?efAWp9kx78z8Ag5m6YyFpO/ocWJ9SHBvZkipMmbnljcQD7mJroK6vmckpI?=
 =?iso-8859-1?Q?zdCdpHbqv6LprgNyS6Uw4nfmmxkJRTSQPsiTO5C4q5fwFC9oThJftwDpNi?=
 =?iso-8859-1?Q?lxd4T0db1WEk+J+hQCuHIi1EnbIehP9fP1+l5Svgbb2qOZ5DJaGJxy01J7?=
 =?iso-8859-1?Q?8KUZR5qwnEFIpXzaGoA+BgMIpyugXT8zxHMaD0MAXTvc1F7lBuZqb2Nf1l?=
 =?iso-8859-1?Q?1RTZl8uSekOi/urQim2sgfACT4t0uVMxA1rrTBuW8ag+2JzyjQ+tCuzRJz?=
 =?iso-8859-1?Q?VrzY9UwnbQCEvW5Cv+pZQHjRsWMx8PeLXcX2bvWm3AT5BLEPKOqpPCgA1U?=
 =?iso-8859-1?Q?wUTwu6x4Vgu+cSL/0ZzYedddAuHUaojOeGkr6nfHOUsirsIzbG1pSn+to3?=
 =?iso-8859-1?Q?nBnXKsdfZKALTBG7zCOp/pxGwx/2AG/Hw0LRngHoyXnAhuasqgfAKtiKoL?=
 =?iso-8859-1?Q?l/NS9NKT4MUdmnF4LMTlTY+U7T0r3tbz50D8/VnlAsV/iAARSUkhdyednd?=
 =?iso-8859-1?Q?ZweKuziKJJ+kXPFx6JNnJu2WJy6a0DApZi7qxKNu826C1LNe0X5cTKdHXr?=
 =?iso-8859-1?Q?GiVE31Ep99qBATs0JCn5MS6a8cc8ghe5W5s8zFxfKV2lWeptbNJz7mPNnc?=
 =?iso-8859-1?Q?4DvhVhdb8VS2B0mKM1tJ263PhHKLtnxKH+vm041hsuygwIet19zBuwQ/Bi?=
 =?iso-8859-1?Q?c6uHiGocPeeCwQNN9Sv1P1PRPwDSXTGdgZsc0RXYI8T3t92/Sk+JdvS/lC?=
 =?iso-8859-1?Q?ZLWExkp4NHfMXuAEltav3MlaQPVb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?F6n7XP6TJ4+9qzDVd/ksst2uNfHCCirdJxpkf8j3vGjWpZqS1XUs8AnQOg?=
 =?iso-8859-1?Q?DT39qVYmFr52E5xg4NONnznhXaTM4Ck89CQBlgTSzdn39voK+TewCtPEQh?=
 =?iso-8859-1?Q?h3hz+Q5fpukBaepJN46xTqrncmQTpt5t6xqqjHkJ6nnj48ZZNFnLBh06Fw?=
 =?iso-8859-1?Q?aNj3n8F6AJ3xJnI98lReHLru9OWixgCi8uS5MYK2lX86yHiBHVrHELx5hT?=
 =?iso-8859-1?Q?UgJ7L7t8Kus/tlWxKpio6F4zDQ4UVqAHcOiM+vRNv8lv6yKUnUZIcCmg6V?=
 =?iso-8859-1?Q?9nD1e6Jw+20AdcHTXcfTJTWKuem4WG6FnAKeBniYLl0rYQv0dTuDj+dNvz?=
 =?iso-8859-1?Q?2KW7CkRqBRsJLb/MJrOM1CrkUeJEo6yjm/HC0qIfN0O8klzlsTxJ+tGcjl?=
 =?iso-8859-1?Q?Gm05m5beCGvOcf1Cpzo3gr1iafzUG+qa40MtenowbjkN5sCKatSmH9CyDU?=
 =?iso-8859-1?Q?mh9ma/4aW6blex9s5nejqYmwyFQFJYL9W6B7EvZdtC2C7H9C8A37Mdva4S?=
 =?iso-8859-1?Q?0BNgMjNmAmfefBNlEjUiwJXSIAhHJCYOwI2XiggFiO8BlzNYLJohye1MSN?=
 =?iso-8859-1?Q?9t4u1sRgyEfewfohBedP79QF1Tqkrc7gkOZTLB1BwO3KZTsYh5pcv5+N2C?=
 =?iso-8859-1?Q?MZyad8QD9YERf0a5XfZiMef2w+LnEkUw/epbsz1yq7qYEw4/nYH462T7bV?=
 =?iso-8859-1?Q?37VE0gUdOK9XJY1+79Az9CmpVbK4RZd2kRDwoaD9ZRlkw2hNZ4pdE3BHhk?=
 =?iso-8859-1?Q?K9fIJVt5xENp7Pz5wzL0Sc1Xc62Ka8y29OadwsRYoOXBNA2141hMWqfopa?=
 =?iso-8859-1?Q?lGczc5pujkwfVhOrVKQsRLP3xiL1xVzdJLXfNgL8c1aQlFWWErcKhRwARk?=
 =?iso-8859-1?Q?5J6GhhV6opv+SuY0EtAZ325dZI025a+XomDo82ePOfqFEp3LmWlFwdRiGu?=
 =?iso-8859-1?Q?clPFMZdj4hmQGifjI7FD7iTfTex//3M5++9+tlh2X+uG9tW/esYPw4j/5t?=
 =?iso-8859-1?Q?voY4Yf0QwuXBEdi9qmczcQKKtVvem7h8BdXdpXjb9NePy98NOvOufkYdUF?=
 =?iso-8859-1?Q?eV+zaRUECj0IfXutqPFg+XOTxmBAb5KrmB59V5ybFjQKb7/w0FrB5YHva+?=
 =?iso-8859-1?Q?60YXp56HywtmTCCdqbXzMyHpByGX5vilM02la9bAYwPMxrLW7SRp6d69n3?=
 =?iso-8859-1?Q?ZJhtweqaeJ2tN6KCbDmokXOmbPVlhup/EMJHNV/qcZK93hHJ8KUKeyZ036?=
 =?iso-8859-1?Q?FFmA0T/93SuT3GL8XW+mKaLQXW9S2+TQL5QSlV+w8dDrlV2/iuwWhTQDtE?=
 =?iso-8859-1?Q?rUx9TQs5KHkgU4ZzPmNW9NBfEbeMQw9AidG3J/qorcur3MRhn8J9iAtMO6?=
 =?iso-8859-1?Q?Dl2Voyod3vAKsah0WoboU1GDtIX8UE9Dq4pQW33bdOchj2wLtXYuNZCkfr?=
 =?iso-8859-1?Q?GAy19aNDS3ORB8wWLXuiDWRf69ik0Ix+VN/a3jtnh17sXWyFPhreImeO9X?=
 =?iso-8859-1?Q?ddx4opEXz/iwOx2QqhEwWx0bC+SK/ZUbXCW0u/OwQ78OOsFEfCjd3pvbOA?=
 =?iso-8859-1?Q?Vi0zuVX9vo0LiqEsjrKRYd/33iAml7HQBlVmYMYQht77l+ffhEYvLgOoCa?=
 =?iso-8859-1?Q?pchAO+GzZi+AvW9fXM5Yq+1wUDWUjviVKeBph0S/DRESet5CB6+3xC/A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b29634-d351-48d3-d61d-08de2d2c777f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 20:43:33.9813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MaoeMrM2f9LnZPot71QUOI7RcTdr7ReRT+h+opTfSG4+DqRa+YvyDpLT1fJ8floOf3gaKVx76W7AiarFMO5jJfyAhe68yGBBRWbOhzfdxsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9365

From: Grygorii Strashko <grygorii_strashko@epam.com>

The d->arch.physaddr_bitsize field is used only by PV32 code, so:

- move domain_set_alloc_bitsize() function into PV32 code and clean up
unused domain_set_alloc_bitsize() defines from other arches

- move domain_clamp_alloc_bitsize() function into PV32 code,
rename to _domain_clamp_alloc_bitsize() and use generic
domain_clamp_alloc_bitsize() define instead, clean up
domain_clamp_alloc_bitsize() defines from !X86 arches

- move d->arch.physaddr_bitsize field under PV32 ifdef

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/arm/include/asm/mm.h     |  3 ---
 xen/arch/ppc/include/asm/mm.h     |  3 ---
 xen/arch/riscv/include/asm/mm.h   |  3 ---
 xen/arch/x86/include/asm/domain.h |  2 +-
 xen/arch/x86/include/asm/mm.h     | 10 +++++++---
 xen/arch/x86/pv/dom0_build.c      |  2 ++
 xen/arch/x86/pv/domain.c          | 21 +++++++++++++++++++++
 xen/arch/x86/x86_64/mm.c          | 20 --------------------
 xen/include/xen/mm.h              |  4 ++++
 9 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index f702f4a0d676..ec2d2dc5372a 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -313,9 +313,6 @@ struct page_info *get_page_from_gva(struct vcpu *v, vad=
dr_t va,
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
=20
-#define domain_set_alloc_bitsize(d) ((void)0)
-#define domain_clamp_alloc_bitsize(d, b) (b)
-
 unsigned long domain_get_maximum_gpfn(struct domain *d);
=20
 /* Release all __init and __initdata ranges to be reused */
diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.h
index a33eeec43bd6..91c405876bd0 100644
--- a/xen/arch/ppc/include/asm/mm.h
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -96,9 +96,6 @@ static inline struct page_info *virt_to_page(const void *=
v)
 /* TODO: implement */
 #define mfn_valid(mfn) ({ (void) (mfn); 0; })
=20
-#define domain_set_alloc_bitsize(d) ((void)(d))
-#define domain_clamp_alloc_bitsize(d, b) (b)
-
 #define PFN_ORDER(pfn_) ((pfn_)->v.free.order)
=20
 struct page_info
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/m=
m.h
index 9283616c0224..e5ea91fa4d0c 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -292,9 +292,6 @@ static inline bool arch_mfns_in_directmap(unsigned long=
 mfn, unsigned long nr)
 /* TODO: implement */
 #define mfn_valid(mfn) ({ (void)(mfn); 0; })
=20
-#define domain_set_alloc_bitsize(d) ((void)(d))
-#define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
-
 #define PFN_ORDER(pg) ((pg)->v.free.order)
=20
 extern unsigned char cpu0_boot_stack[];
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index 5df8c7825333..fca721ac482a 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -314,10 +314,10 @@ struct arch_domain
=20
 #ifdef CONFIG_PV32
     unsigned int hv_compat_vstart;
-#endif
=20
     /* Maximum physical-address bitwidth supported by this guest. */
     unsigned int physaddr_bitsize;
+#endif
=20
     /* I/O-port admin-specified access capabilities. */
     struct rangeset *ioport_caps;
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 08153e6d6fa2..8c10458f52c4 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -619,9 +619,6 @@ void __iomem *ioremap_wc(paddr_t pa, size_t len);
=20
 extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int=
 pxm);
=20
-void domain_set_alloc_bitsize(struct domain *d);
-unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bit=
s);
-
 unsigned long domain_get_maximum_gpfn(struct domain *d);
=20
 /* Definition of an mm lock: spinlock with extra fields for debugging */
@@ -659,4 +656,11 @@ static inline bool arch_mfns_in_directmap(unsigned lon=
g mfn, unsigned long nr)
     return (mfn + nr) <=3D (virt_to_mfn(eva - 1) + 1);
 }
=20
+#ifdef CONFIG_PV32
+unsigned int _domain_clamp_alloc_bitsize(const struct domain *d,
+                                         unsigned int bits);
+#define domain_clamp_alloc_bitsize(d, bits)                               =
     \
+    _domain_clamp_alloc_bitsize((d), (bits))
+#endif
+
 #endif /* __ASM_X86_MM_H__ */
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 21158ce1812e..6748c639cdc1 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -626,6 +626,7 @@ static int __init dom0_construct(const struct boot_doma=
in *bd)
         initrd_mfn =3D paddr_to_pfn(initrd->start);
         mfn =3D initrd_mfn;
         count =3D PFN_UP(initrd_len);
+#ifdef CONFIG_PV32
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)=
) )
         {
@@ -650,6 +651,7 @@ static int __init dom0_construct(const struct boot_doma=
in *bd)
             initrd->start =3D pfn_to_paddr(initrd_mfn);
         }
         else
+#endif
         {
             while ( count-- )
                 if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 9c4785c187dd..1cdcb9f89c54 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -230,6 +230,27 @@ unsigned long pv_make_cr4(const struct vcpu *v)
 }
=20
 #ifdef CONFIG_PV32
+unsigned int _domain_clamp_alloc_bitsize(const struct domain *d,
+                                         unsigned int bits)
+{
+    if ( (d =3D=3D NULL) || (d->arch.physaddr_bitsize =3D=3D 0) )
+        return bits;
+    return min(d->arch.physaddr_bitsize, bits);
+}
+
+static void domain_set_alloc_bitsize(struct domain *d)
+{
+    if ( !is_pv_32bit_domain(d) ||
+         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >=3D max_page) ||
+         d->arch.physaddr_bitsize > 0 )
+        return;
+    d->arch.physaddr_bitsize =3D
+        /* 2^n entries can be contained in guest's p2m mapping space */
+        fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1
+        /* 2^n pages -> 2^(n+PAGE_SHIFT) bits */
+        + PAGE_SHIFT;
+}
+
 int switch_compat(struct domain *d)
 {
     struct vcpu *v;
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index d4e6a9c0a2e0..8eadab7933d0 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1119,26 +1119,6 @@ unmap:
     return ret;
 }
=20
-void domain_set_alloc_bitsize(struct domain *d)
-{
-    if ( !is_pv_32bit_domain(d) ||
-         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >=3D max_page) ||
-         d->arch.physaddr_bitsize > 0 )
-        return;
-    d->arch.physaddr_bitsize =3D
-        /* 2^n entries can be contained in guest's p2m mapping space */
-        fls(MACH2PHYS_COMPAT_NR_ENTRIES(d)) - 1
-        /* 2^n pages -> 2^(n+PAGE_SHIFT) bits */
-        + PAGE_SHIFT;
-}
-
-unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bit=
s)
-{
-    if ( (d =3D=3D NULL) || (d->arch.physaddr_bitsize =3D=3D 0) )
-        return bits;
-    return min(d->arch.physaddr_bitsize, bits);
-}
-
 static int transfer_pages_to_heap(struct mem_hotadd_info *info)
 {
     unsigned long i;
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b968f47b87e0..6a66fc7a05c8 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -641,4 +641,8 @@ static inline void put_page_alloc_ref(struct page_info =
*page)
     }
 }
=20
+#ifndef domain_clamp_alloc_bitsize
+#define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
+#endif
+
 #endif /* __XEN_MM_H__ */
--=20
2.34.1

