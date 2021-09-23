Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC1416150
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 16:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194340.346201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPwq-0000Xp-US; Thu, 23 Sep 2021 14:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194340.346201; Thu, 23 Sep 2021 14:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTPwq-0000Uc-RN; Thu, 23 Sep 2021 14:43:40 +0000
Received: by outflank-mailman (input) for mailman id 194340;
 Thu, 23 Sep 2021 14:43:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTPwo-0000UD-O8
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 14:43:38 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aedf81eb-4966-446c-a304-5ea23a3db700;
 Thu, 23 Sep 2021 14:43:37 +0000 (UTC)
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
X-Inumbo-ID: aedf81eb-4966-446c-a304-5ea23a3db700
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632408217;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XJvEERLCN/XxEr4BePaaduZAx41IlMhjyB+i5cYk6AU=;
  b=KW0wN6a8UZR2qjWr3p/SLyIWPAekX+ZC+9SlnG6ZiRN3MgndX/B0zBsv
   3ibFqkWz8Buq/VkltrDpHQlq9mltx4HZUaCxX86FrHopFKZwE92AGW5PT
   UvAN75+8BpzHe6OocAGC94TSDDvtQCYTM1aq8LOxvgjRxRdPitMJfddON
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: G11mm8YVrmt3AbN3jnhqJSiNH0WcFi1DiWudyZi5WJTUbqSxE6rlHFRAYebxiUVSYFCeNqWXzr
 9QpKyFxInjBv6YaQHHZJv1p1bzF7fxhI7M3YXyLfJk0uzL5mukAEeniVKMA43/R3jqT0qA2DGN
 XD1ZagwvcK0yOu+XCkWeGQs46nrlHBtD+MIA2zUq7B3vP4HqPLE+l+CpFchTjNWWiF2Kz//ijW
 TjIZfzt86fULGYVf9icFAcSj88mF2XzBGtXqYoiY9eNhMbhgY+LZ829/br9RibrRy7rsGZKH3B
 Dm8Wb41V/uoUxIUxl9/YNIPj
X-SBRS: 5.1
X-MesageID: 53865162
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gmz11qPxArvmqeHvrR17kMFynXyQoLVcMsEvi/4bfWQNrUol12MHy
 WMeWm3SPKqPN2vxfdtwOtu29UNXvpHcyNIxQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En552Eg4w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxCNj9Bq0
 Yxcib/qbQo5JPXBl94QXiANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/iRtYEFhWlq7ixINfGCY
 9ozMRw/UCvvcgVsGFYyJ6sZrd790xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOGTeKR0xDkHYgFc
 gpNp3Ro/fNaGFGXosfVehmooGWd5w8geIB0Hv0gsAyC8KfZ2lPMboQbdQJpZNsjvc4wYDUl0
 F6Vgt/kbQBSXK2ppWG1rejP8GnsUcQBBSpbP3ZVEFdcizX2iNxr1nryosBf/LlZZzEfMQr5x
 SyD5AM6jq8a5SLg//TmpQ2f695AS56gc+LU2uk1dj7+hu+aTNT8D2BN1bQ9xawbRGp+ZgPd1
 EXoY+DEsIgz4WilzURhutklErCz/OqiOzbBm1NpFJRJ323zoCT4JtgIu28kdRYB3iM4ldnBO
 hS7VeR5vsM7AZdXRfUvP9LZ5zoCl8AM6ugJptiLN4ETM/CdhSeM/T10ZF744oweuBJErE3LA
 r/CKZzEJS9DUcxPlWPqL89Age5D7n1vngv7GMGkpylLJJLDPRZ5v59eawDQBg34hYvZyDjoH
 yF3bZDXlEkPDLOkMkE6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVACe0EXLz2i/KLxukcHdmZO+9VJpztytjbyctIUypyz4oZoP2tPUTcJ4+fL8G8u1/zKErE
 6lZKpvYWvkfGC7a/zk9bIXmqNAwfhqcmg/TbTGuZyIyfsA8SlWRqMPkZAbm6AIHEjGz6Zklu
 7Sl2w6CGcgDSg1uAdz4cvWqy1/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA+tZn/sPIiKaIq5aSP9F/RkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76tbi++1awwBjECmZZlinEOo9cHyP3M0JvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzreiOXkhlNhWRjDBQceluO4Q/z
 OZ94MMb5mRTUPbx3gpqWsyMy1mxEw==
