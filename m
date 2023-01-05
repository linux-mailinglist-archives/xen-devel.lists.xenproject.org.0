Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D059365F078
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 16:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471969.732033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSUC-0006FA-LY; Thu, 05 Jan 2023 15:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471969.732033; Thu, 05 Jan 2023 15:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDSUC-0006CK-IL; Thu, 05 Jan 2023 15:48:56 +0000
Received: by outflank-mailman (input) for mailman id 471969;
 Thu, 05 Jan 2023 15:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDSUB-0006CE-MX
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 15:48:55 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7445aadb-8d10-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 16:48:54 +0100 (CET)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 10:48:40 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5699.namprd03.prod.outlook.com (2603:10b6:303:95::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 15:48:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 15:48:33 +0000
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
X-Inumbo-ID: 7445aadb-8d10-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672933734;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GtOP1m3e6y8lukYciiLXnlei1xaVG5tNYJ7a1NRQhcs=;
  b=Ip7VWfkCxH5OWRIQYhU8G2DiwjKxu0S74VXHg2goZM4z6An6Wfnlalrq
   D7hHyIROdR/YSIs1oxC9lhv3IRY9IznLKc1CF7iYThoTr1uHUxy1koAYK
   RTIvt2ddjPA+zKEkT6wI0ywlHT72ieG81mamLoEBdqn/Y6uBxoJThi08n
   E=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 90280575
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NvkHKKs+XvokwBFsJQ1dQyto1ufnVBNeMUV32f8akzHdYApBsoF/q
 tZmKWDQOKmIZ2T0f4gnPN6w9ExXsZbQnd5hHgBqrn00ESgb+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoQ5AaGyiFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCDkrTA+JmOKK352KQdFPncoDDsziBdZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4G9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzgrK4y3QLOroAVIB05VEHjk+S0tlS/a8xCE
 3MI5zgzsqdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLm8AQz1aad1gt9IsQjcq1
 VihkNbgBDgpu7qQIVqX8b2evD6pOSwYKGYETSABRAoBpdLkpekbhxbOVcpqEbTzgMf8Hzrx2
 BiVoCN4jLIW5eYA0KO9+lLLiiytvbDGSwc04kPcWWfNxgFkYI+oYaS45F6d6uxPRK6CVUWIt
 nUAn8mY7cgNAIuLmSjLR/8CdJmm5v+DNCDXiHZ1Hocm7DWr8DioeoU4yCFzIgJlP9gJfRftY
 VTPokVB6ZlLJnyoYKRrJYWrBKwXIbPIEN3kUrXfaYNIa50oLQufpngxPgiXwnznl1UqnecnI
 5CHfM2wDHEcT6N60D6xQORb2rgurswj+V7uqVnA50zP+dKjiLS9E9/p7HPmgjgF0Z65
IronPort-HdrOrdr: A9a23:3gm+3a6Q8E7sU8+CewPXwMHXdLJyesId70hD6qkRc203TiX8ra
 qTdZsguCMc5Ax8ZJhCo7C90cu7L080nKQdieIs1N+ZLWzbUQCTTb2Kg7GM/9WqcxeOktK0v8
 1bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.96,303,1665460800"; 
   d="scan'208";a="90280575"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2AjWK/FjdCHkKTHc70MNpqmIi2UqLLDrkZEdJ4XcPqDa+szk4tZr+I0mBwQeR9XXtLWuA6FTxcxTPHQsY8LVUKsXfU6W8TQS5urNBMVW8qkxUgYy9ubbiSUoizK+jVRoGCGCPsRIpbGDc7ULKPgsi5Inj8fHYs+XPJTo74EyX/NWcSqGhJzPHYPMwiC47lgwwijq475S93zQuGWI1yrtM0KAomBhT7aSiidpwcXWHKkEsx/ow1FzIv1Oz76Yt+qvt3HTlGbV1n1K2PHM80chghrNB6dTel7Z55T2yGgUqWXoGxVL7TUZeb1pQXjzine4qsUaSx8oxPl35ct31m64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtOP1m3e6y8lukYciiLXnlei1xaVG5tNYJ7a1NRQhcs=;
 b=a92T8A40IUUpJtN6helnwLbzKwD2485aLZ0IUJjOEbJqyizu4/IOOcRr/e6Wju52pniqyeF5Af7TR73Lqv44025i/PCiQCEYW3Z3/Z24Z4oUalctAEZJ5NNcllxxMwuei1tzlm42bwnyCL7Ubt8FGK+UyCVzbqzSacbCAA9IAij8uh+W3F/a5IzzFbFhsGIpXY5EgKvg+E6ST7jDp9ZStSUDz3gjlxRRO+v5Y5NggdnLXp4gaGz+AIUb3XffzecR8tu05d+Zy16ggO/YpCmEhzVOboRFlJRgryd77OpLb41sBRESU+c7PMzVTsfRXHgy8MqTvpg3g1FrJwjbZnTeRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtOP1m3e6y8lukYciiLXnlei1xaVG5tNYJ7a1NRQhcs=;
 b=FL3F/KTjNwe4EiwTy1E59VF2aYHgjg7COUG0H4wQH807Cnpg/aGRWRlNyitYmp1t4v9mBCktnwLr87TTBVNZ26mHPnvvAWHLKePsj5UWwtfx+XzGJIeO+qWs1AnrcJcp7M6GFNnLi3vQRgLNR+0YvYjCzKfLU7byvfKX/IsHfQQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/2] arch/riscv: initial RISC-V support to build/run
 minimal Xen
