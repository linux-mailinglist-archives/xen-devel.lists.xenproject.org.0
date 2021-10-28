Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8300543DEE1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 12:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217830.378020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2gG-00007M-SY; Thu, 28 Oct 2021 10:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217830.378020; Thu, 28 Oct 2021 10:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg2gG-0008WQ-PT; Thu, 28 Oct 2021 10:30:44 +0000
Received: by outflank-mailman (input) for mailman id 217830;
 Thu, 28 Oct 2021 10:30:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Bw3=PQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mg2gF-0008W7-6e
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 10:30:43 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16dabda6-37da-11ec-849d-12813bfff9fa;
 Thu, 28 Oct 2021 10:30:37 +0000 (UTC)
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
X-Inumbo-ID: 16dabda6-37da-11ec-849d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635417037;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=aMhRtlhvkTrgMvP8toDW8jUe7lnsT+xFPG0QoHOVOaw=;
  b=aQhj6tEqqM4UkuUNd6nwRNYA0UvpoIq7QNSSuPx/Gn1A5RMV8HhX9v1U
   LInwNWVCK4EnMmQUd6PUt01RWzYLdO/Ecd6gOEN49QRWXSUI11dXDiDeS
   3ES7PM0Urh9h+QsnrkADA5Gm1RC3wbwtVwaviyAnLOPkrdxMQuKAuPlcn
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: F11yVwODpKW/9692EmFKjf4ho1p+xQ6+i9F9z9lIN/hZ7qLXL8knQbpp4ZrWAa6g3IVplBCQGJ
 FSaRgdVFKWsm7jVWmPa7Dv9DXZBjTTbqC+P39rUHED6iPoARJj/4k3HKi5JQjEmosnEQkAO7zN
 5/Z6S9XksSJIueDMw3WPPxaTXY12F6Qwf0SMp15v9jIWwtwT4nC/FoKu9t2VFHscdGLwv7KwNb
 j2WRZnknY9UutsQaD3rwqgthyQUBt+Jg+dkEZV8yXoSe4N2wu877KR/mmYmFW7KtZCGQjhyYAr
 9yiMpwjN1HdjZVuag2NhkHSS
X-SBRS: 5.1
X-MesageID: 56090061
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xaJvQqvPFIP6Jq88jP4SErtT8efnVLBZMUV32f8akzHdYApBsoF/q
 tZmKTiPOPiMamDyf9x/OYmzpEgCusfVydQwGgdlpCozFXgX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cw24jhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplmqaOZxotPLf3hrpNA0RlOBFDL7NF9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY254WTK6GO
 ZNxhTxHNhbZP0JsIHUrLakFvsP0t3jDQmwCpwfAzUYwyzeKl1EguFT3C/LFd9rPSchLk0Kwo
 mPd43+/EhwcLMaYyzeO7jSrnOCntQT/VYEJHbu07MlDhlGJ23cTAx0bU1i8ifShg0v4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJ/KdMU9QWP0JHKvVbJW1UvfgNTdt8p4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZOndaFVptD83L5dhp1EqWH4kL/Lud14WtQVnNL
 ya2QD/Sbln5pfUA0Lmn5hj5ijaoq4mhouUdt1iPADzNAu+UYueYi22UBbrzsakowGWxFADpU
 J04dy62t7lm4Xalz3XlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hfJGS3O
 BWI51IBuPe/2UdGi4csOupd7OxxlMDd+SnNDKiIPrKinLAoLGdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMJrpIf8P8dZCfM9EieVD7nlnnQv7HMmnpzz6gev2TCPEEt8tbQrRBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7dgFXcyJjX8mq+6S6tIere2JbJY3oMNeIqZsJcI15haVF0ODO+
 3C2QEhDz1Tjw3bALG23hrpLMuOHsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:IM94/66QbPek/UgohQPXwVKBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ISuv0uFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH46GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 T4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRsXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqrneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpn1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY/hDc5tABCnhk3izytSKITGZAV3Iv7GeDlMhiWt6UkXoJgjpHFogPD2nR87heQAotd/lq
 P5259T5cNzp/ktHNVA7dc6MLiK41P2MGfx2UKpUBza/fI8SjnwQ6Ce2sRA2AjtQu1P8KcP
