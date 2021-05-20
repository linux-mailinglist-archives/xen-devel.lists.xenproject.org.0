Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0BD38AE3C
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 14:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130929.244986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhp4-0007Ty-CS; Thu, 20 May 2021 12:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130929.244986; Thu, 20 May 2021 12:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhp4-0007QM-74; Thu, 20 May 2021 12:30:42 +0000
Received: by outflank-mailman (input) for mailman id 130929;
 Thu, 20 May 2021 12:30:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V2Ic=KP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ljhp2-0007Pl-QU
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 12:30:40 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2883251-3f26-41aa-86d1-c13d1837d1ef;
 Thu, 20 May 2021 12:30:39 +0000 (UTC)
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
X-Inumbo-ID: d2883251-3f26-41aa-86d1-c13d1837d1ef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621513839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=P40Hog//rApTFLCIQlAqgR9U8c+aP1G/ygiI3z8p7k0=;
  b=AeegSZUuGiBrUEAYekEQn69dGtYsj7CdOOKHSI2lSTaGHlzbpITeuewP
   RYJ5GM2EeT/ezaz4OZzpFIlauV7N+be9keMBaa7gZFXFb3lxEZO89SmBr
   eE8gfebyEVaCgH95H23T9cuFHmHPTUWii03TnjdbzZzKH74h7OUf3sPO2
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ymovIQQs5e0mFckladA2MZsPtjhMjBw94wJ3E9sQlrAIJ3s36NOWbMkbKwCKNHSps9op3cAgOa
 DhKzN3eu5f5KuRRcG4HcVnvdM7B2yIUB/fdDP3+/F39FBfnGYPUryOuSXk2v7YzJWkqc94mvvY
 IC+zF6sONS3oZKV5xPVMcvNnMPGvaBxwmfytsrefQC97rj5XYg2IXLY43xCYQ3jqfFHNnHjG9B
 RBDNLWTls0gr0UvE0CKCFgsMi8m/av3r+Ygq7RD85jBRRwfFZZvzcqgHKYN9GjShp1X6oRnh57
 +UY=
X-SBRS: 5.1
X-MesageID: 44609525
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:tRL2O6AxBJrg4hVW/zTjw5YqxClBgxIJ4kV8jS/XYbTApGgihTwBx
 2pMDDiHafjeNmCneNh/a4zk9kxXsJLXyNdlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaH4EjratANlFEkvU2ybuOU5NXsZ2YhH2eIdA970Ug6w7Ng09Y26TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgyl
 PgVqKfveDxqFYDMt+Eld15nASZhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM0DF3bveLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcEgGlo150UQJ4yY
 eJDMDgzNw3DSSFIeWscB7UGs76Rol/GJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEh/DNtTP2XpoIE7+1/eIsh0ecrkQMDDUGWF39puO24ma8Ud9CL
 00f+gI1sLM/skesS7HVXQC8oXOClg4RXZxXCeJSwBqW1qPe7gKdB24FZj1MctorsIkxXzNC6
 7OSt4q3X3o16uTTEC/NsO3Nxd+vBcQLBSxeSHcZdlQ02JrIjYEciyrrCelxF7Hg27UZBgrML
 yC2QDkW3utJ1JRahvTjoDgrkBr2+MGRE1ddChH/GzL9t1koPOZJcqT1sQCz0BpWEGqOorBtV
 lAqnNKCpMQHEJ2AjiCEROhl8FqBvK3eaWO0bbKCBfAcG9WRF5yLJto4DNJWfh0B3iM4ldjBO
 h67hO+pzMUPVEZGlIcuC25LNyjP8UQHPYi9Ps04k/IXPckrHON51HgxNSZ8IFwBYGBzyPpia
 P93gO6HDGoACLQP8dZFb7xEjNcWKtQF7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WuM3GLrtZLdQ5iwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSSvxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:l4asdaEJfmp6Jzo7pLqEIceALOsnbusQ8zAXPo5KKSC9E/bo9f
 xG88536faZslkssTQb6Km90cq7MBDhHPxOi7X5VI3KNDUO+lHYSr2Ki7GN/9SJIUbDH4VmuZ
 uIHZIeNPTASXVCyePAzCbQKadE/PC3tI2ln+Xm9FEoZh1rbqwI1XYfNi+rVmB7Xgt+Prx8MJ
 aH/MJIqwGtdh0sH6CGOkU=
