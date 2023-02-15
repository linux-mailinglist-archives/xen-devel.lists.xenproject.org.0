Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440E66983DE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 19:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496210.766834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSMvY-0004B3-2l; Wed, 15 Feb 2023 18:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496210.766834; Wed, 15 Feb 2023 18:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSMvX-00048g-W2; Wed, 15 Feb 2023 18:54:47 +0000
Received: by outflank-mailman (input) for mailman id 496210;
 Wed, 15 Feb 2023 18:54:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCKc=6L=citrix.com=prvs=4036dcf8d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSMvW-00048a-Ka
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 18:54:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35343f4d-ad62-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 19:54:44 +0100 (CET)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Feb 2023 13:54:40 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5633.namprd03.prod.outlook.com (2603:10b6:208:292::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 18:54:37 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 18:54:37 +0000
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
X-Inumbo-ID: 35343f4d-ad62-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676487284;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XhA+FWabA9LtS20hnqX6OA9FcC9yOgKyCbXRh/vos0w=;
  b=ML/gjhiaMrITpUJnWWoeZfN8hdidSdXPiubOyFV7/+yikAQ3PCkxL9ws
   0VHZs2Lr4vvB23qEApWOenns+iAgZ8+VVHuv7k9AUFKBNPYK/xCmTkt2e
   Ca1uqdV80KhDerxcs3JB995WUR6qeCZQXRSLRVME3WvkDkSgNkAkEKnOU
   c=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 97198435
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ExyTzaLqFeBsx/T+FE+Ri5UlxSXFcZb7ZxGr2PjKsXjdYENS0DdUx
 mYYCjuCbK6KN2HxLt51Pong8UMFsZXTm9ZgHgBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AVjPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5vACZD5
 +IzDwotbyu8rfya0pb8asZz05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMlGSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzHyiCdJOT+DQGvhCnWCB3HAsDxEvXFqqn9P6jB75VfN5J
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN07h8MRy7+y+1yBhju2v4XIVSY8/ACRVWWghitzY4SvdoGz6VzW6P9GBImcR1iF+
 nMDnqC25eQPFo2ElTbLTv8EGrqo/N6aPDaaillqd7Eq8DKr/HyvdJ5R+xlxIU5oNoAPfjqBS
 EPLogZQ+J97NWOnd7NqeJm2D9k2zK/mDpLuUfW8RsJHf5xZZAKBuiZ0aiatM3vFlUEtleQzP
 MmdeMP1V3ICU/04lHyxWvsX1qItymYm32TPSJvnzhOhl72DeHqSTrRDO1yLBgwk0J65TMzu2
 443H6O3J993C4USvgG/HVYvEG03
IronPort-HdrOrdr: A9a23:qYWPCKnpQlkgoGTL7wkx2iktTSDpDfPjiWdD5ihNYBxZY6Wkfp
 +V7ZEmPE7P+VQssS8b6LO90fG7MADhHZ4c2/hrAV7QZniVhILIFvAj0WKG+UyFJ8SQzJ8j6U
 4NSdkGNDS0NykLsS+Y2nj6Lz9D+qj4zEnAv463pB0BIW4FCsEQiHYeNu/YKDwGeOAsP+tCKH
 Po3Ls6m9PWQwVrUi3UPAh8Y8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzSIwxsEVDtL4LE6tU
 zIiRbw6KmPu+yyjka07R6X071m3P/ajvdTDs2FjcYYbh3qlwaTfYxkH5GSoTwvp+mryVAy1P
 3BuQ0pMchf427YOku1vRzu8Q/91ytG0Q6h9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFf9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmcca+a
 hVfYfhDcRtAAunhkPizzJSKRuXLy4O9yK9MxE/UwquomVrdT5CvhclLYck7wI9HdoGOu15Dq
 L/Q/tVvYALd9QRa61lAucHXI+YNkzhKCi8bl66EBDfD6cANGvKq5nrpJMPxM/vVqAp4fIJ6c
 X8uGkzjx9gR6srM7zf4LRbth/KW2mzRjLr14VX4IV4oKT1QP7xPTSEU01GqbrunxyxOLySZx
 +fAuMaPxbYFxqjJa9ZmwnlH5VCI3gXV8MY/t49RlKVu8rObonnrPbSfvrfLKfkVW9MYBK/Pl
 ITGDzoYMlQ5EGiXXH1xBDXRnP2Y0T6uZZ9CrLT8eQfwJUEcodMrg8Wg1Kk4dzjE0wNjoUmOE
 9lZL/3mKKyome7uW7O8mVyIxJYSl1Y5b3xOkk67zPi83mEOorrl+/vMFy6hkH3USOXZ/mmZj
 Jimw==
X-IronPort-AV: E=Sophos;i="5.97,300,1669093200"; 
   d="scan'208";a="97198435"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2WDlKWFZDbM4O2ZeMGhurJ44FiTWRL/Fc4vUnX7jEODs7RAe5Hm33Zya1+6UvBLQjh4HmHmrMoyEm3Q8cOrR7WipXADK1Br+e+WfYRuKySm+YS5VSq6KjJ6aTIhr4YhPc+PmwczmcZm4cz/73xy1ER2AG2QWZnHVpSgdi1oND5zIWbOQJ0wXRcZGvJ9UdIPxEpLne7d90d4eOsEoknOpdAFCA5tZ+IH3Ds7syLqT7nXnkVWSqyA39qlQRi4Lz7wzcxtelQqpyaVfOqK0I5JGo7EOZmF3FhhVNUlqi4aXNlC5Wn9Ofo9bUW+bN6LHGpHjMosZDKxKqqDbZbsgNZpUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhA+FWabA9LtS20hnqX6OA9FcC9yOgKyCbXRh/vos0w=;
 b=TIB+VUkI2hqahYnFNktcSqER9pBGCloHJ04Thifkxs7jGZJYxQO5w57tvZIdfhYYetAmqGGD1HanTq1VWYABHhb3xY4OOpzjhzbSgv5cLjGgbKvEwTVNH/8/2Jz3q2qC88qUeOGU+sJ7Z+WhjIjxh+y7id9z9pJ1cq8OugtrjJ6fwV3UWFT4Xxf4BcQ1Rp+dtKQT58Ak4+8o6I4FnI7Ykq5YUZeUk0w76ewDu3cTajrMqAFeTyf19hTzHwznwmb+EhkyImJAmbfSokpfXDqKTbxTmjHLeUeDlR2ulJ4R/w46i6MjM+eV56BUjxRmIOtB4OmJADjuqekk0w3GR24BQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhA+FWabA9LtS20hnqX6OA9FcC9yOgKyCbXRh/vos0w=;
 b=kKwAAVYJiKCMSzYSsEbgr/kpyTaFmr/pqAdfLJhsIIkY2nH354h2UQOIxGi03aseccN5T62MrctLqqOrrof7iP6q2C2LjTE5NsYxGdc+fT3+BGXNVB3LIaIvstSgcbVsBfRt390wGsx6heTp7YRRKmNtmudmwVssR896vg0XPcY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7532fcc4-1e0f-7db6-9538-6dd3fc209521@citrix.com>
Date: Wed, 15 Feb 2023 18:54:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/6] common: move standard C fixed width type declarations
 to common header
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
 <862a1076-4be6-79ac-4243-7d690a2f88ca@suse.com>