X-IronPort-AV: E=Sophos;i="5.87,189,1631592000"; 
   d="scan'208";a="56090061"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfuvGISKDoj74pcblbNB01BCgZXDuid2yHlErL6pMH8lk3v0tLA8/rpp05jPVbnXPoMwRZOzA6HmoHex7uRzgw73aUZwNSlXPlUgMR7Nwo8ql1wmS1o6GHZ5Nj2z6ymuztt5RldLAvng7PRoGT3d5FXlnZnK9kCsUReE+oMlq3I/066Juk3T4CcuJ8MAKvbk8WI+n1WHwnt6PrPwqPMpv9LNAj4QUU/hxVWMoJ4JXv7geRzBmGLi9UQ7t97cRafl0JXLHVujEacibbTiQTwk7LWQa9V//iAuyVWaB3b96tGVH79b71+ep/bdVdKTUWoapjO4xaPng7Uz1gsjUHaqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUCZ0gn6lGYZuz7TP2vGZsgRF18FCCsnQd/3UBtBTP0=;
 b=KzHsB6oUh9XKH8oC/avAzmkPFY4b+7huVNVlD3ZrQy1s/eo99m/xa/y6zIH7tMNfe5YOqFPZiC0MPB8fAtWuLoocaDbrOuBi39gB+BXZT2py/hLYJVi2fQ89an6Hi+JFeONXgEyvHOkEyt9TUXIbeNeliYgaotgROLol9Th0aq2nZXUI5u93EM7DO849jL5WUKJDLEgNE4sXdAVBtntCqQNdQikpO6TkciykD4OEbMTmroukjpNYPTg81RC76PZuff+id0WE/Rg4SOqPBp6HRSrW8u9Hh/9oaN4cyv3nmmBxCZt65kH3VDTy/O3DZ3iov+rtN18gK2WEwOGfPMnCVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUCZ0gn6lGYZuz7TP2vGZsgRF18FCCsnQd/3UBtBTP0=;
 b=oYaNKuET5lhKeyU3vMI1zGIvq7FmHAefWelpcvszxmj0z37xKrn6XwUL9Md0Ph7qz2VDwHBLZyxtSX6je1laT6EdbXTqmukNyEp+opAJhfXPuINMQjdZ5wBPFb2RfDMmk3da74HZwdJS6/n/kxWoijnxzrn6l5KKzJt420XZIXU=
Date: Thu, 28 Oct 2021 12:30:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: vpci: Need for vpci_cancel_pending
Message-ID: <YXp7uHdubtmsG/HM@Air-de-Roger>
References: <fd1328da-5ad3-62cc-28d6-0ec60e9ea582@epam.com>
 <YXp4ovmIsHKTGiw0@Air-de-Roger>
 <9eca8f0d-ca4c-696c-5ce8-4073033f59cc@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eca8f0d-ca4c-696c-5ce8-4073033f59cc@epam.com>
