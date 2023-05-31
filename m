Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D83FF717EC3
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 13:47:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541740.844795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4KHQ-0000tr-Rs; Wed, 31 May 2023 11:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541740.844795; Wed, 31 May 2023 11:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4KHQ-0000rF-O1; Wed, 31 May 2023 11:46:16 +0000
Received: by outflank-mailman (input) for mailman id 541740;
 Wed, 31 May 2023 11:46:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sC/f=BU=citrix.com=prvs=508b7ea43=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q4KHP-0000r5-7y
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 11:46:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbd22a80-ffa8-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 13:46:10 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2023 07:46:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6167.namprd03.prod.outlook.com (2603:10b6:208:315::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 11:45:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 11:45:59 +0000
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
X-Inumbo-ID: bbd22a80-ffa8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685533570;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nKurpDXEWdM0jPg9FXmRMj2pdd8+YhmxFD1vE5fBxro=;
  b=QuLTYNaYZQYABWMFaKFVdxOa/1x3xtkyLy45KwvPxo/2C8sl1Rppwutm
   KKsN3oLxLM1UiQTqbB2Akok9i6Y2YNxnnhOjewQO30IRZXdyfdGz3Ug5G
   KzkDqVcOn4rQN6oWgWerK5CWDgp/owxMYXiJrzt+vmR7RE2ClI4pRO/IN
   U=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 109821829
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ycdq3aqMlVWAFGjPlqxVu5ZmuaFeBmKsZBIvgKrLsJaIsI4StFCzt
 garIBmAPPiLMGb9L9x+atvg9x8O6MKDy4NqGQRq/CEwEXhA8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzCBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGwmSyiqu96f+a+2YeQ0g9QIa/L3YZxK7xmMzRmBZRonabbqZvyQoPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYSEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrq862gTDnD175Bs+ekW+rfvllX6ES+ljK
 14M8QUVookq+xn+JjX6d1jiyJKehTYbX9dTCOw7rgKQ0K3f4wWeLmcBRz9FLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcGRwYY59jooKkokwnCCN1kFcadlcbpEDv9x
 zSLqikWhLgJi8MPkaKh8jjvjDOloJzURQcd/ATJWXmk6Ag/b4mgD6Si7lLR/PtbLIKUS1CHl
 HcBksmaqusJCPmlnSiMW/kEHavv6eyMNjbdmnZwE5Jn/DOok1aoeoZW5zNyLVloKe4LfDboZ
 AnYvgY52XNIFH6jbKsyaYThDc0vlPLkDY68CKGSacdSaJ9scgPB5DtpeUObw2Hqlg4rjL07P
 pCYN82rCB72FJha8dZ/fM9FuZdD+8z07Tq7qUzTp/h/7YejWQ==
IronPort-HdrOrdr: A9a23:5ypkrKz/FzjlQXax9JKfKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: 9a23:8UgfAGDKo00y8oz6E3VM0XY9JvwMS2DQ53qIJl+TTl11FaLAHA==
X-Talos-MUID: 9a23:dSlk6gUyNSoGUqbq/BDygT1gaNhY2bSVNEAfiZ4pgMalLSMlbg==
X-IronPort-AV: E=Sophos;i="6.00,207,1681185600"; 
   d="scan'208";a="109821829"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOSkObuHN/Vijex/ZsHTfVc9bDYUUicAoIF2Dv5kfpbSFh5aOKxSNOXNY/toJhO+1Kgp2NqZdMDam+BjZHGFlTKJEGCdRCpVMeaxjiQ4Y4qcUPt3cmTj8wqnPFJQtHnv2M4vqRpMaS+0AhaTFWn9e+yNUcevRiQVRZXLxBCq9PAAob3T5Fz4AknK+yjYVCK9RomgttbEDynZkWTNFFxYijuAvQA/MTPdHopnp+3WvQ/T5jyEu7H0MwzbxTN1dI9S5n80b6QJeSw2eohRY9qncX0bw0rMgrIQTGe7LHwI+Krx4xEUC/6fkX0TWNLrDh9b8RHoR9tRo/FO1geubEYbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VbPZ4Ysg5oOPxI5dTCJYqTy0gM7MCGNZ/t2NDvd/Dc=;
 b=LTOtyGhOMiXF5prH03AhistIaKiFG9kiFVcozkZaGLRinLAn2G9X6lklW5rjuSuSRLSnnbD2K6oO70x++gMX9GeDs3fuEA/XXYuk8g9EhDvxbYDhh/Lj0+aLOybI7sxx+SaXEoZSF+3zhhwVNuN9rgAo51XQqrKJ8TRt/3du5nHmBNwpi6anxCudfqd2igixl+gQ38Rfv/W/Lq39CIoHlfCDnZReYInL/lIuPh+15KIlxuKAYPKPqeKYu7LGihNHp+CIN8QpoJ4sj4AhcjkFIrVyCD7msV6L6yjQPfSfc6q9wfEEDgIfsxCeXVUd1CAc+BWZXGmsESPnCBG6sj0R3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VbPZ4Ysg5oOPxI5dTCJYqTy0gM7MCGNZ/t2NDvd/Dc=;
 b=rOwYvvU7RlwiXlCBGrneyv0umFxEvx1+IKL4Tk4nadOl+3rV1lUpqSh0Qwn8LlhM5XaS1PU+JP3k0r4zl4yFC1GW/4v7jDFD0vBLNj5Rdd3Tsm175YrrXnHBwge1Nw0nwzLy8lmO5eAS4SF/6uIMzZck5cjbMdQQP2yvZrqwAxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4e336121-fc0c-b007-bf7b-430352563d55@citrix.com>
Date: Wed, 31 May 2023 12:45:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [BROKEN] Re: [PATCH v9 0/5] enable MMU for RISC-V
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1685027257.git.oleksii.kurochko@gmail.com>
In-Reply-To: <cover.1685027257.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: a454d74d-6098-4b5d-3dd1-08db61cc99f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fQRrxiMZw6E/Nwpiltx+moiFI0XMLmsDJpuqcj92OlTpWuezV1F105p9qoGamZxksfJmTLgQ3g7thM+0LoPEUqszoRPI0QVGuZ0Qz6UKINs8/fqTIRfVD0UwM7owIMSSokGlmdRP4uqg8ifEzPI9QLgsnlMpUOWEZ8CJmdh0rnnkdtQwPnOBax3YaV/CcqFNuV2zx2Mqv2DJ5ckY/mROCmmCAEeKMZbD/EFiwIuVhxoOjXK5EFQvGwKoKgBqLMSJtT8mNLRvXWg2Bc2L2OqI2NpVvWwMTcvE/zHAmtD7bHejB9yPQC8uGO6jTUJOT06bK61JIupEKQdX69spYSiFd68Ww6rY8e9QZmgTBlQ0Vzqh+Q7NFxdL4BrmJX5ChXYehcGBp5KlvXmcgaLIpW1J2ddhtic95EY5aSbwfsTTgRSnt7IlEK4vosn5QnzHAgzZFWOstF7Xh/+B8feQFEn3Af3WU4vFvMjnjkX1cxADfdEaql7v76RPMNt1Dm83N6vdoXMrOMc0THokUD/2AgJYUnWschRqm9aGAU88HrTNd5n1LD5r0u17zjOYwXAKNZaJjSlM38/6qPi1ix5Ei//9XHTaaNSGYw/LHhtBnT1oinY7tUqs/WVFTXdOG3idRI0BB3xFTiW2vi3AnS0Ufi7zOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199021)(5660300002)(8936002)(83380400001)(26005)(38100700002)(6512007)(6506007)(82960400001)(2616005)(186003)(2906002)(53546011)(8676002)(6666004)(4326008)(316002)(6486002)(86362001)(41300700001)(66556008)(66946007)(66476007)(31696002)(36756003)(54906003)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1hDZXJxc2k1TUUzM3NjVm5pcUk1SW9UUUhIMXM0c1hXaDFJYXpOSk05SjdN?=
 =?utf-8?B?VS9KTHo3UUpqVXRLSzZDQjVvSmw4a2p3THBuS2l0dFREd05BVERQSEtBZ1R4?=
 =?utf-8?B?aVFOZDU1WjN2SHo4VHJLTXhia1VSZ1pDTS84Q243L25xNUpyZHZvU2I5RXFN?=
 =?utf-8?B?cGp3clpYMG5HT0ZkMjlqSUhZakMwWXN3T3BVNE9jVFZKbHMvTlJCSWUvclJw?=
 =?utf-8?B?RFRQRFdnOVNaeUVEOVE0K0hBcnhpL051bVBuUEMzeVNTdUtsOWlqTEhlL3hx?=
 =?utf-8?B?TWpnUnM1RUt6c1REM3FOaFJOeUpOOEVVYU8xQ0xyVFJNS2F1QXBGejBuV2lN?=
 =?utf-8?B?RXBqd1dQUjZpazR5UU8xNmdHY3Y5L2p6RjdZMzlUaVBrbkF5NldJUzJOUGUx?=
 =?utf-8?B?N1BDeUJISm92MmNQUXpCVTNib1lDMXM3UVVRMEY3VUZUdUN0Q00yblNsWWtr?=
 =?utf-8?B?WEJIQkp2UUYyQ1dvaEc5UkczbTVYWDIvdWJ4UHJLd2I0ZmphWjJTbTcxZUZr?=
 =?utf-8?B?bENaVUpuemhPa3g4ZjBXZWEvb1VQNW1yL0J1ODFlK1VxOGVDbjF0TWZZK0kr?=
 =?utf-8?B?bzQwQ0prL2lBclZRUkJBdVdyM1cybkJZTllJTjd2czJ1MkpsQ3lVUEdjeHBL?=
 =?utf-8?B?MFRjYm55ZTRneXZIMnNDQmU2U3R0Y25BSE13eTcvRENMTURYN1V2S21lcEE5?=
 =?utf-8?B?QjlzYmttOUR3Z01ZamxpSVFuMzhTQXpocm9GRGRyNWsrR1JETFlHVmVoNU82?=
 =?utf-8?B?dXdDQWZ2NWxMZEtiSXVpQ2NSQmh0QXdabTFDV0dLQVJqZmxiNkFGUGdNUUFO?=
 =?utf-8?B?eXMxbW82Q1U3RlczaTlSSUE4N1NZZXNLb1BTUmRKTEdPdFJZaDFGZUp4SlB4?=
 =?utf-8?B?QVVDRytSRWNYQmRFR0lJanpqb28xOW9GQ3EydTlyQzdrWkU4eXhKZHRxZnBz?=
 =?utf-8?B?dlM1dHlvQnhOdncvNFdLZXYwR3BJU25hOUI5U01ySW1lZXZvOTFuc09TM0c4?=
 =?utf-8?B?Z0M5NWZWRGxyQ0lTdXFNZXNjWFdkTFdVZEpXaE9UQlpLbm1ncFozd1RYUDlZ?=
 =?utf-8?B?eGl5L24xQnFiTzd4R20xMkQ0QnBnalNJQnpnNWVqRmdBRkgweWNBVlVVSlhn?=
 =?utf-8?B?TExDKzJuaThZMDJGUE9uQWlOMEUzbVZwQ1JzRkdKNWE1RlZGSkdsc2s2WWUw?=
 =?utf-8?B?QU91eXBXekl4QWNzVWFnNzF3MHJrWFYxcCs5RFpSZzRhazdCSmZoUWlwS2Zu?=
 =?utf-8?B?cm4yTm9SbWlSSGFzVU01NTJZQzFqTG5xcGd0RC9PR005UDV4SmFDWFNLdVZM?=
 =?utf-8?B?MlFsbDR0YXljcWlrYVd4RzZlR1NmeU1hTGlEcUJmVzYvdGx4SVhDdHVSRXNK?=
 =?utf-8?B?cWVZUkFIbFVQL1FwTkdqK0pyYk1icENMR1RFQWFQOXNXaUN2c2puRlgyRFIz?=
 =?utf-8?B?d1V1MVVIQjdpNmxDOWdwZGR0QTJjTmlNVHFVYUpNWEYzZFhQZlcyRFlsbEJE?=
 =?utf-8?B?LzQ1alZMY1doeDFOdW0razQ2TWROOUQ1M1RMdmg5TDV0OVo0bjJyelp4dVRD?=
 =?utf-8?B?a3Q4U0hDdTcvOUYrOGs0M1kyOGRvRGQ0WFRrZnArYTJlMjYzeUF6ZEFrWWND?=
 =?utf-8?B?Z3VuY1ptWitlNGhLRFR4RkdOUSs2WEtJS0daUEJyOVRxZ1ZXcWFrZEZObjFB?=
 =?utf-8?B?VVBzdTVDQS9jTGVMK0NwSzhQMmJnOUdJWTZ3N0dkTkJ0VkV6U3pUQnJjbTRa?=
 =?utf-8?B?eEdGYS8xdU92VjRqTHJkbnNxRy8xRDlHVlVnUjdKZFZVblFFNjRxbVlSek12?=
 =?utf-8?B?NXoyZGpLWUtoa2YxeXAwQUVxaGR3TkkyQlFqUE1sRHlrVkQwdUxUN2dZaVM2?=
 =?utf-8?B?ZmJ3ek5nWStWNFJkSE1rQkpNeWZVRGkyQ2hseXlvVUFGWmVVK0RzNFErUXJH?=
 =?utf-8?B?TFFCMVV3c2lnRzFJbUtWQ2R0MlRwUjFNVTg1RHVmRE5sdGhQc3FDWll4OXNT?=
 =?utf-8?B?dEpORnhwblYxTUxWNGxWNmlnSjRDcnFUVHJqTE11RnFrTGRYWHpKbDRyMGtj?=
 =?utf-8?B?L3k4ZmxzN0hFc2hvTzZOWkZMdWl5UlNZYUhSZWlMYkFkaTBlckpCck5SamJU?=
 =?utf-8?B?azlnaE10U1IwZlVIbFFueXZQVWRoaDdXR2lJdDBWYmJVMzRVelQxSTZwR0g4?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+Buf7f4LNO46Jfqx2AESmsvgECM5WI8cfhbU8vfNf32l1e5JlSSP0Hl2Xw8Uz1F7r7W9L1iLx//H5DAzx0Y3shdQdAeSQ4fG6mofc5BfonBnfzo1sk0NwYRDH0CKv0bMXLELa78TdVlxgqJ5s2lFq0MUQfsPUWAK5UR7sZmVJQfaQx0Wmri1Kjhi8p3HTSkToMfP0R6ybPmULkmZZUsIlFkh1E+hcJH4H57Sf9H4uua92kwaQ9BZ2+ln5qBR+hnvc2IeRRmeKzBroBL4gZwf+ixQsYY3rL45Jqh3WcJgs0kWRwFkj/yppKfugzGJYY1Jn0KFuAlJ7NU3gtTpMmJPMyEl275UT8iaMtHEwGrLJPekgkoOdECLxiL4xVs9Q5AQHGPsTAhQhhEobhEnwLzItPWGxexXNDnXlfN7US18fumdCS0KH93BWPMDI4fAhpZrS/YMGJH+nzoTmWCflqvJNZEBbqlW59scGVaXNr1NzOWZVxDxtI+8QmP+WYckT/fUc3f2PEJQvZp8z4zg06Y/hn3iTommuhVqHWeGf1i5qjV0xaFU6KdN+nrV41Uiq/JQkorVqNgZZ8FsDpBGOYFZrt85pw8Y3L+NvdQbyIoB1RojvjZ+3qyB9CDsnnwPOWiekUHVo70zXOtPbdaatWrodlJDtipbpKPPN+X++BS+m/C64r9x/cLsfdjvTBIV6bN5hEGERLPCW/s0U3+ybaMfpGuy/pc9GIBoJ+u/12UwMQyT1TL+CcAeSMoJJ94nbDFIRXzSfSz7NuvkaQa5leRg5dUdXFimNyQEQMmAdz965J6kUVkkhzqIOo95D4ppfo5Rkk8Ito6uCDEnIxDTtBCYKJ6u/YcILQhopC5CZG9ucOi40Sl94bTvtVBeAkpmQp2k5H0/v2K6NSXKsNcvxWc35JcJyU+T+1ENHEo3Ho0GsJ0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a454d74d-6098-4b5d-3dd1-08db61cc99f8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 11:45:59.1524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2EjgFjP8pK9vbfApxjXNSKaUcQ8yyQz2bhNeV/5MIR4UNdYdbLG9gsKVq/YWItXVxSLvJvV55EXwoU/L8w6S8whZZmSG5685/sCp+xLyIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6167

On 25/05/2023 4:28 pm, Oleksii Kurochko wrote:
> Oleksii Kurochko (5):
>   xen/riscv: add VM space layout
>   xen/riscv: introduce setup_initial_pages
>   xen/riscv: align __bss_start
>   xen/riscv: setup initial pagetables
>   xen/riscv: remove dummy_bss variable

These have just been committed.

But as I fed back to early drafts of this series, patch 2 is
sufficiently fragile and unwise as to be unacceptable in this form.

enable_mmu() is unsafe in multiple ways, from the compiler reordering
statements (the label needs to be in the asm statement for that to work
correctly), and because it * depends* on hooking all exceptions and
pagefault.

Any exception other than pagefault, or not taking a pagefault causes it
to malfunction, which means you will fail to boot depending on where Xen
was loaded into memory.  It may not explode inside Qemu right now, but
it will not function reliably in the general case.

Furthermore, a combination of patch 2 and 4 breaks the CI integration of
looking for "All set up" at the end of start_xen().  It's not ok, from a
code quality point of view, to defer 99% of start_xen()'s functionality
into unrelated function.


Please do not do anything else until you've addressed these issues. 
enable_mmu() needs to return normally, cont_after_mmu_is_enabled() needs
deleting entirely, and there needs to be an identity page for Xen to
land on so it isn't jumping into the void and praying not to explode.

Other minor issues include page.h not having __ASSEMBLY__ guards, mm.c
locally externing cpu0_boot_stack[] from setup.c when the declaration
needs to be in a header file somewhere, and SPDX tags.

~Andrew

