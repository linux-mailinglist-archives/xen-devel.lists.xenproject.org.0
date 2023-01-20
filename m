Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F476758E4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:39:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481963.747223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItUE-00045a-GA; Fri, 20 Jan 2023 15:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481963.747223; Fri, 20 Jan 2023 15:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItUE-00042s-DB; Fri, 20 Jan 2023 15:39:26 +0000
Received: by outflank-mailman (input) for mailman id 481963;
 Fri, 20 Jan 2023 15:39:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pItUC-00042l-JV
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:39:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ba4428d-98d8-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 16:39:22 +0100 (CET)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 10:39:12 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4982.namprd03.prod.outlook.com (2603:10b6:a03:1f1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 20 Jan
 2023 15:39:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 15:39:10 +0000
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
X-Inumbo-ID: 9ba4428d-98d8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674229162;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NJj7xlRHwcyXb1MBngUqx3cNZ3XmMewkOKdHGsa7SmA=;
  b=bNJPh79Pnil93FMZNxNmOdRgmh2CemF2yZH3l7jDq5RB+xgviQg/BLVx
   EOFuuodqS6oonwfsXaJzKnWvaGMjpxvbNsbMBDLhAKlcKyGo91b5s4tWp
   XZQLxZlfACzGqxAg/UoqI+z0LEvT2512OwT4//Xqz4fmFZSfwC9TS1Rdc
   Y=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 92440284
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BAU2xqt6nFkRvNoq9W3SmYEd+ufnVM9fMUV32f8akzHdYApBsoF/q
 tZmKW/Qa6uPa2WhKt8nPIi1phsEucDQmIQwSQE6+SFhFnlG+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AaEzyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwcXcubkqzrPCPyr+kTdJTmpkMPe/kBdZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xarI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6RefkqqYw0AH7Kmo7ETQWb3eChKiA2hSAV/hzB
 hIu6y8+hP1nnKCsZpynN/Gim1aDuhMfQNtRVe4n8gaGyqnTywmcD2kACDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vX6GDj2x
 y2BpQAkhqsUls8N3OOw+lWvqzirrJLYQxU14gjSV2SN4QZwZYrjbIutgXDS6fdbMI+YVB+Pp
 nECkMmFxP8CBteGkynlaO4KGreu5fqMLjzHqVFqFpglsT+q/haekZt45Th/IAJsLZwCcDqwO
 kvL41sNvtlUIWegarJxb8SpEcM2wKP8FNPjEPfJct5JZZs3fwiClM1zWXOtM6nWuBBEuckC1
 V2zKK5A0V5y5Xxb8QeL
IronPort-HdrOrdr: A9a23:ZGCAiqDvWhEVfjTlHejLsseALOsnbusQ8zAXPhhKOGVom7+j5o
 WTdZUgpFvJYVMqM03I9urwXZVoLUmzyXcx2/h2AV7AZniThILLFvAH0WKK+VSJcUGQygce79
 YGT0EUMr3N5C1B/KTHCX6DYrUdKbe8kZxBKIzloktFfEVPUeVN/g15AgGUHglfQxRHP4MwEN
 6x99dKvD2pfFUQd4CeCmMeV+bOitXXnNa+CCR2cSIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zoghH0/aKqttC801v523XI55pbtdP9wp9oBdCKiOISNjLw4zzYE7hJavmnhnQYseuv4FElnJ
 3nuBE7Jfl+7HvXYyWcvQbt8xOI6kdn11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 Nw2X6DvZY/N2KKoM293amDa/hZrDv5nZMQq59ds5WZa/pRVFZll/1TwKqSKuZAIMu10vFmLA
 AkNrCl2B8fSyLgU5hf1VMfguBFih8Ib1S7qw45y4Wo+ikTk3Zjw0QCwssD2n8G6ZImUpFBo/
 /JK6Jyidh1P7wrhI9GdZY8qPGMexzwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvfJAT1pM9lJ
 nITVsd7AcJCjfTINzL2IcO/gHGQW27UziowsZC54Jhsrm5QLbwKyWMRF0njsPlqfQCBc/QXe
 q1Jfttco3eBHqrHZwM0xz1WpFUJ3VbWMoJuswjU1bLuc7PIp2CjJ2kTB8SHsuTLd8JYBKCPp
 JYZkmIGCxp1DHXZkPF
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="92440284"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bR9STxQpPWCktMp5ROnGMcRo703NrrIbe+ZfUVjznwmLPpPWpJgwA7ldkZpVDve1WMXWIsqTW1C7aIcfRvxx4DVD5cTthcCjLr2FRDxZMr6i70RfdsMOvyrrrxMnq79RaTdDVp5lC8+gifJ6pRQ0m51ta36zG0fKVsdJ98Dl3m3o1pTj0m4WFSVqSc5aDUk0r36jryrEDtVwW0v7hGpeV+iT6FLmxrdgspPDZ3DCQrbdnIE3sqwT0YXV+xh59YOBnhTjLoavoEWZlEp8R49c7QzW2e47NiLopLSh8MpqKCb4T6eD9wjDat4UISfA9N19WapGR6axUqQ029MNiWfqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJj7xlRHwcyXb1MBngUqx3cNZ3XmMewkOKdHGsa7SmA=;
 b=a3hI4CfyfaNfXM4lXRZcuqk6ToB5DhiGy+mvbWL65tUzRcb2ND973pzDlXNKJDUGZ0EzRsqZw2qnnPr8Fyeq+ZH/yEGRWB1nt6dZudbyQVUJFMy3US5ii+bGL0LBuSeZjJ4Ao61EXlP8Frz2UIA2GH5uirAVqLoeJLjPIgUUs6STjbCCZ3mpY+pkxzWcPRR70CH5vZ0pB5uHgs7j+FH4ltLFH//Ueq7LJSlpnB32ykBZq29kGDw5JtXxIkNMu7QvhNyPlxR+3GrAXugPTr8vdSymXA9COOWIVEnIxM24sWlfCMDMBn/N67I3HZkiHh9ExA889Y+LyY2rdyY5i4thbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJj7xlRHwcyXb1MBngUqx3cNZ3XmMewkOKdHGsa7SmA=;
 b=VWVrQ964HU3rlPI3dqYPB0ZEf3AIOJ0kC4Z6ZRsiNWQaHXQYcnKPeMWK7eCmXvShtbX31TEnXWgppPtJHp8R55m+14lzc5vf5CtN6+bkXUI+78oL+/0Mc3sAVWqdXDM8on0FOYtwulHvU0XGdxEuh4K1yXKZdVw1tz0IbRB0s1g=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v1 05/14] xen/riscv: add early_printk_hnum() function