X-IronPort-AV: E=Sophos;i="5.82,313,1613451600"; 
   d="scan'208";a="44609525"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTlk9r4seE+eYt4symQZ80G+KoxqSpLW0PGRI3kXbMvTnTRtrGF+XCpOyXp4yq4qY7b9nb1bSzwcLS7YVXDS6xT9zVFHDe1cBLwz479jv+oV61WNXNu7g4wZOq6/bpPN3B6i2Si817+wJA+BzpShwnqrZWwnwEvrr0EEWp8b+gpvLxIEnOx6dWbjJ4oQMBEv1OnsULB1Gviu2zt0zKrWGoWWVaiZiaH81MX/D2RuvaPUgsBbFRM/sv09umU5U6yL7yaAK1MfvEQMhAeEeFzhRGcvLVE5nlhdVq/FuKTbjtWqtn0ytdVdfns0qwRoUu0KfEmPaGGrpVoUzQEmz3JX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPwA3OmQRR4Le01oTZkBmItUHWI1w1PcWSsZAP5z+lQ=;
 b=bq5YSQx+CSkSkcswmJFHA91PTNnV/dQp/QVG2BOmayP8UyKXor/I31xb1pCPQecKgLeNt66Bbd+RUWPJ0Fd2iN8hnov0kbCyrUZyvMENmx/uVhGMOVlcH5UjPWwkMBLdOJBdvbaIj1yvTdrB6La786ZVhNCTOFYDpXWUA1n+qbJ2LKo/KM8n6dgjh2o0xhFay79gjgXtxGBAHfee+r52LvB6qAnQUh+EyUxXFCr8wZwIRUIGJl6C5cB6XADS47wgQAn4PUN6P7oqU+fwCAbJPzgL9KuaXM+KiC5iJqNq/+tGwgN/6efsD7oXlS30SMJiiYkwC7PM5QBeGC7MXzdeyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPwA3OmQRR4Le01oTZkBmItUHWI1w1PcWSsZAP5z+lQ=;
 b=K4crQvpwKBmEFdafEZ0mZLJRrz7BlL0DwYEFHAXuca66Zq/Elkr9FNcgck2dpmuY+X96ORvUa1WvFkz9T5uqkeDaJ/gXw2KL/51vsNBeuY2C5838q130lgJJ2FKmi8t5RB/MnF7a5F+BC6/B1Mkb5s6uYKkfrASSvssc6lrpMYk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/2] libelf: improve PVH elfnote parsing