Thread-Topic: [PATCH v4 1/2] arch/riscv: initial RISC-V support to build/run
 minimal Xen
Thread-Index: AQHZIP2Dn/VS+v8CxEaK8nfj7fmLt66P1KmAgAAjsIA=
Date: Thu, 5 Jan 2023 15:48:33 +0000
Message-ID: <01888162-49fb-a280-a088-5e81edff3919@citrix.com>
References: <cover.1672912316.git.oleksii.kurochko@gmail.com>
 <ef6dbb71b27c75fe0dffb72d65ab457d27430475.1672912316.git.oleksii.kurochko@gmail.com>
 <591d6624-2bd2-93f0-f5d6-760043230756@suse.com>
In-Reply-To: <591d6624-2bd2-93f0-f5d6-760043230756@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO1PR03MB5699:EE_
x-ms-office365-filtering-correlation-id: 5a4eae3b-32bb-42cf-c9bb-08daef344d2f
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SBpXQ9wKeImxtbTvohm4xlTVRKGqZT0z3FppNE+LXj9jnKncPtFiOIKlFP8ghvOZCJ/mXf00xIsMzUfhjqAg6b5gM7UHUktrSBD690FfdVOJegX+tgQRbWnZU68ZIvdrvE9Ut1lMsTICITMNumG6/E2ilAjDCMsYJygNcM9zOc7hbmEw7CLqvKjx3gfpEyywL8NpmITjx2cZmBhYmk2I00vlaJWuK81Mjj2r3Cm1KAHTrptby02BEkOGoo9AOAkUaOJjffqM9bPmHXgf/xHF4hb7OnbLihbZI2jC64RJDlIDnVZPkfiT4wMkDQqwWHOd4oWXaAqX5fkiW1F4befUJIxinW+8XIuKM9Og89+xCwWy/PQ72UthWK4PPU180drBH5VEyD9GWdXjAnPBEidvastsH32rQ7taIuTAeK4vZrETufQb2wm7Y+a+0Kf6rR6T9CFODWyRYEGWT6Lh2F2XSRsFvtL7HYYN2UR8szHn63SvI9iH0CTgzTCoIgxLbmPz7SMZR7O9JDWUMBSDcIZjuuOh8ZhxQ+slt1d1gsvv9c5PkznXkjw9Hr54sW5AhCn6ZWRSuPqK9CXsZWTdz5yCSFmNjPKwY5PU60BcIZ2bnlFIK8axJV89S78Tb5YXt5MUrT4+agDw2l53Fl4JkJdNx2+H6py1NEEytC23FsXuPT2k2EqWMRGaPmt7fKwqDVGP/cmFmHIfKJkvqySzEOOv56wt5hKdoO6lQ+cy4BIywtCARr8xOga/ARoVwSgUXlReiAapsbTiXd5dAL7j6O4rgA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199015)(6506007)(478600001)(53546011)(122000001)(31686004)(38100700002)(82960400001)(6512007)(36756003)(26005)(71200400001)(186003)(6486002)(2616005)(110136005)(2906002)(54906003)(38070700005)(316002)(66946007)(8676002)(7416002)(66476007)(76116006)(66556008)(83380400001)(8936002)(64756008)(5660300002)(66446008)(91956017)(31696002)(41300700001)(4326008)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXlrOWxrZHk2UDEyaFJZTUNNQ2UxTzducXRjRnJvNmh1c1pWWXRqVzJhbjJE?=
 =?utf-8?B?RFNWQm83N3UwVStKMEJxK1NuM0ZuSFcvYUNlM3RhQTFXaEpTK29WUFl1YWtO?=
 =?utf-8?B?eFltU0gzOWpPbjc2OFVIMklTZVJWOFpFUDhlaUhhSi9JYStnTnRMbmo2cU1L?=
 =?utf-8?B?eko1QWV3WXltdFdRWHV2bXQySWVYT243UGlXc3dwUTVZOEZJS09YQ0pHMXcz?=
 =?utf-8?B?TklCVmhoLzluVWYrWHVIMEhNQjlZM2lPVkN4eXplYzl6VGJrSHJ3Y1VxMEgv?=
 =?utf-8?B?eHZ5cXFTZlVaY3VNYW1xVjZ4YUZWeTVSTHNDaXBwNjJpWnpIMTZ3a0J5dEpB?=
 =?utf-8?B?bURza1MwU3hiMlUyK2haTFBqS1VVVUZGcktpdHFmeUpFbHdibGJCb0xNVlJO?=
 =?utf-8?B?MC8zMUNJNGYvWWl0NlJsTFllQllZYzJoVEUybS96ekFqbkdldmprblNlSDNp?=
 =?utf-8?B?NVlrRExCRDNGTVhDeGRveVlMWDRkd01WZXBsSU5nc0lIUHU1Ry94blBhdENU?=
 =?utf-8?B?dnl4b2dOdnJURlUwK2lsM0dRQy9FdUY2TS91WEx2bzdHRUZSb1RMU25qYUVS?=
 =?utf-8?B?MGc4YXZFQ1ZLZnJNSThQcW1sTzBvMnFKak9iYUtqbXpPSUFUb1BmWmRrM0x5?=
 =?utf-8?B?ZFVibmhQMU5HRjFQU3VXNzZBQ0ltb21XSlVRd1prQmNJUWpINmNKTG9HZzUw?=
 =?utf-8?B?MXlUdkJGSlpIZ1RjdnRCNUpIaWNwRmgxOTltcXFDaXA4amw5VUcvK25YKy9y?=
 =?utf-8?B?L1had2pvYytQSmFqYXNGWE1xMkwzaUM3SVhVeWtVRlNwNnlGaUgvaEdOZGpJ?=
 =?utf-8?B?akdSQkN0YlZrU3hBKzFDZFIxY2VYdGhVNjVpWk1yNkpkaUlnYmVDa0ZmRVVH?=
 =?utf-8?B?L0N4ZU0vSy9yRThaK1NQa3FXcmxaUFM1TFBRVjlLalkxSFJ6aGh0TUhVZ1dD?=
 =?utf-8?B?a1lYTFdsVUFpUGZiNENOMjJmRkowNm5kQ0VSeWNDZmhOVEJkN3NKUktZNE1n?=
 =?utf-8?B?cFFIQzVQa0tRb1NIVGhxcGhWZlh1K3RBY2tqNUkyWnBwSVk3NFJmRkRmcDlE?=
 =?utf-8?B?dHVrbGs3UU5kSjlQcXV2YkhjMVNQd0dJbjJZd0N5dzlmV2hYTi9IczhoaC9V?=
 =?utf-8?B?bVBSSHB3U2RDNVBVNThscHQwblk2TWlDUmJGK0diWDFNYzdMY1FNN1lWdjB4?=
 =?utf-8?B?WVBlUmxMa1QrQThybzBaVWZGZm9SdEZIcDhFS2dQOHZwU2J1RmsrZk5FeDFt?=
 =?utf-8?B?SGcyWjZKbW9SMDY3aDJqSEViREpiSjBMZXViL2hFYW95WUtJbjVqanczVkhx?=
 =?utf-8?B?S3V5SUkwY3g1RHlWb0lsbW42RzdLaUhCZ2JOaHBHclgydnp2T1h6eXlXaCth?=
 =?utf-8?B?aUFPazVVb0FBWm1QTnRGZ1hhb3luNm4xb2NMREVhblNaMHBBOEl6Sy9MZmZl?=
 =?utf-8?B?ekw4d0xXcnV3c0xYV0tqd3htQUNCMzRmeFdlVDlhRU1teVZnY1NDVk82cUtE?=
 =?utf-8?B?b0JycXVhcnhjOHZ2ZEdDNW9UeWg1cjBtU1FjK2dwYjQ3NVM5NE5RelVnRWVv?=
 =?utf-8?B?VHlKUmZmVDVrNWY5MVp3ZklUekRPdTVLcGZ0N3ZoVmM0ZWMzWUswQXFCRzhQ?=
 =?utf-8?B?dGM5bGtYRTExNEsyL05uSDhqbnJMVWsrbGs0dzRNc2NIM3cvV1BRRnZZSnM2?=
 =?utf-8?B?aVhGK1czUW1lcnVzTWg4cVVWVStodU1zWnFOZ1BMdi9wdnZTSXBEYWxhRkNl?=
 =?utf-8?B?ZFZRL1B6K0FKSFJXVnJBYzI3RUhLbGpkMGJ2bHU3VGtqNGJVS2JzTVVLbEFL?=
 =?utf-8?B?ZXNSL1owL21HbGZzNzhKWi93anVqTFQ3WlNOMWRNd3JRekxsV3RWRE1BNm9n?=
 =?utf-8?B?Lytpc3Q3dUFFbWl4bXZpNFZueEppVGY4dmpnR1JpWkhuZlZVVGF4Nk9TOE5q?=
 =?utf-8?B?eHFpNUlOKzloa0Jpem1Vekp5MzJTVXVpYXkrNW1tU2FDZ2k3T0ZGUllvZGQ3?=
 =?utf-8?B?UmNQMFNoWVR1UGZMSXNaTlhuSUtnOHd4dTBjUDdibGxXa0RjSkJRSk9leWV4?=
 =?utf-8?B?ejZmYk9WWEhVUEtzUG95N1dLUGk4QTJ5VjgxQlZFZzZTTGlSOTlyQlc0cTB5?=
 =?utf-8?B?VGZnZE81UW92M2szZ0Y4eFVoWm0xMitMNUhsbDFpaW43WVFSVkFIQ2NveHJm?=
 =?utf-8?B?bnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B62CF006BFB63A42930C93E4028879A8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?RFNFN0x6Qk1XZTRuME5TZGF5ZmpkbzRzVzRxbGJGeGdwb1FhaVhTMnB6UFAz?=
 =?utf-8?B?UFJyS0Jpdk8zbFhMWWZPNzRDbmV0cUlveE5VQ1NMZGxvY3Y3Z3p4Vy9vbUpW?=
 =?utf-8?B?WUJhWUIrR1ZNNkUzaWZzNmRaU1NTTDBHN1hkNDUvWUdGQmorUVY4T0lHS3R6?=
 =?utf-8?B?SmhFbXdzWDY4V0FXcmY2S2VBWnRkZThpZDBSdVc1THk0SGhHeUJaOVNoalFx?=
 =?utf-8?B?a2tFMnl5aUEyVGVuMDZyNGNPdjZocFd3OWtQZEU1MENqTnBRQkFJVFo2TGYr?=
 =?utf-8?B?QWtDWFQ1WktRcHNKamxtbnZ0c2FCbDVoc3h1N2hGYVZmeERsWXA1cTY4aEI0?=
 =?utf-8?B?RHZIeXk3VXNEK09iZ3dNV0s3aFVQVFhHNWdVelJLeE9IREFRdXVVRXZEeTNp?=
 =?utf-8?B?VzZiaURqR00xU28yZDVJUmxUUGhHSWNaZmFEVnM5MEFUaTZjRlQxSlIwcmJq?=
 =?utf-8?B?NzN6djhqYWQyQUpYR0kxcmxPRnVKTTkzcFEwVStMQThzeVpGQm51Und4YlQ3?=
 =?utf-8?B?eVMycmRic1ZzTE1sWWVvN2pPNmorYTlhRHFpZ1ZYUk1PYjRJQzJnRUllcStZ?=
 =?utf-8?B?Z3FtMlZKK0s5QnpYNmFKQzRrb1VpalVaNVlRdTloQzJoZ0pPR1l1eWUrekE3?=
 =?utf-8?B?Wmpjb1Rnakt1UjgvdGVwWHJBN05IZXZoV0xPdEkzSGM5SHJDS3I1VEhyeW5i?=
 =?utf-8?B?Y1hXR08vS3hwdVZTNmVKeXRtaU5SMHJXMWlkN08xU2U5QUdaT2Z4NnBrZ1JG?=
 =?utf-8?B?YUd4eW40YkFmSjIvSmdPWjFLZ1BvSHkxSEQxZVY3RVYzZW9BeWV6SHc0SWFJ?=
 =?utf-8?B?ZVF3bHh3Kzk2RWlGWjlqUmpLeXhuYTFIWUI1Wk4wMHdpWHZyb2xQMEs5RDd0?=
 =?utf-8?B?M3loa29yTStnbE51UHRJcHBWSjN5Y09seEtua09sT2gzRjRJd3VzK1YyaE5S?=
 =?utf-8?B?OUcycjIwNHQ0RnIwMzJwMEpoWnVwN0VIYUpqbHFFZXRNdHVIMWEya2JJVHgy?=
 =?utf-8?B?bGNLY3JMVUJKNCsvNUhGZGUveEZuL3lXbnNkZzI0Zk1kMlZ0dWZkN3lnbkpN?=
 =?utf-8?B?enU4QWVIWjZaSEtFYlFLTytqSFBYclRCbzhpYit0NnhGZGlRSUJzRlVtcHNo?=
 =?utf-8?B?aDcrZkRVSTBsMVNoVm5RTTRKdHJDZk0zVWVBSjRJaHdKY2NGZzM3MnBOd3N4?=
 =?utf-8?B?Q1pWVXhlSHlvSFg5WE9YeFVNaWJWMlJvRHExam5aK0V0NVY2a0pMSE81SWNK?=
 =?utf-8?B?bllYUTJqeXE3Wk11bUREb1RJSkY2YnJHSmFwQUY2U0Y2Y3F1bDNDeWpPeFdM?=
 =?utf-8?Q?Ij0niykTwlJ5c=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4eae3b-32bb-42cf-c9bb-08daef344d2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 15:48:33.8193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pfThgX/v3jfMuzlD55NpXmHzK4VtlAue98gy/5IbuTRT0Pv8e9JlxFuysHHypYEGADwjZXbIrgUcvoF/dR95UivN4jmbQXp74LDltiMOTXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5699