Thread-Topic: [PATCH v1 05/14] xen/riscv: add early_printk_hnum() function
Thread-Index: AQHZLN/tUylHypY/2ESw6BfK5kdGDa6ncO0A
Date: Fri, 20 Jan 2023 15:39:10 +0000
Message-ID: <53b7651a-4274-1e2f-fb97-d30f3ddbac1d@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <633ced21788a3abf5079c9a191794616bb1ad351.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <633ced21788a3abf5079c9a191794616bb1ad351.1674226563.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB4982:EE_
x-ms-office365-filtering-correlation-id: acd564b8-6bfa-4823-0fba-08dafafc79a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uqhwGWwfe+duW3GRSP3EnoeIIlMUU39eDo41N53pGdUsFPOSMJi4lGzwAojxBwFjGVfjZGHR4JRf5hVbSmpnJluYMUb+ln0k7Nq0Yngry7NL71OUH8BEhjBd7mu55ZAlT7IhSxnUQ1l1k2fW5gyDf2HiOziFQPf4bj8vt3q+j8+QSYLsjKP+3cV8b9nwLpMcSj14fV0Ka0TK1fpidcZPMYQhCRPIDJiF8uMEyN5Acg8FCI2IEZfFX6lRQ8LJEK8TYTjpDKCNK14VLctY8mNwz5gd/oIQenBLryszMzFoTkReiNdoPrYIVCRZm5H7qidAOvFOW5TmZflEylFkaAp3xzfR9fhyX/0JxjfgkG/knyqfMf06puWbe0PJPHaOn6dI7EDZZup5j3yR39eqWKiNFy0ZpgK06Kt/P/j2WlI2wMLVzCecdY9KryT7NdLEJW391fl14nlvkBgs2dYaHjTVEtn+CDBrreR9wRTM0bZ7d4Wrvkm2+VkgbQU/PjEuPPxCckFS1+UiUXBTaSYqXU7haZ/oblLgM8aYtui/oENw9tXyPVmCJHoUK8KX/926L2x3mAmwYSDSOZOx/9NvH+5MC4yL0P2xLvt6KKP803SkKOPYI/W0B6y16nb2nI+TpHd7t/9aDnJCe+PgDQzPSqfTn3L0Qy1aX2ogfjy/9S6dqP2RsZGxEWhZAsVInjpDEsB80CDlWglQEHyyCqq8oHX0ZRJr6MRfMoc0MsOaUu5Mnb+1mQLFB9hwUbLW58SfRxfojOVwX4kzyMTuNWfBSycdhQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199015)(122000001)(82960400001)(36756003)(38100700002)(31696002)(38070700005)(26005)(8936002)(4744005)(41300700001)(5660300002)(64756008)(91956017)(316002)(66556008)(76116006)(66476007)(4326008)(66946007)(2906002)(8676002)(66446008)(2616005)(186003)(6486002)(71200400001)(54906003)(110136005)(53546011)(6506007)(86362001)(478600001)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QjUwQ0tHaDZlbG1BQS8xNzJMZ2pRMWtqTlhjUGdVUG44ODFwdTE2MExVTlhh?=
 =?utf-8?B?cE1BcHVYdDRTV3NhcjFVcnZheXBYbE9rNHhnRG9laXZXRGpwd0NJM3JoNGhj?=
 =?utf-8?B?UEJ0ck9KbkxzeFp0TWxvL1JpdEhVUmZwODBlaERYVmE4VnZPbmhCb2QxYVNK?=
 =?utf-8?B?UDBFcmg1Z0xzQysxZ05tSXNkbzlORSs0akp4QWdGVnMwbVlLZGJhNWR1bi9U?=
 =?utf-8?B?MS9QUWFrcGFVSHg5eXZmUjJrMUdjLzZ0NFc1NFJNRlRlMVFFemlsZVZwQ1Bs?=
 =?utf-8?B?RXNxaWJKL3piTGVOM0tpRk4zV0pjWlJlVG1wOUFRbUlnZkdxdjFzSUtHTm5q?=
 =?utf-8?B?YnhlY0h4NU1jalFEMDNtbWRWRi9EdGdKZ0JFanE3R1p6OWNwOGdTanZEZ0Rx?=
 =?utf-8?B?UHVmYUl6R0dwYTE3ZjRlUGNiNW5lYUdxaVlqOVFxdmpzM1NyTEtJbjFYMU8x?=
 =?utf-8?B?Sys0RTcrVWFqOXNNNXpGZjkrTHVpOTUzQ01DV0tvTWZCZC9MN1ZwTlVGc2cw?=
 =?utf-8?B?UnNQbjl0cyswQVN1SnYrOWtZeURrVUZEVTRTMWs3b1I2UVlFK3hrNEVrVUlv?=
 =?utf-8?B?a21qN29LQWM0R2VNR3FwUHdvYlMyOWt6cnNtSUZBQkJpTXdjWWJIaTVnRWtC?=
 =?utf-8?B?SFI5bzI5SW1rU3dMd1crbm9zNW5TcG4wREV2bUZmeTB5SDZ1ZmFaYUhIM3ln?=
 =?utf-8?B?UW5EZ2xCMWY5bTBEMldRMU8rdStFbE1WcHJQWHA2emdxOVcwQ000dnBYVlE4?=
 =?utf-8?B?ZHlKV1A5bTlQalM0OFJnTjFHbzFlaGNJbi9DZldRMnFVL2ZQb2tTTitXa2tw?=
 =?utf-8?B?aFBzMTI1MEtoWmVobVNzV2xSODBYZjgwU2gzR0Y2NjRoUFVMeTIyb0ppVTBm?=
 =?utf-8?B?RGpkSFNkRG1mc2VYcnRMS2FZU1ZCU0daZHp5Nm10SkJQaktIMWhjeHlLWEd6?=
 =?utf-8?B?SGtKMTB6QzNYRk5vY3FTdXdwb2tkMHNVRHhvSlhDNG5DeU1YaklBSVY0eEJ6?=
 =?utf-8?B?bW1YUk9CR0VlbnVJbVUxcFFQT2VJa1N1MUdKOUxTYkNGdjBsSkJYWUpWcy9T?=
 =?utf-8?B?OThoUzkzS3dEYWE4c2NvZkRtQnl3ZzBYOFpDMEpEYXRDRGxPTUpSZnJhOVFs?=
 =?utf-8?B?aDliWkg1R3pBWFhKMnRidDJiZmFSZTVwTXhjc1JlV1J6cEl2K0FOSzdPb0M5?=
 =?utf-8?B?RitQeU5OalhiWTloeVN6TlVWaGJWemp4blZNOXN1c0NlRTlsZnZPeWt6S01w?=
 =?utf-8?B?elMwdW45VWErRVc2STFNbFY1TGE0cWo1QXJUUE04Q1RXcWVCSytncGZ3ZGVa?=
 =?utf-8?B?eDA1US9JYjdlbkI2Y3Z5cmhub0lqK2ZCWkdDaUwxZ1NDUkE2ajE2MFY5UXdI?=
 =?utf-8?B?dVE1c09qbTI1Y0Z1WGx2Z0IrK0tGMFd2SmU2ZXJvV2FQNE12WHJReXdST0Iy?=
 =?utf-8?B?L1dQdWhzdjE3SUlJRHQ5ZHcxZS9rU2ZLc2FPL2dXK0FNZ2JCcnd3MXkrQmxL?=
 =?utf-8?B?amJjbVBhcC9ObHZwMVl0MVRFRUZJTmoySUF2N2l0WTR1dTh1SnprdEpZRis0?=
 =?utf-8?B?b1lPTmhuSEdNRzFoL1NmYUFNRk5oVExTQVZNdkF4WnV5Ly9ZYkh0VlltaURF?=
 =?utf-8?B?RFpGc2lzT0pVdFdINDIrRlY3VFVxL0VWa1lrL0VXZXFVRnlSY2psVVArRWJC?=
 =?utf-8?B?YVNkbzd5UjdqZWg0SGYxQXBLR3ZoVUcrcEFmMlhaLzU4blY0S0dNV3poYjZu?=
 =?utf-8?B?a2JqUGEwWVhTYzdzNkV2VmpYRi9ZYWZDd1FsRnNid0l0Sndkb0Z3WmpxVWdG?=
 =?utf-8?B?cHVCQmVLSmpWaEtkTWF3ejREWGlxOURxK0pTb0c4MjQ2aWxzc1RpeldoejBw?=
 =?utf-8?B?T1dPL1Brd05iRFhKNGdqZGxuTHNTOHNHVjNhS0NZeGNoZjJFSXRYZko3SDdJ?=
 =?utf-8?B?SG9HSXJoT2tMcmJkWlRrM2RKSUlIaWpQcW1wY0lXM2tqLy90ck45RjNsUHdJ?=
 =?utf-8?B?NEZnMHpuQzcxeFFwRzg5bDRydzc3WXQxMFRWQVR3R1JHOFE3dXl2Vlh1aWVW?=
 =?utf-8?B?V2JjcVRsakxYa3QyNHNCc0pQeWl2OWUxcndtUUJSUzJsamlKRDEvWHNXNzhS?=
 =?utf-8?B?TEVWaWgwWGJ6V1ZocGp1SUFJbk5CWkVQMTl5SHlaZUw2N1oxaUZCSExsVGZ3?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1FA74962851904DA858A523CAD268C2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4WjD9xedmqBIXj+9Jh1sPCRTw31UHolsxQTyf1vUT/vcbSO2KJA9w+3F93KFGN9rRTPpZgXJFp+ox80N+yUFwDs4zXgh8UNq9xXcKoWkw+ZsDNaUP34jJ62k97DSeqYcYrvtyhHF/gMBx8fvNbim5IN5uKfIRWi7b6ldCWU66l5GNH+00jVsImP+d0jjSy8lA/6eufS57WqLxO9JPPUkoQhS5Lwma7njIyoyf3UVaFkI8d90CuPiiPo816OjDZt+oHFSW5pNgTG72gpE5Qh9gWgvzfs6xXhGG5H8CS5+A/oS23vmgLdbxuxDNfl8bDEOBg1K2XYinVE896o1Vkb6yc2OBgYT1HvJtFQd+fztGddUPmcvJwvvZhcEv45oV6tbiCDyFK/julbqiJEGyl3zkoE2AV4d/isKuty1PhXdiaA0f9ZwWibgUhgM99YyfxvNkzFxRA4uOpMRJzgN5rbL44IjkYd/oMo1p4mjRo821r0QLzGMXtWerG/G5BIfOPYC2X5vmEZFtiHSzeDGtlLloJyiz4g+zJkTvV/eKlnU8DQCFSMtG40WbWiotxNHLV/wX+N7d1haGdDmRFSSQjJdIUPeZ587Epg7GZc7pXha5Opd+vzCgLB/QoKu+JLfzbl2a2kjrkadGGARaGIIH5KJhJSZvzV5Ot/YdWCr2kzinbM8YgEiICy3Od+Tk6yItgu/DuL/jb8CHkpYDxKQh3gG3v/uHWXUyI9BOkxjjz8RHIzMvqPDusdqNjjdUStuslpEYZl2L+3+xgw4vvnpbs+d/McJ2u0eUoChqkO6yeaswNHUr/DK7g0m2Wk2oLUUqap03vn5RXq+a8DTyY5NVlHYNGdsanuKiY+4tAb+j0wjfceMR6s0uy/j9YLV83OvREBGIfSeCiqRsS+wNF/OXp4ExA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd564b8-6bfa-4823-0fba-08dafafc79a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 15:39:10.5572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZxEZ+4+fUVc/ItmqJymIWxwEzQZUM0vTGe6qpBWQho4Tvq+DGtFVtlDKXRUC2UeioFaAti2uC4V7MWYctkdFhCFb8aQMigNgQYpo6aaQ84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4982

T24gMjAvMDEvMjAyMyAyOjU5IHBtLCBPbGVrc2lpIEt1cm9jaGtvIHdyb3RlOg0KPiBBZGQgYWJp
bGl0eSB0byBwcmludCBoZXggbnVtYmVyLg0KPiBJdCBtaWdodCBiZSB1c2VmdWwgdG8gcHJpbnQg
cmVnaXN0ZXIgdmFsdWUgYXMgZGVidWcgaW5mb3JtYXRpb24NCj4gaW4gQlVHKCksIFdBUk4oKSwg
ZXRjLi4uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vy
b2Noa29AZ21haWwuY29tPg0KDQpJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBnZXQgcyhu
KXByaW50ZigpIHdvcmtpbmcgdGhhbiB0byB0YWtlDQp0aGVzZS7CoCBXZSdyZSBnb2luZyB0byBu
ZWVkIHRvIGdldCBpdCB3b3JraW5nIHNvb24gYW55d2F5LCBhbmQgd2lsbCBiZQ0KbXVjaCBlYXNp
ZXIgdGhhbiBkb2luZyB0aGUgZnVsbCBwcmludGsoKSBpbmZyYXN0cnVjdHVyZS4NCg0KfkFuZHJl
dw0K