Date: Thu, 20 May 2021 14:30:12 +0200
Message-ID: <20210520123012.89855-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520123012.89855-1-roger.pau@citrix.com>
References: <20210520123012.89855-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b333a26a-36aa-4d7b-8ce0-08d91b8b10f3
X-MS-TrafficTypeDiagnostic: DM6PR03MB3738:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB373882934A92D349C98C0F908F2A9@DM6PR03MB3738.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IPKZcnKuHIHSCyHzpOcEIkrISU7QSx9q2LTB+7aHBcOJJ+fp/blj5Zj5rZWqP4+1FM7C0S374+hxtAf2TDgVYhzCe+Kbu9o4XABMYuOAQWYmx2sYe5KFyhQxzIrwBhB6GXoQRxaQijIOwqahYohXHgHSBn6J1l1fr8aqvCAG2LEx3/ZvszZICDBbyAZdJFltjTzqN1dQspnxxBn23Kz6t4SDzq5OYhruWDTvbWrar1UqteH3WPefFkvIanGe4ebqUAWvYJKBqAv+AaKj32EckObVJ2KAB4BmHMI0oWDSfjoby9DJiTEyMjR5UJHeMfY4jAefXLwv/sC7kla2Wizyc6uPn6jdKNmw4MWwEU4lPELBMFTw0ZyYg2nVmLl8wl72Rlmv3XOzddcbhiNw2SkSCKtPh39N3AxN4S2QxqYqoV+OTpT1/CT/2DIscCI3ev6BrsGq6HxuDNzlYJCys1fkP809mq87KbF2EiAfT7zBQ9eA3yLGAQW0MVoOKN4oeDrYXcJmOexErnvVax+013y3p0cnRpmIdkLwZstG8zJHkWFENt1k8m2p0TdaN3p6vQ4X17uVvoUe4DPEWMsNn2FotJzXHhUQjkhbIlFtnz3pqU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(1076003)(478600001)(66476007)(86362001)(8936002)(2906002)(36756003)(4326008)(6916009)(6486002)(5660300002)(8676002)(6496006)(66556008)(38100700002)(26005)(83380400001)(316002)(66946007)(2616005)(186003)(16526019)(6666004)(956004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dGJKNm5mNjRWWlgya21TRlR4elJ3RHFFUXBOSjVZckJVRXVEODZva2QvNzVB?=
 =?utf-8?B?TllYVU1ETloyY1V5UUErZnVxVlVnQVJJbVF3RTd2Z2VFVmlZNVp4aUxUN0lo?=
 =?utf-8?B?bktmRGtybHNwb1RoUDVIdmJwbHhxM2pVOHdwa0djbjNKWHpsdlAvV3AvV1Nr?=
 =?utf-8?B?ckNsUzlhdHRmcG8zNVd5T1JjMk9RVDlMa0pRZGo4UjBoK0VzclVCRDV4SlNP?=
 =?utf-8?B?Q2UzZitnRitUZklpTlBzYitWa2NweHY4NTZyMC9qN3hrYjh1RUhzYlNaQkRl?=
 =?utf-8?B?ZDFLWlVtU2VZZVhtV3BlYkxZMkxBQ1cxdHFZUnB1TzRiL05EUVFUcTV3VHpv?=
 =?utf-8?B?b2hnVFpXWTd1anJYNTFxZkJ5MzFjcVJUcEhDYnBPclFhRkVxMHpkOWxnQStV?=
 =?utf-8?B?ODdTQUFMR2hHUDRXNmlrYUl4OE5kQ0g3WXdDNFpCOVZHeEU0SGtzUGQ1YnZa?=
 =?utf-8?B?cmIvL2R6OEc4TDEzQThQTVdlVmRhb0pwejF1akZrS0IvLzh5TmxDUURzV1BC?=
 =?utf-8?B?cEswZ2VVREdEdTRCRVhYandCSmIrV3hFN1pNUjNiRU5PS1phRUxzdWNTbHcv?=
 =?utf-8?B?bHpWOXRvT0RiaHpMSGwvc1NmaGRqTkh6YTAycWpKQ1NZYnQrYnpBd3ZlaXRM?=
 =?utf-8?B?MFZydERBeWE2ajE4V1I4aWpkRnFnYXF5MXZGbmF3N0haTUsrQkZDMStpR29S?=
 =?utf-8?B?YUlzZXRMUzlYK2Zpb0czc2lhTnNrdXUwOUtkQ3MzZk1NdmRMY0JiNnN6SXZ5?=
 =?utf-8?B?Q0hWTy9IN3hZVXpTdjI3T1ZkK1ZqYmFuUnZ5TmJ0Umc4OUs3a3ZLVTg5MkdB?=
 =?utf-8?B?UmptSmVFYTF2WUdlOGRqbE5EZFZIclB5M2NWN1J0K0g3Zm1ZbEpNdnd5eWU5?=
 =?utf-8?B?WWJpUHpkVlB6aldDVUZObS9pT0ZkL3h6bEtFcU9zL2lEZ2xvd2VkWVRzWXZJ?=
 =?utf-8?B?Y2NjbEhLUWVTdmNJYzFCU0M3YVRhbFZnVFRvVU5vQndYZUdJVlF3amlMeWxE?=
 =?utf-8?B?cUxEUDlkRktlcHZHUzVtZUNSYjFsZVVSSlJTZmg0WDRTblZMV1ZqRTFCTWlj?=
 =?utf-8?B?Vi9kL0R2WjZBZGFKTlY0Z3VGaWVSVEZXUldsb1k2WHorcFlvMFpHZ3ZFRk9y?=
 =?utf-8?B?aGhQZk5VWmNpMkFDWEhxR0daVzlZaWkzeFB2L2JMRHRoMXp2N3dqaWdrTEFS?=
 =?utf-8?B?empQQzFIYlRzQ2xoZmtXcHJNWnhGdEM1NzVCdzhzazMzWnpjZlZCMHVYYlNT?=
 =?utf-8?B?Z0VWMDZBNlIyMHRxOExQcFRrc3RFNlg4a2VVNHpqdFhDZk1xamg4QlZGaFpI?=
 =?utf-8?B?NzdXbHZGMGxXajVGU2MvQVdKYWxGMVJVRjgvQ1hGTStOcExSN1NBRjdkL3lD?=
 =?utf-8?B?M2sydTkyWFg3YTlYbnRFYWgvZW56S3FFK3NtZk0vSm0rdzBYREpZWjFkT29B?=
 =?utf-8?B?OEhFRUFncUxlam01aG4rekhYeDZ6eU9mY2M5OEhBN1NTTmRXN2FCeUs0MGpU?=
 =?utf-8?B?NXhtN1YrTkRBejlNS2s2Z2VDRVVUL3NOT1Q0QXNzU1laaDJicGJXZ3pvN1VQ?=
 =?utf-8?B?YXlJdWpDT09UWmpoWUgrOXBBYXdxVXVCOXJ1S2NvRlQxWjliZmNoNlhMVzFi?=
 =?utf-8?B?Z2UvSklHajhHNGdzL2tRUnRKdWRIdmlrRjh5T2grcUlPL0tXL3pkK2ljMWJ1?=
 =?utf-8?B?ZmpzNWIvcFBuZGVnWVNKR0Rhd1gydWlMT3NGdGZXTnJJaGRRMU1KL0NEdkRB?=
 =?utf-8?Q?OMQzFcwdn9FWiq9wBWeXvV/cXCFxuQ/MteoeBh/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b333a26a-36aa-4d7b-8ce0-08d91b8b10f3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 12:30:34.9701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkN/5OwhO9xxQtvZa59V58rE6CDfuoSVpsXGHLoNJ7rRzEFcAE2EGpMc4nxxN96HN36vsvKLQee6PMdvEa5u4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3738
X-OriginatorOrg: citrix.com

Pass an hvm boolean parameter to the elf note parsing and checking
routines, so that better checking can be done in case libelf is
dealing with an hvm container.

elf_xen_note_check shouldn't return early unless PHYS32_ENTRY is set
and the container is of type HVM, or else the loader and version
checks would be avoided for kernels intended to be booted as PV but
that also have PHYS32_ENTRY set.

Adjust elf_xen_addr_calc_check so that the virtual addresses are
actually physical ones (by setting virt_base and elf_paddr_offset to
zero) when the container is of type HVM, as that container is always
started with paging disabled.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Do not print messages about VIRT_BASE/ELF_PADDR_OFFSET unset on
   HVM.
 - Make it explicit that elf_paddr_offset will be set to 0 regardless
   of elf_note_start value for HVM.

Changes since v1:
 - Expand comments.
 - Do not set virt_entry to phys_entry unless it's an HVM container.
---
 tools/fuzz/libelf/libelf-fuzzer.c   |  3 +-
 tools/libs/guest/xg_dom_elfloader.c |  6 ++--
 tools/libs/guest/xg_dom_hvmloader.c |  2 +-
 xen/arch/x86/hvm/dom0_build.c       |  2 +-
 xen/arch/x86/pv/dom0_build.c        |  2 +-
 xen/common/libelf/libelf-dominfo.c  | 43 ++++++++++++++++++-----------
 xen/include/xen/libelf.h            |  2 +-
 7 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/tools/fuzz/libelf/libelf-fuzzer.c b/tools/fuzz/libelf/libelf-fuzzer.c
index 1ba85717114..84fb84720fa 100644
--- a/tools/fuzz/libelf/libelf-fuzzer.c
+++ b/tools/fuzz/libelf/libelf-fuzzer.c
@@ -17,7 +17,8 @@ int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size)
         return -1;
 
     elf_parse_binary(elf);