IronPort-HdrOrdr: A9a23:i4smHKsyZmt8Lg3B59aXTsPu7skDetV00zEX/kB9WHVpm5qj5q
 STdYcgtCMc6Qx/ZJhOo7y90cW7K080sKQFgrX5Xo3IYOCFgguVxehZhOPfKn/bak/DH4VmpM
 JdmsZFZeEZRDJB4/rH3A==
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53865162"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNW5xPJnRLT6xxqSL/qUTc3aUur+3sDo1vUIDLg5KlH84cQNqE18UsGmGpWzXa0b9RvzyNX/BHra5/oVKLW0UBqW8clRKHllFFSKO8stACRY5V4iaVS2VOeo+bqmyU0P6PvWOQbMPVITm+mehU63uP4Z7gMN6GhDpTRdoSCEz/zTZcxOCGYHAzNUaEkqZGKoGBJYwNVoAcAHr+iYynElNxGo9Ihy/u2LaLIGu1Ex6xZ9gpJrAU5N0cDpNgLE6my7j5Scsnr+UAlvo2co8RJTmkrIjdMIYSLDBH/A9s9WaxWD6eIMm21TwNfxB0EUlNIAfy7GEvCPaG+0DzxD3q6SNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ex+r5cO30xvtc57Sq7mNz5e6J4VNRSJqIfeh3v66rFU=;
 b=lsHftSTBKqFjGybhE+qElsLgdVzXFADDxoepgdzjnYrEdSYw6Luuwj/jKvOXdSGH53ljjY9hLoja+huMPgen1MJYjlZQ0FoT3kxTeJSbF98+u/EKc/gh3l889AmFGaTX7c9VxkaGvdq0WbqF090cTwZYb1Q4wWHZV29UUko9W31Uy+xrP1XRZtC2zB4nDpwoPtpurnNp/zT0G9VjFb/YeGhXMRAee58fgH6xEBWfgzoKO4gnQhUd+Ag4YPvCr+KuAe7H6HDpRonMhfWo94/1ooEkT5ZyGjC7taeG8/cqqS4AGtaufnTXWwZES2YBGWu/FOJLODh5tnFdKfq2Wm1CCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ex+r5cO30xvtc57Sq7mNz5e6J4VNRSJqIfeh3v66rFU=;
 b=HKBStHBfAWiVv5RsScYIVe0fncI4Tyq+7UMTbSszlTDZ5O/U9s2VvnMCmH7P60krndJXyevf4EmTxVpWj7KJyv8IrM2QmlYNufJ/zUtXuxsUCn0MofXSIQ00Mkd0vSdMVzkX6nxQLXgBW8LaxPepyskZhygjzxmfotJt2tQZpe0=
Date: Thu, 23 Sep 2021 16:43:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 7/9] x86/PVH: actually show Dom0's stacks from debug
 key '0'
Message-ID: <YUySj7w0ru9xfvE6@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <ca129fa5-7165-a9ef-4e57-75c43a708960@suse.com>
 <YUxXcrMiPDiGkdw9@MacBook-Air-de-Roger.local>
 <3b292c10-e346-4af0-1575-acdb060f0c41@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b292c10-e346-4af0-1575-acdb060f0c41@suse.com>
