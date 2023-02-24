Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA866A2018
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 17:55:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501325.773009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbM2-00032J-By; Fri, 24 Feb 2023 16:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501325.773009; Fri, 24 Feb 2023 16:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVbM2-0002zG-8m; Fri, 24 Feb 2023 16:55:30 +0000
Received: by outflank-mailman (input) for mailman id 501325;
 Fri, 24 Feb 2023 16:55:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVbM0-0002zA-AM
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 16:55:28 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0874ffdb-b464-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 17:55:26 +0100 (CET)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 11:55:13 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH8PR03MB7272.namprd03.prod.outlook.com (2603:10b6:510:251::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Fri, 24 Feb
 2023 16:55:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 16:55:12 +0000
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
X-Inumbo-ID: 0874ffdb-b464-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677257726;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EgvXkmbAXRbF7IYHg33OHVD/L4Qy8VD2nB09+l6reD0=;
  b=UzuglqOaYYU5rGbHX9xlL4GNGOe0MhVi8mqRuwhLBBr7tr8JmPX1oFqT
   xfIe5jAyJrLkE53Is3uDQgrz7f20IRYzfLBQNyzLMOs8gdxFJm1Y6wGA2
   87GUKFuO6P7jnqizIXprUtIJ1bkgb8nsqWI50UF2SPICXFiY4HL1mX9mh
   8=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 97825106
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:tycfZqs0FxVW5U+HRyu4VXlzTOfnVM9fMUV32f8akzHdYApBsoF/q
 tZmKTrXbP6OajT2e9ojO4vgpEMF7ZWAnYdmTQA9pCxjRi9G+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWEyyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwA2AUVxuJ1/yMxeigZfkytNoMB+TII9ZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xbLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ReLorKMz2AP7Kmo7LAI1TlKe/fSF0BCQdvlDF
 0gSynsAov1nnKCsZpynN/Gim1aDuhMfQNtRVe4n8gaGyqnTywmcD2kACDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vX6GDj2x
 y2BpQAkhqsUls8N3OOw+lWvqzirrJLYQxU14gjSV2SN4QZwZYrjbIutgXDS6fdbMI+YVB+Pp
 nECkMmFxP8CBteGkynlaO4KGreu5fqMLjzHqVFqFpglsT+q/haekZt45Th/IAJsLZwCcDqwO
 kvL41sNuNlUIWegarJxb8SpEcM2wKP8FNPjEPfJct5JZZs3fwiClM1zWXOtM6nWuBBEuckC1
 V2zLK5A0V5y5Xxb8QeL
IronPort-HdrOrdr: A9a23:7TsmI66IPfuzx6aczwPXwKvXdLJyesId70hD6qkRc3xom6mj/P
 xG88536faZslwssRIb+OxoRpPufZq0z/cc3WB7B9uftWfd1leVEA==
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="97825106"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpCoffjM6zkDa/6CZrmX2JhVhAWG03XFdEfO7whCPmKD2pbqVbfc2t+e7xGbtuUtR/c1L99ApsUP9vRMSbdU6UJO3t1C6CKyKOwaSAGQmJym0g8sPz4q6cGpIytE6uVemKWJt6txxn3mMQQ+7qIZdLVQPfHE1P8sZG2tc03tPA4lECQJMMZJZ674o19cdws0PZPmG0QK4VrsBmNJkYZLgGN5qDZQsv07ysvhHb7BQcARFW1QZ7Oyqg/iPY1h4AiH3NritHTGeHYr3G4V08XiakwacVATwutuYCHIRAorYwvvzGzHqdZedFn/qOCPEkrh3T2xJxIZi18DloKzREU1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8AsOnkZ93FKjt7dyr38w2/7YTVfOQDe1xEzpKG63yk=;
 b=AvAcCaDnhTcPGd+/NpgxaJmnnZoyLOzTNYzyBfmcHUk7sht4doStRs9kKkEbmbYtiFpLei6uLfmBt6XJqag/KnrPoagYoA+tSBIK3rP/C5y/OS7PMNiGMbDBlfMYO9X+X9F8QgnyzkKS4TaWX+fVEwbsYhERUjW67qnPKhSq+Nntz6HvzIYJ8a9TdV2jmbCgjADFe7KIGfMfmTomHE08WpSrk5jLkf+Mvvpc8EYtsC20TNIsOENlKVe0wLjtqhp0epv20fa2EQYCJ9kmLh8DZzgccNE5Pl9bzgGQ7b7eW62oTzQ8elHAtgrdd5i0Eh95G51iHxw7YFGmUdudQkl7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8AsOnkZ93FKjt7dyr38w2/7YTVfOQDe1xEzpKG63yk=;
 b=Y5sW99n/9rAOCLQuB9C48jljKuxZk4iNXccqopRKkiY+p7PDwl8/PJ1W7wKPnOfMybEz+nxtDowdEiVS8BTWuZ2Skd0chtBNlClNdaeESiNDelwS48VR1F3cqK4XJTShuj5BsMMv6jAs9213yMsUcot3R3NCseElKHUqnVviFrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <349f4817-ab12-b648-a0d7-76ed4aaafc74@citrix.com>
Date: Fri, 24 Feb 2023 16:55:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/riscv: init bss section
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <134bf758ecd93deffc6623605a8c020a17f64be8.1677249688.git.oleksii.kurochko@gmail.com>
In-Reply-To: <134bf758ecd93deffc6623605a8c020a17f64be8.1677249688.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH8PR03MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c25950-32ed-48a7-b2b4-08db1687e4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oDJeIP6cobyaD3TMl97lHBc5EukbMD22SZ1Y3Er0BvHqJZFBMSSOcP3lrwT47S0GkC/Sq0/Za6wrkLN0U/GD/BZCfY9se7j8/UJgv9KMBLfVKkH8A8nJOVzGVm/vu0pydMr6Nic2NhCmaEoFwgF9BRx7h8DyL/GJGD5XdsiEE14KY0OENEmr2nMsDBf83cF9F2iYvVNILxYSJCb0TCSqreuLKtQbOnERrdiiXULN+3HG8EKTFDvxYPTPeOKroRDQzFbouYyqGt8MDH80bZ74Amf60QCjCkYB02H/o832B7QjN0g4C5xI/1cp20JOGf+7xPUHXCpMs3DByVC+B+IL+B7Bc4hNCRLMgmXuHS6GV5V3AfC8TLisA5TntRjtkGtkY2+7UOef4koqMUpHtgrsJ7qpGpnZYhWqtGR5Q6yYfhIW4l2Rsty63J3kYyd4q331hCAzpeDOlQql8sL8aCRnfzsTNeCt5E9ABrYE3EC+CZC9iorGRYyDPh1eUKerFZfAEzsjmxaTLlGbPu0HdWb7HXvXKtGUhK4QWPP+RJn06o8rVIcOmTwp6Yznxx3Ox0loDVDhf1ShcKIyc36q4FQ9pCvo4x8Vd/ZoOd72A/BGrHUPEneoX8YcZ3ovD1Z8dqFczUVqfB7otJ8nHJ3dbaSf8BRv7CvSXVZKlSD3PKRGVt8aQv3kdrGmkRumcaKCoDrqybS6ldRQaDleyoHdEdN8ZAGS8gBkSaWmiO4S/uTaed4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199018)(31686004)(36756003)(316002)(2616005)(478600001)(54906003)(6666004)(6512007)(6506007)(53546011)(6486002)(8936002)(186003)(83380400001)(26005)(38100700002)(2906002)(82960400001)(8676002)(66556008)(4326008)(66476007)(31696002)(41300700001)(86362001)(66946007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHQxNjM3d0ZXS0pvTVI4bXlvRmxudWZsWVg5OTYyVDdBd1BySm1mSDBtcU41?=
 =?utf-8?B?bVJmSzBqZXBsZlhkSVBRdTZpaHhmaU0wNGpCMzlqaDY5cmxmZ1ZSTDZxQzhs?=
 =?utf-8?B?cUd1NldWQUNhUE4zYTAzL1FzR2xndmpkeDRWc3l2ZlppOEFKTk1IbzdRcDc2?=
 =?utf-8?B?NU5UUlpJZmwvSWkyUm5uejhGdnl0TWZGeXZSWG1USUVWaXNvSEoyRDdnMTVI?=
 =?utf-8?B?eXdqM0NuRnRDYXdUT0JzcXI3d1hUbUVXMzBlQzNTS1dnVDRGZWtHQzVQSXB5?=
 =?utf-8?B?Nm4xUXFPeXlzSm1CVlJGbWhVa3Zna2lrK3owTk5sNFJsV2pGeFFYQzlqcjha?=
 =?utf-8?B?blhULzFSa091UmsrZGh0N2ZYZGNnUE10SW5lbU5LUDBZTUdPcE16VTF3dklW?=
 =?utf-8?B?YVVRS09aeXVaNDBBY0dWZVYydjh3Rmc0OTdTQ3UreFZrc0wwVlYxWFBwWUtm?=
 =?utf-8?B?NGlTZExMbCs0RUVmekhnSFpWYWRkN0FEbmtQbS9RTmVtRlFUYVpxMFk2VEtm?=
 =?utf-8?B?NXBBeFlPKzZYbUQ5am4zUW5JN3hrZ2xwTnNyNkpJdDdFVmNTRTF4QWU3Qm5L?=
 =?utf-8?B?RjErWXZiRWIvdVc1Q2FmaTJhNHBESHpEVHlNREdjQ1ZJMWN4dTNDcWRUY0xw?=
 =?utf-8?B?UWxsTTdOaG5mc0RTeEVpOU5kQ2x6VU1sdjc0NzFXRzlzTnJ4eVRvNXBjcDcx?=
 =?utf-8?B?Y09Gc3ExNzN5MEltWjBHbUZ2a04vQkxoelkrRkkyQWZELzc1Y2JOckhrMGhZ?=
 =?utf-8?B?blBNRzArMjBlaXhXSGJnazhLeWp6ZndMOTVuS1FJRzZ3YUdKaDZYVFBXdUZo?=
 =?utf-8?B?cnFtUnR5NnV2QnVyOWY0UFp3bmwrVkpvY1BkTHo2cnE3R3lmQTJXVDgvR1lU?=
 =?utf-8?B?TWZ4aWpnNVdjTk1GSXJqeFJxcUJOQllBWUtGQjgyc29PdjZBT0dEcGVjbDY4?=
 =?utf-8?B?VmJBNElzZ3JjanJWSDVkYkVvOUE1YUpuYWZNREcxUExZcW0yaHExdVQzd002?=
 =?utf-8?B?M0NWaGwzNUV0b0xwYUNrZm84QldoMEROczlKV1c2elQvbXFMZHo0aVJWSkxJ?=
 =?utf-8?B?a0FzRnFtMzRwUHdPeVZqV1RIS3YrdG5YSWhpUDgvQ05aKzJ0R3loQzRjRno1?=
 =?utf-8?B?THRoajcwbFhKSC9MM2NXQkJ5cWxFczV5TjlTZEdveGsvQXljZk83VlJieEhx?=
 =?utf-8?B?dWJUczhzbjZ0Q2o1Ny91ZXNHQ1BPOXJRQmZrdmFJK3orWjV1cUdNQk5XL2RG?=
 =?utf-8?B?TUc1cGNGTGd5dmJObUdNcHB0OFR4YWc5cEdsbjhvazViSno3NnpIUk9qdXRj?=
 =?utf-8?B?eFVWclJTS2ZEV0ZBbm1COUlma3NyTXUzbW1kRTBVNktkQXd6NU1vOGIveVZl?=
 =?utf-8?B?d2o1UkpWZUxtQVZHNEFneDE4TmVaNWp2STBNMW5SZHhNZ2FzNkp2bkswS3lv?=
 =?utf-8?B?MlJ4WjZteWw2VjBMNk00REhMZmZWZFRTZDlQZnY0ZVVrdWJpb2NIWHRDVGNs?=
 =?utf-8?B?VVJwdkluUEpNZmVMeGtDckdweWgzaVU4RHh5ckQxK00rRFpnV2dWUnU1UHVr?=
 =?utf-8?B?Q3JiaTlyVzg0aXN5SGt4TjZqZ3Q0ekFYeHNMOTlZL1VwWTNzNVY5Nk9zL3BZ?=
 =?utf-8?B?UzA1WHAzNGZFNVI2SjdGUTgvdVRMOWx1aHpwZDcyQ0lBNkhSb2NGZm4wdWYy?=
 =?utf-8?B?ejJkM0IxWklFMnNxbExzS1J6R2tJZFVFNjZCWEltdG90eXJrWmhwM28vNStB?=
 =?utf-8?B?SmZwUUV4Sm9PVnRJMWRRb3JrNjBwZjZRTnZxNFk4MklLWEZWU0RNMWpOVTN0?=
 =?utf-8?B?RHhCK3ppb0ZweUYzajR2OEtFcXBFRFQxL0RvcmxBall6RTV0VllDc0F6QUhD?=
 =?utf-8?B?VEhOZHNkWGQwTUs1K1FOYXVLd002QXU5dUNLUFEwTGlvUmNCUEEzSWlxeEVq?=
 =?utf-8?B?Z2h4YmtZbWx3Nk1Eb3hSVUZYM0QrS2RzbzduaUZWZDJGQ3VuRXVLRUF1bkZs?=
 =?utf-8?B?ZXJqcHVFOWFLRG8zSC9SNmU1VzBKdXpZMmdYSVowcHN2a0tFZFJCd3M1ZFVM?=
 =?utf-8?B?c0kzWDJSWU1NRUhhT2tTb2RTeXl5TWlGVmRtVjBQb2NBbWVpMXd2VHFaV0My?=
 =?utf-8?B?dEtBTFUrUUxsZmpmSHZuVk50Q3I5OGh5dlY5cUsyRlRsMkNzMHM4dGx3Z0Yw?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ir8apWen7INWyowzZyo0T2S7lADjgo5U0Q4UBajpqSyfRu/2Cz8dnPF7lJmXwDolILEublYgEQvazYGmCfSLul3nWmls55U9g/aew7hRx2R+6ubLGupLifEHaBbAEHRaZ1YPyhw1d5YIS1+fFcB4UKzWleqXzJtUyOZ27U1nF8zydrwHrBekZDvKTexzXu6He7f8mt/+AUJfPSf02wo+JdCGjABD/bPuEC9V51xhwpPABD8Cj2C45TyWknrpSuHK5SLTnMXBkWeZhpecL9YUb60Ly+XXcdN/sKIq7XhAzsld4kXfLdYFFktgjABc34n5spKmIbTcNjWreFyEuSGVXgLWKJvld8C2WiqfmCdSi7OqbOc6I8UbMtEGxp5LI04bkpULt4MIhUXEqpOOS+3vckNa3JGUcNM92nVKwFm5xvHQ8vqm7daoefhVihv+FAgxlyok/zC8Gb04sTVXEjOnwgLprrNy+onHDeJ3LCwPEOr8JXz3UWCsaMnlZD2qUool1L1A1EewipgUHL8oGgZfJ6SOnJspEE8Xffx86hGQZEDom9yJWmgzWwHbKPL7SFE1gS3hm2KYMMeeamplGU+fgIMCp9AiUaqu8JCiDNVta9nXJC0gKZAgVOlb+xNKL9kK8iqV2K3TT0grqfXo5kiAl7jTIdhpYTI3uzDiFldFLBItc1N8uIcTFDU46VoAASQDqolibV5+HtppWf7f1QPBw8QZRHma4pLL3D7J2LModv/Hka0ktIaUGTOazW5sVnsyNB51cZfl7lTbeA1s9mufFdHuzzcG1NziOMi2OIjtN4mpSJnmmDcHvDQ3Pri0Vd8vUrPesR02XWGRnUUsOynUrkKxtCLIIDVlIQBe2XUbgaD8KLlK51NwrlJ7+ZSWJFdUrokBvNuNcEc7KoduVYp4BA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c25950-32ed-48a7-b2b4-08db1687e4f7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 16:55:12.3078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4BXPFXNXON0UtfZMZLUEbeibTb/gZc+THTX+Cfwc3ss6TTOCs5ziO9oSDScSIN2Lfvhw/QjGZE2CkS4QVLTjK7A2i/o0Ba3YJcgze26SSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7272

On 24/02/2023 2:48 pm, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/setup.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 154bf3a0bc..593bb471a4 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -24,6 +24,18 @@ static void test_macros_from_bug_h(void)
>      early_printk("WARN is most likely working\n");
>  }
>  
> +static void __init init_bss(void)
> +{
> +    extern char __bss_start;
> +    extern char __bss_end;
> +    char *bss = &__bss_start;
> +
> +    while ( bss < &__bss_end ) {
> +        *bss = 0;
> +        bss++;
> +    }
> +}
> +
>  void __init noreturn start_xen(void)
>  {
>      /*
> @@ -38,6 +50,8 @@ void __init noreturn start_xen(void)
>  
>      asm volatile( "mv %0, a1" : "=r" (dtb_base) );
>  
> +    init_bss();
> +
>      early_printk("Hello from C env\n");
>  
>      trap_init();

Zeroing the BSS needs to one of the earliest thing you do.  It really
does need to be before entering C, and needs to be as close to the start
of head.S as you can reasonably make it.

I'd put it even before loading sp in start.

Even like this, there are various things the compiler might do behind
your back which expect a) the BSS to already be zeroed, and b) not
change value unexpectedly.


Also, note:

arch/riscv/xen.lds.S-143-        . = ALIGN(POINTER_ALIGN);
arch/riscv/xen.lds.S:144:        __bss_end = .;

The POINTER_ALIGN there is specifically so you can depend on
__bss_{start,end} being suitably aligned to use a register-width store,
rather than using byte stores, which in 64bit means you've got 8x fewer
iterations.

~Andrew

