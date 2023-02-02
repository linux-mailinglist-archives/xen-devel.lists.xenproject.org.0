Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 543D868853F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 18:19:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488881.757167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNdEl-0003pn-KR; Thu, 02 Feb 2023 17:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488881.757167; Thu, 02 Feb 2023 17:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNdEl-0003nH-Hf; Thu, 02 Feb 2023 17:19:03 +0000
Received: by outflank-mailman (input) for mailman id 488881;
 Thu, 02 Feb 2023 17:19:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LChx=56=citrix.com=prvs=3900541de=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pNdEk-0003nB-LX
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 17:19:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae2141a9-a31d-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 18:19:00 +0100 (CET)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Feb 2023 12:18:59 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6437.namprd03.prod.outlook.com (2603:10b6:a03:398::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Thu, 2 Feb
 2023 17:18:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6043.038; Thu, 2 Feb 2023
 17:18:56 +0000
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
X-Inumbo-ID: ae2141a9-a31d-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675358341;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=om4Mispae7qfbeGGYaLA9HONW4UBMOuq3jndDWWwPrM=;
  b=WzFGHOF32WgJqtywk0GAU5AjjFvOfDP5GR+Tc/Kc276iU7DErOjOitYN
   JjpTT7Jgk/r4vQChZs8bC5rl3rp9TmqXmJO1iyhFYd4lQ0jW3hQVNrOfs
   7tEYdYjAILcWFBE0mT7u/a/dGiJXc1Gx0acGewqmVbbvV/meZvnRre0gR
   Q=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 94277445
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pWJI/aJyoGNY9qQmFE+RwJQlxSXFcZb7ZxGr2PjKsXjdYENS1D0Bz
 mQXC2qOPvyNYmb1L4xyPdu3/UsBsMLWyYVrHlNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5ARkPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5GClF+7
 tohEwosYyy5h7roz4uxYbdj05FLwMnDZOvzu1lG5BSAVLMNZsmGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTGMkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzH+hB91OSODQGvhCmX+6+n1QLgUtTlL8pvXj2h+4eIt5N
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQMMinN87Q3otz
 FDhoj/yLTlmsbnQQnXE8L6R9Gq2IXJMcjFEYjIYRwwY5dWluJs0kh/EUtdkFuiyk8HxHjbzh
 TuNqUDSmokusCLC7I3jlXivvt5mjsOhotIdjukPYl+Y0w==
IronPort-HdrOrdr: A9a23:ciaej6iDxLzw3f7vB3ggNxua5nBQXuUji2hC6mlwRA09TyVXrb
 HWoB17726NtN91YhsdcL+7Scy9qB/nhPxICMwqTNSftWrd2VdATrsSibcKqgeIc0bDH6xmtZ
 uIGJIOb+EYY2IK6/oSIzPVLz/j+rS6GWyT6ts2Bk0CcT1X
X-IronPort-AV: E=Sophos;i="5.97,268,1669093200"; 
   d="scan'208";a="94277445"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akixs6SIItLMZfVwWyzRyi4XtGFIJwx2A0myaXni/AnV0RbAuLyiTZLYQGjgtyFbB93NLHTRtZGcYvAov6EzN+N2iF3AXNUprg7WbtqOcYWICB85Oc+zIo+kNFGmik48zFj/FFiIVLvwfK6TccSkL961o+jJSRv68iNzBVajtd3bCaGnFpWG6iyntquyKGpYWSTCFyUn7BimL3wG67GI/oHFuQlialDY1bRr0opSVrKQApzp6HaZmKfsu7BqqkdtU0Nydv+H21FL3e1LKOcTUxfgLKGjpj9foDvFXEI/QTu7IGmtUPEQKHE1BSNhKiUftbx6QIyM1cDFPMUHS9v4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=om4Mispae7qfbeGGYaLA9HONW4UBMOuq3jndDWWwPrM=;
 b=hBTwK9wd4dPoFpNgx9aEhzPZPvMg9W7ABFiBBBRXPQxiZhmmEDIHwuKdBTMrpgA+KzuFqEgFCuDKa0+sWM/qif9AsgYcDiSgz9HIjl3ijI4NfS3Pkx+3hlVtf3hSkXylHA8U4u6SfCh3cjujjp73Uw8yAMkc4rPFfL7wj5Z4cS/xgIy7+8uKWQ8L/8OsxVBo3+mfzicFhFuorgc7RIEKVwApagQLV8zNB227Cfj4Yy1E4UDsqgyiih1DwQRUfS1eD0wReE6qsH9cBRxYzu7Recx8+bj2n3G3IrQzKhvmH7pMekXEHen+t2nF20Xq/t+tOWd4dipH2AAx6EaBOo5FNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=om4Mispae7qfbeGGYaLA9HONW4UBMOuq3jndDWWwPrM=;
 b=JUuKj+O8l7VLgglK5h2dZTBnCGbbh6gCOLTPQfKM9qQvNJxhyEW5ZosF+o2fskCWF6ZBZt3L3RVcztyxr0Zj+SXTUUTX3Nn9PcHkSRsCb0TH9jx1AK/qMLEwDqgbFW9ahvD4Mr+UmiP0ZejlxrM7epNEM8H+zebfj1GbcNXdPrM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3412a0d5-899b-4db8-b6bd-9c532e9f84eb@citrix.com>
Date: Thu, 2 Feb 2023 17:18:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH] tools/xenmon: Fix xenmon.py for with python3.x
Content-Language: en-GB
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230202171319.285548-1-bernhard.kaindl@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230202171319.285548-1-bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0678.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: d1fc4b12-e3c4-43c8-6ffc-08db054190d9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+CZ7MrYmk4r/88MJxnT7VgZ7Z9nb3QC2rD6J77wOO4S7BUpa3CI8w81k+RjnLgK6usVEOe/3LA2GccEfmW+bguSZzf3vzbJ2cZejRARm5g9tgkx3junazWi/ME6YoQ/aqyHfrToairh4Y9T6uSJHpmLQrS8puS6f9RZ5gQ4G9eNiv27D06WO9frcUHQoL9jhSTxLYsfPOatfSxGziKgkS9xsvPhaWjCXanoQcDpmCGn6A8LAepnr+4HUVfKYv2l5s+j1clfGvpEkAAHbLtyAYRxJJ9978fUbR4QHN/Z1YcZcbpMmfIGUGEY2Egs2fSpECtB+4SBc88QxhzKIAvdBO/sJxKwXXkr2ex/Zruyx6fRGgGMd7SW+d1687qF3gb9t9U9MSW4K/BJbgy1Tas3Z3h/AQxqVW1PU4HA9lRqrYyGVSBd/3wRW9ILtExeMIb0CEAKF1YkBTKno4nnCEsl9svpC9IVEa8KwTx4lnyuF82RCAHOW3j4A6crkOjgTfcjycoPfCREYikIx/82oos89ZIMAps5FKArvrw92C25vp9+MrO6/f/DCoSTzty2TwzBo5RZ5qAEAvcq79ZG8uO2xVw8tZpCbteYQZYjgEDOGC36CIznQ93VR/RQPQGN+JX6pRskw962ccNtENcjwHoLgyUWkv0t/B4FGou0Hb47LypE1pknYitw0BP49aRRknzrDCFNHhhIyk28smDwFOCKCTMJ/R4jUyEovO9I1W/lFSv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199018)(316002)(36756003)(186003)(2616005)(38100700002)(82960400001)(6512007)(26005)(83380400001)(5660300002)(54906003)(53546011)(6666004)(107886003)(2906002)(4744005)(6506007)(66556008)(478600001)(6486002)(86362001)(66946007)(31696002)(66476007)(8676002)(41300700001)(8936002)(31686004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUpXelNubzNBQnRRMWUwczZjMkhIQisrV25QVDh2cmNkZ1VQQVZqYUc1eTZ3?=
 =?utf-8?B?MnFIUStoem9MSVpIQ3E1eEJQWWgxSGdncy9jcTBHTFlLMzZwM242VXV4MklZ?=
 =?utf-8?B?cDNUZjJNdklqdHpmODRwREU2MDBnRi9COGZEellQbE5MTFBhMzA3b1hUU3F1?=
 =?utf-8?B?UXMvMDczMW5SMXlRdUdTQ051MXVjSEJJM3UxNTZXWlVad0l3eFZJNkRiK0Mr?=
 =?utf-8?B?SCtjeDdReURiKzlMNlRPSGFJTW53L3VNcU9zdlUvQlYwaHhUM29oVkZKaS9p?=
 =?utf-8?B?Z0VmSXdEb21wQkJOWU9CajlqbG44dmc0ZFBxQ1VPUUFKQ2pTQ1NnK1ZncXNw?=
 =?utf-8?B?Z2Rvam5NelB6UHN2M2loL1g3QXpYV0I1dUU2YkcwNXF0RXduWGdBc2hxS0JT?=
 =?utf-8?B?SFQvaXFGQko1RHBEclNKaEM1RFJ0UlVpdWVrSDNvUGhCa2QrWkk4U01SaFRh?=
 =?utf-8?B?Y2EzWG1uS0pkakhNM3h2MmxZNWFVTmNCNUNkR1h0UEhCUUpEeEp4Tm9TWW5M?=
 =?utf-8?B?T3JEWVJVNk5RNkdOWCsrdzlwTjNEaVJnQ3JhWTZ5SnRlQVlUZGRYbVp0ZUZK?=
 =?utf-8?B?UmVJbHNsRUhTOHdjSnJySm5OOEY2bEFpNzZMR2xFNy9EY1VlODVZM3YzVXRC?=
 =?utf-8?B?WWxMV09kUVZRTGZEK0FsT0Q5bzhONXgzK0ZmbkhPWUFIcHhCNDh6aGY4MThJ?=
 =?utf-8?B?ekdGb3ZKYUxBZEZTdTkwZHZLUThGWjRuWDNhS09mR2dDd2lhRm5JU3hKNWx3?=
 =?utf-8?B?U3dJTW13REJQMi9LSDI1LzQxZTZmYVBOVXp1TmtqKzFwUEEycU42bG94TmQ1?=
 =?utf-8?B?OUVNTFdXRG1zRUtNVUxQRTZvNzIwMEdhbm44d3d1Mm4yd1Z4NkZHdjdncHZQ?=
 =?utf-8?B?SmVBZ2hSK3pQeWcydDVoSjlEc3g5YUNqTG9lQnhhOTRydDlNa2JwQWxVUUN3?=
 =?utf-8?B?cFNvYndoMFJWd0dXZGt3RWV6OW15MS9zcGhMUmdMVEFwNC92VUFoaUFUKzBP?=
 =?utf-8?B?WGhMcldGQy9wK3k3RndDNDJiY0IxWHlVdGJlOERRMFFUSGdkMzA5ejc4VktK?=
 =?utf-8?B?OTdnMk5uYitqY1JmOUx6aXpua0wwZnlvemthY2MzanhWUzJrbm5DNGV2Vngx?=
 =?utf-8?B?UXJNMTdMVWp6UXVhSW1ZNjI0WkRxQkhMd3V5dGF0NjRWM0VwOFhuZVR5azJF?=
 =?utf-8?B?ZDFOZlVZc2R1eWxtelNEZnI4YllQcG42SEFIbjM2QUxDVTh5N3RncVV4cTh2?=
 =?utf-8?B?Z0swaDVQOE5kcm14MGVadkhiVUkwTlh3U0k4dGlhdjlMNmlCb1h0RGlncnky?=
 =?utf-8?B?b3U4RnlYZm1SbisxQ2xoWEJ2S3FweFdwc3ZNdzlDMW9WOGFHdWdYUElTaXM3?=
 =?utf-8?B?bWhRRkNjeEpHaDBNUGdKbTlubG1lektVYVRJVnZjY1I1MkJrNzhtMVFIVjcx?=
 =?utf-8?B?Vk5iUXI5K0doL0FFamp0bnNlVEtjcVpEOCt0bDZuMXNzMTRMWlFkelhsanF0?=
 =?utf-8?B?RzV4VHltRFc0am0vZlV0WkJ1ampSWlNveUhtR2IrZ0xzK2pTSlUzYjZKc3Fa?=
 =?utf-8?B?eEVTeFFtZjR5VFcvMkVmVnB4dUJ3YnphaktvRnc2RklWaGowQWxjU3dQSWVq?=
 =?utf-8?B?S2JuUXY5UXZ1MVcrTW5RV01URWp0Qkp6WmVRQ3A2NHJseVVSRThpTzRQdUZT?=
 =?utf-8?B?WTgyeTNjZmlHZlUwMC9hM1lhdUJaL0hPdnA5N0lYN29FeVhnaktiTURmYk1p?=
 =?utf-8?B?enl1YXBzdVlJTkNRdUFuVEIzZE02VFllSFFWRGErVnUzZzcrY1BWOW9xdGZa?=
 =?utf-8?B?RzhzbERRSGwvZm9nUkJYVzZZS2hHeUVUOEFBU0JIQlBHSjRicUExZjR4eDJD?=
 =?utf-8?B?Mk03VlNYMHJhZmthS0VzbnBhZXJBZFJKSDgzVVF1NXVwVE8xamVmN0JJaW9z?=
 =?utf-8?B?T1ZWT0dzZVNsUHptY1JIMVhodVVJUHhucnFRcVlWUEp3aThPWVpzRkd1V0pF?=
 =?utf-8?B?TW13VTFnUmhvZjlyZEk1a1IzYXJZQTFuUzl2K3BaVFlEaTk4elIrWkVWNVdx?=
 =?utf-8?B?a3lSQWlNZVNHSktsM04vMHJidXJVY1JiZnNNZUNCMnBMNlB5d1BST2dsTTdP?=
 =?utf-8?B?OUhsSGNpUm5mVkc4Mk43eDRZMUVSZ3hEZTFVY3VsTUY3bnhlT2l0TFlSNVNK?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B/kWyU7iaQv3HTFEJQZum0hQfNf0+jMKTkb6cITXGoh/if9vmwSw0eoY5kyE9dOvJLJGPcKYHm47pM7NjY9fJWs4N3j3sUQ7aoby+7twkxuTICgTimgGRUINxmjIG91qtAR9z5yjHsobhlt1e68wzfTwi6dQJ/mI8xVACDI0d5YZreHF74IZHK/LFnES080NQmf5mPi6+WhlPuj+1M35Wo4rNf5c2OK1oEsu/w2w23PZ7zKJktF+s5bl92C6gBlU1/wsaFcN1hLWpJxRdZmoDoU3/8yrmSjmZQs+qBpc0PXR/UhsRKCMwVZAo4+htPFB+cpvKStzddbhcByaJDEal0Q5BARpXqzDJqYyNEXTOsp7339/Pddgnou3Llo30hHTUxUWtnmEi5dZcR5NRwzwxFxlbHfOO0NwNYcB1rQfYAuxh0IJAJdbIhlhKumLdXR3V6qtLKFPRIAPl+CfYviWNytL+CxdXRsQBrDdWqe0SACqfXBMOPpmNqGYywfezs+hdyUXPswLRoTHQ9qCHdUAU1/FUuvwitKFI0Zc0Jz1sNxwllUDvaZsiTQoqmrclArecl+kCzs+1jNFbrxy/cXOvFzxqyFmkkKQ7rzAt534c6td58tKhlDeeX5KS8WaqA5quyDRyP/50sI4Pvm1rRCWJTsOJSvEvGs4EOnEMIX2DzMz06oR3OnTBv1hw+BKWBiGjpPR8cp+BFs2NWPXF4QUhkzCbODwG7SJOzNOYIPCMyuuwwKSPi2+nbqrKerEuEVzC1NNKADuHSOBkt4GtZrJgTcskms1/BFoLc03ArQjy7U=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fc4b12-e3c4-43c8-6ffc-08db054190d9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 17:18:56.7832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMrrxGVTzsBJM9LnO35LGQu7Wbn3mowtGkxkyCwS5hqqRMxRtyXcifzlyHjG5ZKSTxITZCFq3b0NzV6tNR65sd8FY8RYanItF2pCA18qBc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6437

On 02/02/2023 5:13 pm, Bernhard Kaindl wrote:
> Fixes for Py3:
> * class Delayed(): file not defined; also an error for pylint -E
> * Inconsistent use of tabs and spaces for indentation (in one block)
>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll add this to my pending queue while staging is blocked.

~Andrew