X-ClientProxiedBy: LO4P123CA0337.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23e76a7a-ce07-42fc-d24d-08d97ea083a5
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB49698CD1CC05E448A5D4BD948FA39@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qbfjwso4o/bJXNsEEyFLc1IvDIr6+WgGkQJ9ZntQzUWn263VrOd3BKisalDoO6GzSkjEV+VVW0yanISKaQ5+WPlCZpXtqN6NKKd3AOG2aai6NuA7c/BxhgIdVMSwTEzXNozbLe+haWwrmxHBFXly+F5s4E4jDUA1fkzJGslwfjwhuBLJ1vKW7wnOnWlo/dRsyFUt9bfR0C6W0ZSR1TxTyuZHSF/MmNB9AcPKqwRAkA/uX7qNUh4aOxQoWb+wiWKAY4x8h/FUrJ2+nPee7/8YrSmA+0Kh90osSezXMXQ9yToWLvAUTWo/NkZb18GYLT4AsJPrB7C1qA6A+rdKuR3FQV8R8+1VOWbwyfXts+sFPHkzz+SHgQZVoZP2elaCiC7gpIYyJ8QwQVJKVuk99BnLDr9eEvGXBXMBvNJ9n/hUDSsumxiaZpCbRMPYdEu/959VbM6oJ9UjGNSKY7CIXZR+xxa3q4ItEDZezOrbjReV++XxNgtpoyXqpbtoGJVFQYyM/IBZpIpR3Qx/svCct2oSTr7JfoV8rsIE3twl/H50h52XG6oY+PjUAtRxF2i+0wk7GIkQFyC1MSrMfap7b4HABnnB3/Dho5SpYTWC3MVBbcQ2idPNJ0xNJff4emXTVf16bXA4SmbdDxJIbHaCKwTtwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(85182001)(6666004)(316002)(8676002)(86362001)(6486002)(9686003)(8936002)(2906002)(4326008)(66476007)(66946007)(66556008)(508600001)(6496006)(53546011)(186003)(5660300002)(54906003)(956004)(83380400001)(6916009)(26005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0NxTk90V3lCN0I2aEFaUWpkM0Z0NUx1RVh6VUxIZS9NdE5TRktHbFVHM0VN?=
 =?utf-8?B?UnVuNzVkclI0NlVFY0tZVlh4bW54NUNGc09FRTBOOWdyMitwMWEraFZxU3Nq?=
 =?utf-8?B?cy9uNmw5QXBBS09OOUhLQm1VRFVKUWZ4WWs4bTUwT0V1VWtDR1RtNUxYN09D?=
 =?utf-8?B?bDRXaElKSGE4S3FJUUJEMVRyK2o5cVJrLzBEMytwZnhlM1hvemdyMnMzbVFX?=
 =?utf-8?B?Ykc5N0IrMUtFU3ZjSTkzMkgyM1Jtb2Jzdm9mNldGVU5rRExxbnFISERCVUVq?=
 =?utf-8?B?UDlpNGhzZGMvRG5WdHA4S29EVER3MXIwL3hUeHViTVg0b3hTWi9WWDZHbGFT?=
 =?utf-8?B?WDRHa29HYnI4SWc4R0drL3ZDVG4zSHJtaTFXL1gwSG93c1dlV1VTUTNtSzFo?=
 =?utf-8?B?bEw5dEx2azRMN25OejBvK0JYUzcwdEFBOFlETk81NnFDbURWMFhSMFJIN1Iy?=
 =?utf-8?B?VnFHdk41Z0QxWmdsYTJtanZaRW43WDJSN0U3MllSTmZtR2VGdFArcVFlbW9K?=
 =?utf-8?B?NUFtakZNcEVZREY2UER1dXNSTE5lSEwvb0ZVR1JQTkVJVjRkRHVSMExzcXBQ?=
 =?utf-8?B?R1VsME5UYzV4S2dlUG50Y0NCam82TVMzR2JmNTNRVDZ3b3A4OTBjdGlYb0Rx?=
 =?utf-8?B?WnF2V0d2SkZJSjc3Y2dyS2hFL3B0MHNXVnNtTVFFWlFjYWZOL3hld2FjanU0?=
 =?utf-8?B?Um9IWmVXVUZmVmEvMWFvS2Q1ZkxWRXM1Q2pyYVA0dEVkOTRGTk9DU3FuZ2FH?=
 =?utf-8?B?eHR5V0tIVWtNNGRBQnZTcERDdnNOWTdZQTdLR2twWmdKWlNzempWb2lOT1hO?=
 =?utf-8?B?VG4vRWl6VGhEczlLa25GOGIvUVRIdFFma0NCM2JTQ1RxRDhBNEtzMzdkUTcv?=
 =?utf-8?B?MlBPVEdUdkU3U3B1OEEwekxieWpaYmVsaVFtQWFDaXNxdXd5dzNuVTNHRUpv?=
 =?utf-8?B?NGsvamVmKzF6UWUzM293TkpDak9oSGZoaWRielA2ei9kR1lMY1lzU0NtazFt?=
 =?utf-8?B?U1B4RVk3UnFpZFU5QWI1NDJSdDhXUm9mTmtqSG9zU0tLWUhhakpoemNiZlp4?=
 =?utf-8?B?dXRKOTZleFJMR2NId2ZlN0MyaHRoWHpiTUVRMUZVZ1dCaEoyeTJNVngxOVhh?=
 =?utf-8?B?VjYrTWNGM1RORWVnY0hYVHFjUkdvOUhVN21odHk5L3NQTm9ETm1TbDBpdHpn?=
 =?utf-8?B?VTNteTR5WTVwbUZ5NWtlSmtRZHZFTVpmTFZzNlJGekVPak9KT3FtTCs4RGEv?=
 =?utf-8?B?TG1RSnJHZkJoNHpnZVhxRVhnQllCbUJaaHZ1d0tmWjFpbnlFZ3VVajRtbUlq?=
 =?utf-8?B?OVk3MXNqZWZTcFVhOFN3ZVhMdll6a25sU0tnbmJOOGFVb2tKamhCTWVtQXo5?=
 =?utf-8?B?U05FRVhMY2t4bGd1b2ozQmFaV1FjVlYyZEtMYlVub0tIQ2hIb2JGZG1Vdmxs?=
 =?utf-8?B?V3FzVFFGcjd4b2JtQmN1NDVsSzNqSmRvS0ZqM2doWGtWbXRkNUlHM3hzTTJ6?=
 =?utf-8?B?TXJpMnBSWGdibUFLUU9RUThWaHNlVDlCa2xvbFg0anZzTVhwSXdrWVFnYlM3?=
 =?utf-8?B?d3NjOGtzQVNLTFdnb2xlOFZXczB3djVxZ0RmeHV6S2N2aCtWdU1jWDVPL2hl?=
 =?utf-8?B?REMyUkpMeGJ1b2tEd1RNMldQY1hRdk5JWnU3dmpsa0k1VTlGejJlb05HU2Zm?=
 =?utf-8?B?VmZETWxKR1ZTWUxoRHdub0ZTamplbmFGaThKZVBCbUtiQ2NSMFZaOGVZQXBZ?=
 =?utf-8?Q?ge8RUbKlcywXdeZjs4+NLZPxQ257OWW243Ze4QC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e76a7a-ce07-42fc-d24d-08d97ea083a5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 14:43:32.1033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJsGuRLac5l4VXahZcwDuYjueQkbB9L3LU8uu2K7+JNw0ZF91pQdeS5XlalOv+Fiy8PERiNpnsMLONkp1T3zRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

On Thu, Sep 23, 2021 at 12:47:26PM +0200, Jan Beulich wrote:
> On 23.09.2021 12:31, Roger Pau Monné wrote:
> > On Tue, Sep 21, 2021 at 09:20:00AM +0200, Jan Beulich wrote:
> >> --- a/xen/arch/x86/hvm/hvm.c
> >> +++ b/xen/arch/x86/hvm/hvm.c
> >> @@ -3408,6 +3408,15 @@ enum hvm_translation_result hvm_copy_fro
> >>                        PFEC_page_present | pfec, pfinfo);
> >>  }
> >>  
> >> +enum hvm_translation_result hvm_copy_from_vcpu_linear(
> >> +    void *buf, unsigned long addr, unsigned int size, struct vcpu *v,
> >> +    unsigned int pfec)
> > 
> > Even if your current use case doesn't need it, would it be worth
> > adding a pagefault_info_t parameter?
> 
> I'd prefer to add such parameters only once they become necessary.
> 
> >> --- a/xen/arch/x86/traps.c
> >> +++ b/xen/arch/x86/traps.c
> >> @@ -364,6 +364,71 @@ static void show_guest_stack(struct vcpu
> >>      printk("\n");
> >>  }
> >>  
> >> +static void show_hvm_stack(struct vcpu *v, const struct cpu_user_regs *regs)
> >> +{
> >> +#ifdef CONFIG_HVM
> >> +    unsigned long sp = regs->rsp, addr;
> >> +    unsigned int i, bytes, words_per_line, pfec = PFEC_page_present;
> >> +    struct segment_register ss, cs;
> >> +
> >> +    hvm_get_segment_register(v, x86_seg_ss, &ss);
> >> +    hvm_get_segment_register(v, x86_seg_cs, &cs);
> >> +
> >> +    if ( hvm_long_mode_active(v) && cs.l )
> >> +        i = 16, bytes = 8;
> >> +    else
> >> +    {
> >> +        sp = ss.db ? (uint32_t)sp : (uint16_t)sp;
> >> +        i = ss.db ? 8 : 4;
> >> +        bytes = cs.db ? 4 : 2;
> >> +    }
> >> +
> >> +    if ( bytes == 8 || (ss.db && !ss.base) )
> >> +        printk("Guest stack trace from sp=%0*lx:", i, sp);
> >> +    else
> >> +        printk("Guest stack trace from ss:sp=%04x:%0*lx:", ss.sel, i, sp);
> >> +
> >> +    if ( !hvm_vcpu_virtual_to_linear(v, x86_seg_ss, &ss, sp, bytes,
> >> +                                     hvm_access_read, &cs, &addr) )
> >> +    {
> >> +        printk(" Guest-inaccessible memory\n");
> >> +        return;
> >> +    }
> >> +
> >> +    if ( ss.dpl == 3 )
> >> +        pfec |= PFEC_user_mode;
> >> +
> >> +    words_per_line = stack_words_per_line * (sizeof(void *) / bytes);
> >> +    for ( i = 0; i < debug_stack_lines * words_per_line; )
> >> +    {
> >> +        unsigned long val = 0;
> >> +
> >> +        if ( (addr ^ (addr + bytes - 1)) & PAGE_SIZE )
> >> +            break;
> >> +
> >> +        if ( !(i++ % words_per_line) )
> >> +            printk("\n  ");
> >> +
> >> +        if ( hvm_copy_from_vcpu_linear(&val, addr, bytes, v,
> >> +                                       pfec) != HVMTRANS_okay )
> > 
> > I think I'm confused, but what about guests without paging enabled?
> > Don't you need to use hvm_copy_from_guest_phys (likely transformed
> > into hvm_copy_from_vcpu_phys)?
> 
> __hvm_copy() calls hvm_translate_get_page() telling it whether the
> input is a linear or physical address. hvm_translate_get_page() will
> use paging_gva_to_gfn() in this case. The HAP backing function
> changes when the guest {en,dis}ables paging, while shadow code deals
> with paging disabled by installing an identity mapping
> (d->arch.paging.shadow.unpaged_pagetable) which it would then end up
> (needlessly) walking.
> 
> It really is - afaict - intentional for callers to not have to deal
> with the special case.

I always forget that we change the paging_mode handlers when switching
between modes.

> >> @@ -663,14 +728,22 @@ void vcpu_show_execution_state(struct vc
> >>      }
> >>  #endif
> >>  
> >> -    /* Prevent interleaving of output. */
> >> -    flags = console_lock_recursive_irqsave();
> >> +    /*
> >> +     * Prevent interleaving of output if possible. For HVM we can't do so, as
> >> +     * the necessary P2M lookups involve locking, which has to occur with IRQs
> >> +     * enabled.
> >> +     */
> >> +    if ( !is_hvm_vcpu(v) )
> >> +        flags = console_lock_recursive_irqsave();
> >>  
> >>      vcpu_show_registers(v);
> >> -    if ( guest_kernel_mode(v, &v->arch.user_regs) )
> >> +    if ( is_hvm_vcpu(v) )
> >> +        show_hvm_stack(v, &v->arch.user_regs);
> > 
> > Would it make sense to unlock in show_hvm_stack, and thus keep the
> > printing of vcpu_show_registers locked even when in HVM context?
> 
> Perhaps not _in_, but before calling it, yet - why not.

Indeed, with that:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