In-Reply-To: <862a1076-4be6-79ac-4243-7d690a2f88ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0242.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5633:EE_
X-MS-Office365-Filtering-Correlation-Id: d93d1c7d-3244-4eb2-59f6-08db0f861552
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UlcBz7+MkHIXN1CJ7MH9tLDfYQlrAA0mtcWAIpmcls65NZCklILZtzGkrIlZBj55eMdu8qAW9yexvWnTCvoivDo+NSK6qzAu1qXW9Xn3B5Kpa11sqOLhFFawopPCReF3EgZj09T//Eg02Q7JZlC03OxXhGHN7nyctlkc1xTsxmI+XbQRPgl0g56vPEYAycP8mT0NpdH8rI6yObLSrUdbr+8ymvaxh6scECR9DknvdZAYWz4kNAwIyqf1dq9dN4bNdkBERRCNc90KdXWzwHrKiWKK5ycfwHQxgggfffyWYwRrbr05apkfYpL3D5gIU7tJdajcJksX207ZVnz6cyDwAt9x2nakbbGgtlmS2bLOQiprYn4+XGsL6wZvVfS8+EayeK4R049273w8jmlPXwAgGizuRKFrmNVcyvGuN5QjY3Ifo/lp5EOU244ZZ+NOKoTJ/Px1vgkGetdclYRJCwP/pPGd2Opi3ndiNBLXieH+2sSGoxhserLiH4cwFwCBZO/ClxVpTeuQ2juFBv+UxcRfKUMHqiisridm+oQ5nM54d4xOP6n1BKlr9nusou2VlNfrH/Iq1gDvSGjpJGN52lHV91XT6p1lxULKaAH2n4ekDP6QKI5xueXy9XZGycyPNLOOkTRGKn6Y1JVmnJUCXk6fhbshvHAmjqgFo1EdeCDykNlVMsHO5lXwHVQEpy8E00hHjtyKyAoddWD0KgFCPV8RAueJwS288UEn5rzMOApzu6I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199018)(66476007)(66556008)(66946007)(4326008)(8676002)(110136005)(8936002)(54906003)(5660300002)(31686004)(316002)(41300700001)(7416002)(2906002)(6486002)(478600001)(6506007)(186003)(6512007)(2616005)(26005)(53546011)(36756003)(6666004)(38100700002)(86362001)(31696002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TERSQmk5KzQyUDBSQWRYejJSbHBsVmhDSDVtT0VGZGUydFBxSHM3akNLZStr?=
 =?utf-8?B?WkNDRU9yeXdQYVdSMjBDdkp1SUV5WXVUSlhHdFFyaFdzWjc4ZnNZd1ppZTBI?=
 =?utf-8?B?eFRpWmttemxRdHluSFBpV3k3YTQ3VTdoZ1JuYWRxaStCVGtzWDJGd2hCTHd2?=
 =?utf-8?B?TEt0eXdXdWVBYi9Ecmg3NE5QcVIxWmlPQm5URFgxSjA3T1Z0SlorWXRWbHdN?=
 =?utf-8?B?TmZxWmZIK3R4bzJULzE1K1NrN1QwR1BqajdlN1pjS3UxOHVhemRpb2lZVGtl?=
 =?utf-8?B?Tm84NkZWeGNqL0orMHRQd2gxdmUvT3ozd2xka085ZjBPc1ZDUnpuMmxoQ3Ay?=
 =?utf-8?B?RndIYWMxMEY4M0xBL0xlVDJpOTVHaFRhMlFHWWEvengxSWlLSzdZblFmYmd6?=
 =?utf-8?B?N2szbnlyQjVUWm9rRDdQTURjdTVNdTVCdk5TU3hsS3o2QklSRjY2VVpFNHRQ?=
 =?utf-8?B?d2U1NVAyMVcxL0hKMENUdVduTlRTSDJxNk1LR21QclhObTNNMjRqWkpOVFF4?=
 =?utf-8?B?NU83d3F2bThxaTF1WHNYaDhVc3B4ZDM2TU1ZaVlHT1BOZTRHQ2hqZjltamEw?=
 =?utf-8?B?QkNBK3V6QnE1QUJEWkFxYmhQbDA3bmR2T3VLckxkd3MraWdSRE56OTJoM0g1?=
 =?utf-8?B?a3lTL0VIZDFGQTRCUTdXZ1FqUVBZdDhFRHhZSEFtUHZ1VmhqMEh3WkJLcmI4?=
 =?utf-8?B?N016aldCdlNKT25wNmxMZWovYVJXa0ZhaFRQL3JsV2ZLL012U3ZPZTNIbGp0?=
 =?utf-8?B?V3A0QkxSMVJhdFBsYklCQjBwOVpHQmJDRlFEZTVjSGZUb0ZrMnluWXhKUlZ0?=
 =?utf-8?B?NjB4K040YmhGOTlXZHVPR0ZYbXNZM0VyK2I0SWNVa2FianhlTmh5V3lyZDQr?=
 =?utf-8?B?enlYZEtGY1hYQ3JFMjc3QUxjMlpCeUxIZ3IwcFFTOXovN3IzQ1VsNDA0N2xD?=
 =?utf-8?B?RDlwR2U3S2tQMnFqM0cxRDVXaGNtZUdhV05jU3ZiNko5elp0SWRkRlBJSjht?=
 =?utf-8?B?TmhhWklDSEw1eDVXWUNpNlRGMWU5bDBGbURSZUN0bmJySUk2eE5DU0E4aVd6?=
 =?utf-8?B?MFhOS3pZU1JIdHpHemZ0RkJwajZxUkN3aDBTSDR3cUl0MnZWNkVzY1RCMXZ1?=
 =?utf-8?B?ZVdvbGtLNDNGQmt4d243NU51VndFWWVtckNET2VWUFJ1VW8xUjk1WENXZHRO?=
 =?utf-8?B?dWFsVFo4b1ZBS2xVZGltTnVZWGVveFBOVDh5dDZMWTg4TllxTlB6TWxsUUxY?=
 =?utf-8?B?K0MvT3htS1Y5dFp1MEdrRGRrR2k4cGEyWU15QjgyUUN3aWZxQndCTlpuc2NT?=
 =?utf-8?B?anJLOEZWMlg3TU1QeHlDdS9rREk2cmZSZzZyd1ZjN2pZRG1HSGE1czFrUWps?=
 =?utf-8?B?clhKSy9xcmFWdHVjVUQzM0NaQTNJVVlkMTNoTG1RMGRZK25qZ0p3SEliTG14?=
 =?utf-8?B?cUJGQTZyUjI2TlFIek1jNjRyUmt1elNVczR0UDM3Y2lHbXBwTDlReVd5V0Fx?=
 =?utf-8?B?M1R6V1A0algrWlZ2ZkZVWVVoMi96QVVEZ0RoWjh1aWY2bmM0cFdQaUZXdEhP?=
 =?utf-8?B?eUk0Rm8vZEhkempkL0I0VnlDWmRNVWkvWUdNT3dvVllaWm5mMXluYTRpMkNQ?=
 =?utf-8?B?MXNwckpoRzNDOHdNQUt6SkVpRmxyNG9nSVA2SW5jNUI2Q3pqL1JQS0h2NVN5?=
 =?utf-8?B?UnZKSkZ2Rjk1MHV5U2VhRVhhSHFURS9Fb0J5RWZ6cHBLZ2p5RzZqdUQ4SFVo?=
 =?utf-8?B?L2QwL1lTYjRMY05MM0xnRkdyOHNmOW5aUkFQTHQ5N3lkZnpUdmtnZXJ1QzRI?=
 =?utf-8?B?WEJhNzRVRk1DZ0JoNjIveEc1WVVTSnlDMUJDL0dQTWFhaitTa0RKUVo5Q0py?=
 =?utf-8?B?L3BVamx3cTNZZXF5ZmFtOE5PZlROZ1lXOHJhZkhPNkVpMzZPa0ZtWThJSW9v?=
 =?utf-8?B?L2c2U282UysyY3ZuRmpiZ2JkY3lpZzIzSENlU1dNVE12d2M0MUVNSXhXNldP?=
 =?utf-8?B?MTh1dnhhc2dQN2t0ZEo0bVVtanhpYUFTMkFXbmdBOW0ySjNZWjBrb2E5Y3Bn?=
 =?utf-8?B?eXNlVE1TUUp4L29QdDhmQzZCWWo3ODBzQUdDN1k0RXVRT2c3cWtDaHlCTThn?=
 =?utf-8?B?VWRMd0VTdWV4WThzL1dpZGJZTXJqY1dKTGxMQ3RWWEU5OGt6TE5sb0owRTNo?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?YkpDRUV3YUhadXVhTUcrOWtuWUh1UkxzRFNxREZuVUswRGxhajVrd01uZVVw?=
 =?utf-8?B?YlhhWkxTYzNaR0RydHZiZTBhSVYwajVCQmQzL2hsN052ZXYwY1BzV2tnejR0?=
 =?utf-8?B?T2dVcXdJZ1F5VTlCTzhFS0g0YjVFa3FWS2k5WkgzUld1Y0FUNlp2RmM1dEkw?=
 =?utf-8?B?YldvbHlRdFdmLzhjOFBoRkdzL05xNElHU3YzWWU3S0tub1YraWNDdTNudGpI?=
 =?utf-8?B?MTdsekhVR3FCSm81cTZEMXlTL2N6dHJjV2M1Qy9KYWszSmd6aUZFRmRmWXlK?=
 =?utf-8?B?b2kyQXVxUE0vQUd0VGoxaFEzd3JvQzZ5bDZ4MlFKQWtmamJraFhIYXBjemtC?=
 =?utf-8?B?VUpycTkrdXNRQUp4SE9JeTFlTERBb2piT0dWZ3hoV2d1S3YrdldLOVBFZ3pJ?=
 =?utf-8?B?Z3BmTnFzeG12VnF2SHdTemtXa2lHaUk5UE9SQ2ZERUgvVGMybWx6RDlmZnhH?=
 =?utf-8?B?T1pJS0xwNENQUDJOVlZBQ3cxTjBRd1laWk1PSmZNWDJ0SGtCNnR3RDltVlhi?=
 =?utf-8?B?UDErTGNNNWZBdnNpeVlwMWpNNUgvTHpzdFV4ZHp6d3A4Y3YwOUhDclpYT0sz?=
 =?utf-8?B?YkROLzNiOHNWSWl0LzQ0U3pBTVU0ZEVXQThWeGREL2Jib1kyWWtvSG11UUNO?=
 =?utf-8?B?NU9EaEtBcWYyWWVZUHJvdnd2QjM5VHZpZmUxcUMzbVd6ZVVad3N4b1lHalg5?=
 =?utf-8?B?eStoMXBJdmlub24ydHNSYUx5ZzVsOVFEMlFkUDFybjkzWXZYRXVXMDhucE9V?=
 =?utf-8?B?RjYzdXQ1NldER0Y3REpVTDE0ZmRtemhsb3BVVWZPWk5NR0ljR0JoUzEyd3oy?=
 =?utf-8?B?YVQwc0tJWkliblpzeDZGczg0Zk1LV0d2K3RmVlZBaVo2Q1RCYXNzWDFVWFB3?=
 =?utf-8?B?TGp1aUVENTJmQnVDRmg4WksrOURIb0F1ZlJObFFLVTBodElPSHg3OUx5NGRJ?=
 =?utf-8?B?MnlIeE5pbkNiOVBYUXY0b0xxT0ZQQXBpd2R5eXpyVmtNejBoSTVIVjVRR3RM?=
 =?utf-8?B?d2NXTWU1UVVOdmk5all3b0FpZ25QUGtaRVFOYkFxOXRCOVRGOWZtbkU5WWww?=
 =?utf-8?B?RmJ2RG0yaGZRa1gyZ3lRUFozMUo3M2tZZzVjV1hFdUxBbFVHdUEzc2RpMTEy?=
 =?utf-8?B?K2R4eHZPL2RSS3lEa003NnV2eU5PcnMvWWpKcko4OVNrZDJYOE5zUkcwYkZV?=
 =?utf-8?B?UEdSUXU0UHMzcmsrYndkZERaQWhpVk9EVDNMamwwY1JiNGpDaThHUjlmU1pB?=
 =?utf-8?B?SkkwN1pqZE81QkN3WG4yNTF6L01DWkcxb0ZUcjZnYnc5eDdheERHckVRUkND?=
 =?utf-8?Q?GDAe3znrJmdAg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93d1c7d-3244-4eb2-59f6-08db0f861552
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 18:54:37.1590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHgCbAqKthzlfkCoBOqz+nRS4xYtAE+JrBocIVSooryanPMpeTSHO6DoyHFnvQzbu6NQN/n1K6AaUnKl+RGdeIjYSbdvO/gbR/AO3HqoBxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5633

On 09/02/2023 10:38 am, Jan Beulich wrote:
> Have these in one place, for all architectures to use. Also use the C99
> types as the "original" ones, and derive the Linux compatible ones
> (which we're trying to phase out). For __s<N>, seeing that no uses exist
> anymore, move them to a new Linux compatibility header (as an act of
> precaution - we don't have any uses of these types right now).
>
> Modern compilers supply __{,U}INT<n>_TYPE__ - use those if available.
> Otherwise fall back to using "mode" attributes, but this can be relied
> upon only when bytes are 8 bits wide. Should there ever be a port to an
> architecture not matching this, it would need to define the fixed width
> types locally by some other means.

These types were added in GCC 4.5.  It is 12 years old.  We even use a
newer C standard than this compiler...

At this point, it is an unreasonable burden to be continuing to support
compilers this obsolete, not to mention that the mode attributes are
unreadable to anyone who isn't a GCC developer and clearly unnecessary
to begin with.

~Andrew