-    elf_xen_parse(elf, &parms);
+    elf_xen_parse(elf, &parms, false);
+    elf_xen_parse(elf, &parms, true);
 
     return 0;
 }
diff --git a/tools/libs/guest/xg_dom_elfloader.c b/tools/libs/guest/xg_dom_elfloader.c
index 06e713fe111..ad71163dd92 100644
--- a/tools/libs/guest/xg_dom_elfloader.c
+++ b/tools/libs/guest/xg_dom_elfloader.c
@@ -135,7 +135,8 @@ static elf_negerrnoval xc_dom_probe_elf_kernel(struct xc_dom_image *dom)
      * or else we might be trying to load a plain ELF.
      */
     elf_parse_binary(&elf);
-    rc = elf_xen_parse(&elf, dom->parms);
+    rc = elf_xen_parse(&elf, dom->parms,
+                       dom->container_type == XC_DOM_HVM_CONTAINER);
     if ( rc != 0 )
         return rc;
 
@@ -166,7 +167,8 @@ static elf_negerrnoval xc_dom_parse_elf_kernel(struct xc_dom_image *dom)
 
     /* parse binary and get xen meta info */
     elf_parse_binary(elf);
-    if ( elf_xen_parse(elf, dom->parms) != 0 )
+    if ( elf_xen_parse(elf, dom->parms,
+                       dom->container_type == XC_DOM_HVM_CONTAINER) != 0 )
     {
         rc = -EINVAL;
         goto out;
diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_dom_hvmloader.c
index ec6ebad7fd5..3a63b23ba39 100644
--- a/tools/libs/guest/xg_dom_hvmloader.c
+++ b/tools/libs/guest/xg_dom_hvmloader.c
@@ -73,7 +73,7 @@ static elf_negerrnoval xc_dom_probe_hvm_kernel(struct xc_dom_image *dom)
      * else we might be trying to load a PV kernel.
      */
     elf_parse_binary(&elf);
-    rc = elf_xen_parse(&elf, dom->parms);
+    rc = elf_xen_parse(&elf, dom->parms, true);
     if ( rc == 0 )
         return -EINVAL;
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 878dc1d808e..c24b9efdb0a 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -561,7 +561,7 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     elf_set_verbose(&elf);
 #endif
     elf_parse_binary(&elf);
-    if ( (rc = elf_xen_parse(&elf, &parms)) != 0 )
+    if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
     {
         printk("Unable to parse kernel for ELFNOTES\n");
         return rc;
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e0801a9e6d1..af47615b226 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -353,7 +353,7 @@ int __init dom0_construct_pv(struct domain *d,
         elf_set_verbose(&elf);
 
     elf_parse_binary(&elf);
-    if ( (rc = elf_xen_parse(&elf, &parms)) != 0 )
+    if ( (rc = elf_xen_parse(&elf, &parms, false)) != 0 )
         goto out;
 
     /* compatibility check */
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index abea1011c18..24d1371dd7a 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -360,7 +360,7 @@ elf_errorstatus elf_xen_parse_guest_info(struct elf_binary *elf,
 /* sanity checks                                                            */
 
 static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
-                              struct elf_dom_parms *parms)
+                              struct elf_dom_parms *parms, bool hvm)
 {
     if ( (ELF_PTRVAL_INVALID(parms->elf_note_start)) &&
          (ELF_PTRVAL_INVALID(parms->guest_info)) )
@@ -382,7 +382,7 @@ static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
     }
 
     /* PVH only requires one ELF note to be set */
-    if ( parms->phys_entry != UNSET_ADDR32 )
+    if ( parms->phys_entry != UNSET_ADDR32 && hvm )
     {
         elf_msg(elf, "ELF: Found PVH image\n");
         return 0;
@@ -414,7 +414,7 @@ static elf_errorstatus elf_xen_note_check(struct elf_binary *elf,
 }
 
 static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
-                                   struct elf_dom_parms *parms)
+                                   struct elf_dom_parms *parms, bool hvm)
 {
     uint64_t virt_offset;
 
@@ -425,12 +425,15 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
         return -1;
     }
 
-    /* Initial guess for virt_base is 0 if it is not explicitly defined. */
-    if ( parms->virt_base == UNSET_ADDR )
+    /*
+     * Initial guess for virt_base is 0 if it is not explicitly defined in the
+     * PV case. For PVH virt_base is forced to 0 because paging is disabled.
+     */
+    if ( parms->virt_base == UNSET_ADDR || hvm )
     {
         parms->virt_base = 0;
-        elf_msg(elf, "ELF: VIRT_BASE unset, using %#" PRIx64 "\n",
-                parms->virt_base);
+        if ( !hvm )
+            elf_msg(elf, "ELF: VIRT_BASE unset, using 0\n");
     }
 
     /*
@@ -441,23 +444,31 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
      *
      * If we are using the modern ELF notes interface then the default
      * is 0.
+     *
+     * For PVH this is forced to 0, as it's already a legacy option for PV.
      */
-    if ( parms->elf_paddr_offset == UNSET_ADDR )
+    if ( parms->elf_paddr_offset == UNSET_ADDR || hvm )
     {
-        if ( parms->elf_note_start )
+        if ( parms->elf_note_start || hvm )
             parms->elf_paddr_offset = 0;
         else
             parms->elf_paddr_offset = parms->virt_base;
-        elf_msg(elf, "ELF_PADDR_OFFSET unset, using %#" PRIx64 "\n",
-                parms->elf_paddr_offset);
+        if ( !hvm )
+            elf_msg(elf, "ELF_PADDR_OFFSET unset, using %#" PRIx64 "\n",
+                    parms->elf_paddr_offset);
     }
 
     virt_offset = parms->virt_base - parms->elf_paddr_offset;
     parms->virt_kstart = elf->pstart + virt_offset;
     parms->virt_kend   = elf->pend   + virt_offset;
 
-    if ( parms->virt_entry == UNSET_ADDR )
-        parms->virt_entry = elf_uval(elf, elf->ehdr, e_entry);
+    if ( parms->virt_entry == UNSET_ADDR || hvm )
+    {
+        if ( parms->phys_entry != UNSET_ADDR32 && hvm )
+            parms->virt_entry = parms->phys_entry;
+        else
+            parms->virt_entry = elf_uval(elf, elf->ehdr, e_entry);
+    }
 
     if ( parms->bsd_symtab )
     {
@@ -499,7 +510,7 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
 /* glue it all together ...                                                 */
 
 elf_errorstatus elf_xen_parse(struct elf_binary *elf,
-                  struct elf_dom_parms *parms)
+                  struct elf_dom_parms *parms, bool hvm)
 {
     ELF_HANDLE_DECL(elf_shdr) shdr;
     ELF_HANDLE_DECL(elf_phdr) phdr;
@@ -592,9 +603,9 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
         }
     }
 
-    if ( elf_xen_note_check(elf, parms) != 0 )
+    if ( elf_xen_note_check(elf, parms, hvm) != 0 )
         return -1;
-    if ( elf_xen_addr_calc_check(elf, parms) != 0 )
+    if ( elf_xen_addr_calc_check(elf, parms, hvm) != 0 )
         return -1;
     return 0;
 }
diff --git a/xen/include/xen/libelf.h b/xen/include/xen/libelf.h
index b73998150fc..be47b0cc366 100644
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -454,7 +454,7 @@ int elf_xen_parse_note(struct elf_binary *elf,
 int elf_xen_parse_guest_info(struct elf_binary *elf,
                              struct elf_dom_parms *parms);
 int elf_xen_parse(struct elf_binary *elf,
-                  struct elf_dom_parms *parms);
+                  struct elf_dom_parms *parms, bool hvm);
 
 static inline void *elf_memcpy_unchecked(void *dest, const void *src, size_t n)
     { return memcpy(dest, src, n); }
-- 
2.31.1