T24gMDUvMDEvMjAyMyAxOjQwIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMDEuMjAy
MyAxMzowMSwgT2xla3NpaSBLdXJvY2hrbyB3cm90ZToNCj4+IFRvIHJ1biBpbiBkZWJ1ZyBtb2Rl
IHNob3VsZCBiZSBkb25lIHRoZSBmb2xsb3dpbmcgaW5zdHJ1Y3Rpb25zOg0KPj4gICQgcWVtdS1z
eXN0ZW0tcmlzY3Y2NCAtTSB2aXJ0IC1zbXAgMSAtbm9ncmFwaGljIC1tIDJnIFwNCj4+ICAgICAg
ICAgLWtlcm5lbCB4ZW4veGVuIC1zIC1TDQo+PiAgIyBJbiBzZXBhcmF0ZSB0ZXJtaW5hbDoNCj4+
ICAkIHJpc2N2NjQtYnVpbGRyb290LWxpbnV4LWdudS1nZGINCj4+ICAkIHRhcmdldCByZW1vdGUg
OjEyMzQNCj4+ICAkIGFkZC1zeW1ib2wtZmlsZSA8eGVuX3NyYz4veGVuL3hlbi1zeW1zIDB4ODAy
MDAwMDANCj4+ICAkIGhiICoweDgwMjAwMDAwDQo+PiAgJCBjICMgaXQgc2hvdWxkIHN0b3AgYXQg
aW5zdHJ1Y3Rpb24gaiAweDgwMjAwMDAwIDxzdGFydD4NCj4gVGhpcyBzdWdnZXN0cyB0byBtZSB0
aGF0IFhlbiBpcyBtZWFudCB0byBydW4gYXQgVkEgMHg4MDIwMDAwMCwgd2hlcmVhcyAuLi4NCj4N
Cj4+IC0tLSBhL3hlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NvbmZpZy5oDQo+PiArKysgYi94
ZW4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb25maWcuaA0KPj4gQEAgLTEsNiArMSw5IEBADQo+
PiAgI2lmbmRlZiBfX1JJU0NWX0NPTkZJR19IX18NCj4+ICAjZGVmaW5lIF9fUklTQ1ZfQ09ORklH
X0hfXw0KPj4gIA0KPj4gKyNpbmNsdWRlIDx4ZW4vY29uc3QuaD4NCj4+ICsjaW5jbHVkZSA8eGVu
L3BhZ2Utc2l6ZS5oPg0KPj4gKw0KPj4gICNpZiBkZWZpbmVkKENPTkZJR19SSVNDVl82NCkNCj4+
ICAjIGRlZmluZSBMT05HX0JZVEVPUkRFUiAzDQo+PiAgIyBkZWZpbmUgRUxGU0laRSA2NA0KPj4g
QEAgLTI4LDcgKzMxLDcgQEANCj4+ICANCj4+ICAvKiBMaW5rYWdlIGZvciBSSVNDViAqLw0KPj4g
ICNpZmRlZiBfX0FTU0VNQkxZX18NCj4+IC0jZGVmaW5lIEFMSUdOIC5hbGlnbiAyDQo+PiArI2Rl
ZmluZSBBTElHTiAuYWxpZ24gNA0KPj4gIA0KPj4gICNkZWZpbmUgRU5UUlkobmFtZSkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+ICAgIC5nbG9ibCBuYW1lOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiBAQCAtMzYsNiArMzksMTAgQEANCj4+ICAg
IG5hbWU6DQo+PiAgI2VuZGlmDQo+PiAgDQo+PiArI2RlZmluZSBYRU5fVklSVF9TVEFSVCAgX0FU
KFVMLCAweDAwMjAwMDAwKQ0KPiAuLi4gaGVyZSB5b3Ugc3BlY2lmeSBhIG11Y2ggbG93ZXIgYWRk
cmVzcyAoYW5kIHRvIGJlIGhvbmVzdCBldmVuIDB4ODAyMDAwMDANCj4gbG9va3MgcHJldHR5IGxv
dyB0byBtZSBmb3IgNjQtYml0LCBhbmQgcGVyaGFwcyBldmVuIGZvciAzMi1iaXQpLiBDb3VsZCB5
b3UNCj4gY2xhcmlmeSB3aGF0IHRoZSBwbGFucyBoZXJlIGFyZT8gTWF5YmUgdGhpcyBpcyBtZXJl
bHkgYSB0ZW1wb3JhcnkgdGhpbmcsDQo+IGJ1dCBub3QgY2FsbGVkIG91dCBhcyBzdWNoPw0KDQpJ
dCdzIHN0YWxlIGZyb20gdjEgd2hpY2ggaGFkOg0KDQojZGVmaW5lIFhFTl9WSVJUX1NUQVJUwqAg
MHg4MDIwMDAwMA0KDQoNCkJ1dCBob25lc3RseSwgSSBkb24ndCB0aGluayB0aGUgcWVtdSBkZXRh
aWxzIGluIHRoZSBjb21taXQgbWVzc2FnZSBhcmUNCnVzZWZ1bC7CoCBUaGlzIHNlcmllcyBpcyBq
dXN0IGFib3V0IG1ha2luZyAibWFrZSBidWlsZCIgd29yay4NCg0KVGhlIG5leHQgc2VyaWVzIChi
ZWluZyB3b3JrZWQgb24sIGJ1dCBub3QgcG9zdGVkIHlldCkgaXMgb25seSBhIGZldw0KcGF0Y2hl
cyBhbmQgZ2V0cyBhIGZ1bGwgR2l0bGFiIENJIHNtb2tlIHRlc3QsIGF0IHdoaWNoIHBvaW50IHRo
ZSBzbW9rZQ0KdGVzdCBzaGVsbCBzY3JpcHQgaXMgdGhlIHJlZmVyZW5jZSBmb3IgaG93IHRvIGlu
dm9rZSBxZW11Lg0KDQoNCkknbSBoYXBweSB0byBSLWJ5IHRoaXMgc2VyaWVzIGFuZCBkcm9wIHRo
YXQgcGFydCBvZiB0aGUgY29tbWl0IG1lc3NhZ2UNCm9uIGNvbW1pdC4NCg0KfkFuZHJldw0K