X-ClientProxiedBy: MR1P264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b3e49a9-f876-47e5-b956-08d999fdf182
X-MS-TrafficTypeDiagnostic: DM6PR03MB4540:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4540D2720C8A6EA9E4EF34588F869@DM6PR03MB4540.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OYvbRuZUONw46d3yPhgMMA2+77j6Jf/vnFPvJCA17M+srBEQHNQSKJB3xlniHTE7V6mjLDCbDwV2MU36y3Ea78du3ilqIyL/tbw6Z+n2YsUpR9FOWqiVcD4/2mJ7ySZmGCuERgxyhziAGu7s/ARBN77tCT/7hmO6Bu2lyGIlNlrxJJ9pSaJMhUiFs9VU4H9DePqePmTjTBgL7kSrs/Qn2qGwJENQ1EA4fVQAm4e/bdXb0odrKP4DDNrWrzmu9bXbn8vlRq8d9/lLlWpSP/GzMjnkA7ZtryLk5WO1wLhQ6GpFe0HHWKrpIqfXjoTnSsf8ZeKcbMbeSdDT082adoLeRDrBP3hq17iPYVUWIyJgJqpVm2uV3CeRhAPo95aCAueZPri9kuTRjYexzYD0qnVx0m7G0nD/3JwU/vhCjOxcd6IzxvHEitYib2UFhrRRFrEd55mJbY+pUNiwbjeFBmDHBtDJrlBlDznQYFz/l0u19VOsANvKHtTr8CZsHQkesYtLMeoBi/CHTUuXujE4+ImKjoFKBwX/HPJnOEHs/XnLKg8BgMpI+f/dAXMs7AP31X0YdW1DrO0RPPbI1NTCJU0kzaegAhpyTB0uC10OVAQ7mN/OE7L5Bd7hI2bnjiVk8fhcgt03KEpapZbWz77Ht1VPaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(85182001)(82960400001)(66556008)(66476007)(6496006)(956004)(38100700002)(83380400001)(8676002)(86362001)(8936002)(66946007)(6486002)(186003)(26005)(6666004)(53546011)(508600001)(4326008)(9686003)(5660300002)(33716001)(2906002)(316002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHpJSVY3Ym9MV2wyU1pIR0lneHFNMGdZcytKbVhRaFJFMzJKY3VWZEhFWjYv?=
 =?utf-8?B?L0owU3JnOXFwT04weXB4Q0tKZ2dxVGM2R2VtS3hLUGVLUUtOQkhYTDNQbFVY?=
 =?utf-8?B?U2hYWFRqOTdLeHRWa3hCZ1JNM3NmTUlVczhGUzgzSk1iZm1vUUdLakphelNK?=
 =?utf-8?B?M2xZeDZMTmdIVWNkTWtUdUttSmJwTnRqcDFCVmpxSUpNdkprTFBkbUdWWWYw?=
 =?utf-8?B?VENMYkYybFY5cmlIM2YvNDVaQ0VTWmg2NXFJVFRLa1hWek1sT2d4TkVGWnN3?=
 =?utf-8?B?bVZocDdFWE1Lanlyd25VWlpBcFg3QU8xK09CeGdBek16ZUxrOTRtczc1eHp6?=
 =?utf-8?B?N0RyK09GbTRuUDRtQlUzSGI0YjZtSFM4QkI2cVB2SlNkd0xTVmpaYkIyR0Rt?=
 =?utf-8?B?Tll3aGdsUjNqTTBsV0hieFYydEg4RWc2aHlPams2alo2ZHg2b24wL0dVb3dH?=
 =?utf-8?B?b3lQUHlKZXZ2eTl2bHJxZGJqUWEyUWU0MjJZWE1EMmFPaExmNVBENlIrYWti?=
 =?utf-8?B?c2hUMFhlYnIwTjJHTmYyUVVnMlVpWElYT0tvTlk3NWVKaTJTN2paMTNFZWRY?=
 =?utf-8?B?MktZY3JaZWQwZVo1WXVlUDVIdFA5WE5MQXlJQThFekc0SHhDWjhVaGY0SlM3?=
 =?utf-8?B?ZFRmOHpFdjlJUTgwcnZITUZacks3eXFBdnFIbmpKTmpGSGdBdm9GelBQLytp?=
 =?utf-8?B?UmRJQndVd3hGb09yQWpBTmRHY2lsd2JrZUh2c0lGTU1kRTYzRktDWDQ3Y2Fv?=
 =?utf-8?B?TVJSQm54ZitXUjNPelRRQk5TMHBOUk1YbzR3eEpieFAyOTBuT3dPRW5ObnZP?=
 =?utf-8?B?UXkwdTdKZlZxTHQ5YXFoN0tLYk45VzNrZjlKTDQ3OXJHZ1RXdjZmazV2MUFV?=
 =?utf-8?B?ZHJndTk4d3h0bko4dXlSbjkyUVVDNk52SUkzcHVkcndRakdFVXFYUGF1WVpT?=
 =?utf-8?B?ekdFZEIvNG1FcVQrTXZ6YmtzaWdQZjhucFhCK05VcCs1NFlKVEtzV3UwVzMw?=
 =?utf-8?B?SlVRMWlYbzVUY3hNTUV2empXNy9neXJVZEtkOWhWSEhPb0k5V2pLRElaTU45?=
 =?utf-8?B?Nlp6Ukp3K1VNT3BsNlVYWmYwNTRaM0Z3TnhYdERBZm4vZThkSGI4dG9qeWgx?=
 =?utf-8?B?MUpyYVl1UExBOHVTd2NMYTQ0OFhpRWF2MmR5VytkNjF4MHdZblVHZURZYzJq?=
 =?utf-8?B?SzFNbHFFWHpmVm44Nkc4ZUI2V2VnZXM4SXpaMDRsakx3ekRyR1A4NDRxWnd0?=
 =?utf-8?B?bmJKOStGSUtaNUpFaWVWbHQ0eUpJbWNNUVAzQTNpYTgyVVRTNktBaWFWNGNT?=
 =?utf-8?B?TnpFQ1RvK2hXSXBtR253VTZJbU9VZmFrK3NXUU16V1BxQ3BUNDVLaGJaakQr?=
 =?utf-8?B?VFRqbWptc2oxUklBdkJaK0d6bVhKeVpmb3A4VnVQekduUEdhalRCNmxacGkx?=
 =?utf-8?B?em1yK3hqMVNiaHd4QzUxVVVIdmsxTW9nMHk1ZmRSMTNHWk5PanNuNFNvcmZu?=
 =?utf-8?B?M1VPMHAwWjFBbVlQZEZDanlrNnNkNWgydURSTFNPYmRmZGhOTitoM21TTldj?=
 =?utf-8?B?ZWdZOHhHd1R3MTg3dlpmWmZwVFJQa1AvL0N0QjR2YzJaT1NrZzhTMWNHMEpk?=
 =?utf-8?B?NmF2ODQvUGlvTmJ0RnlvK0pJYTVhQmMxVVpQZHNtKzYrZG51WnpOckNuc1Vz?=
 =?utf-8?B?Z0VWcS9kZEdDNnorT2R3Y2VlaTZ4d0xJeXhReXNPblZGbjNpVmRHa2dGRHph?=
 =?utf-8?B?dS91K1VZbktUS3VWOTg5SkcrQUJHWEdLeWNGUCs4Lzd6eE1oNjV3NEZ0S3lK?=
 =?utf-8?B?U25COUcwV0xtRTRFZktjQ0l0OElWOVp0Z3VRMXFEa2RTSkxWQ2RyRnEweGl5?=
 =?utf-8?B?MUZWMUkzazE2ZWVHSk9GOCsyYTBiend1cytDUncvalo5VEtOTk93V2pjRjha?=
 =?utf-8?B?ZUE0SW5YczlGSDV3SUl2amorNWdHZDQwQkplQ3phRm9jbm5sQUNqaU1hMDd0?=
 =?utf-8?B?NFBCTWZXUlc3TE81MHdmTmE0R3JqVXFWcDNLc2RVU0pBbFdVM0sxaHQ0b0Y5?=
 =?utf-8?B?SktQUGxZZXNqVlBJVktPc0hBS1BsZW8zbEZsVklUTFlsM0Y3ZHlHVEFSYTBH?=
 =?utf-8?B?VHJYSUZqSzR1U3BkYUlidFVEV1B0V3VZMjVkT05XLzZINXRpT3NWNzRtZU9X?=
 =?utf-8?Q?HlwuZfWW3VoncZh92AHmZ74=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3e49a9-f876-47e5-b956-08d999fdf182
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 10:30:20.9537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWRmUNoIDk/N7FY6GPtcsw/wKY2uSpCljbgCaV+APbej9dZ0k4INLC9T9Hw0vS45DDySuFb1KhQw2AJIwtafIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4540
X-OriginatorOrg: citrix.com

On Thu, Oct 28, 2021 at 10:25:28AM +0000, Oleksandr Andrushchenko wrote:
> 
> 
> On 28.10.21 13:17, Roger Pau Monné wrote:
> > On Thu, Oct 28, 2021 at 10:04:20AM +0000, Oleksandr Andrushchenko wrote:
> >> Hi, all!
> >>
> >> While working on PCI passthrough on Arm I stepped onto a crash
> >> with the following call chain:
> >>
> >> pci_physdev_op
> >>     pci_add_device
> >>         init_bars -> modify_bars -> defer_map -> raise_softirq(SCHEDULE_SOFTIRQ)
> >>     iommu_add_device <- FAILS
> >>     vpci_remove_device -> xfree(pdev->vpci)
> >>
> >> Then:
> >> leave_hypervisor_to_guest
> >>     vpci_process_pending: v->vpci.mem != NULL; v->vpci.pdev->vpci == NULL
> >>
> >> Which results in the crash below:
> >>
> >> (XEN) Data Abort Trap. Syndrome=0x6
> >> (XEN) Walking Hypervisor VA 0x10 on CPU0 via TTBR 0x00000000481dd000
> >> (XEN) 0TH[0x0] = 0x00000000481dcf7f
> >> (XEN) 1ST[0x0] = 0x00000000481d9f7f
> >> (XEN) 2ND[0x0] = 0x0000000000000000
> >> (XEN) CPU0: Unexpected Trap: Data Abort
> >> ...
> >> (XEN) Xen call trace:
> >> (XEN)    [<00000000002246d8>] _spin_lock+0x40/0xa4 (PC)
> >> (XEN)    [<00000000002246c0>] _spin_lock+0x28/0xa4 (LR)
> >> (XEN)    [<000000000024f6d0>] vpci_process_pending+0x78/0x128
> >> (XEN)    [<000000000027f7e8>] leave_hypervisor_to_guest+0x50/0xcc
> >> (XEN)    [<0000000000269c5c>] entry.o#guest_sync_slowpath+0xa8/0xd4
> >>
> >> So, it seems that if pci_add_device fails and calls vpci_remove_device
> >> the later needs to cancel any pending work.
> > Indeed, you will need to check that v->vpci.pdev == pdev before
> > canceling the pending work though, or else you could be canceling
> > pending work from a different device.
> How about:
> 
> void vpci_cancel_pending(struct pci_dev *pdev)
> {
>      struct vcpu *v = current;
> 
>      if ( v->vpci.mem && v->vpci.pdev == pdev)
>      {
>          rangeset_destroy(v->vpci.mem);
>          v->vpci.mem = NULL;
>      }
> }
> 
> This will effectively prevent the pending work from running

Can't you just place this in vpci_remove_device?

Or is there a need to cancel pending work without removing the device?

Thanks, Roger.

