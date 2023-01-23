Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481466779DC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 12:11:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482761.748444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuj7-0007WD-Ah; Mon, 23 Jan 2023 11:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482761.748444; Mon, 23 Jan 2023 11:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuj7-0007Tb-7r; Mon, 23 Jan 2023 11:11:01 +0000
Received: by outflank-mailman (input) for mailman id 482761;
 Mon, 23 Jan 2023 11:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTo8=5U=citrix.com=prvs=380e0b34c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pJuj5-0007QZ-E8
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 11:10:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b22360c-9b0e-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 12:10:57 +0100 (CET)
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2023 06:10:50 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6790.namprd03.prod.outlook.com (2603:10b6:303:178::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 11:10:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 11:10:48 +0000
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
X-Inumbo-ID: 9b22360c-9b0e-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674472257;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rM9DSQIxYciNDglaL20GVtHT0dRWq85YIEIHFnb+y8g=;
  b=Nuvw4LxO10wx8gnIoqowK6oDuACuNdqmkMP1zzLGZZW/rkdbpuLEQaMw
   IK9V28+HG+4GlxGcFmSAAfphYlax2ICBVL7oLU72OFDv72u/8tONm0F6W
   aSRnAXN+dc/B1Md8+AG2kQGhzYWKsp6rznLLqX27VsEh4lHR6ZOQ8aIbS
   U=;
X-IronPort-RemoteIP: 104.47.59.171
X-IronPort-MID: 92696323
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eU3Wia9KY/SLI8/u9rcWDrUDNX+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WAfUWCObvfeZzSjKtpyPYq+9hsCu5bdn9VgSAFqqiE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKoQ5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl//
 vUyCzkiUCu+pKGG/+6qDbNhmdYKeZyD0IM34hmMzBn/JNN/G9XvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWCilUuidABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCdhMRePjrKUCbFu7mkETJQ8bakeBneCmgWuDBf5Zd
 HIm9X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8+B2FD2IJSjpAbt0Ot8IsQzEuk
 FiTkLvBCj1mtrmIQnu17LaKqiizPyNTJmgHDQcOSgEP8tT4oIU+ixvJZtlmGa+xyNbyHFnYy
 jSLtzQ3hq9Vg9QC0a665njYjznqrZ/MJiY+4QPRWWCp5x14f6aqYoWp7R7Q6vMoBIGdQ1qav
 XlCmNWE6+sODpalmymEQeFLF7asj96VPTuZjVNxEp0J8zW252XlbY1W+Ct5JkpiLoADYzCBX
 aPIkQZY5ZsWMH70a6ZyOti1E55zkvGmEsn5XPfJaNYIeoJ2aAKM4CBpYwiXwnzpl08v16o4P
 P93bPqRMJrTMow/pBLeegvX+eVDKvwWrY8Lea3G8g==
IronPort-HdrOrdr: A9a23:CJ+4tq+3it9Q7nLMYuRuk+DZI+orL9Y04lQ7vn2ZKCY1TiX8ra
 vFoB11726WtN98YhwdcLO7VpVoI0mxyXcd2+B4AV7IZmbbUQWTTL2L4ePZsl/d8yCXzJ876U
 9rG5IObeEZAjBB/KLH3DU=
X-IronPort-AV: E=Sophos;i="5.97,239,1669093200"; 
   d="scan'208";a="92696323"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cq57Wn54lLisFpVOg5WyiBQ3lSJdpWJJLD0ROwypjQrtF4BJF4uQWNVNhfXqxjhEhMAUOqGNK6Hr8G1SADGflQRn3adVNPUjiDBTUoU0yoax7ssbo2IPKjdKAHsRnAeD68ibC1jZeI2uxox0QWGsQS6t6/WMgOgBFrsANdKDWF7IGTYfnXl4CcYmV9NN+sHaTT4udsyTZi4CmNiW0ppGGsm4UaHVtYAU9VfYlOHDqxjrKAGswbuGQejNaRjaBsXJJ0UH/UVqX4KK2dUq/OfXhHz6f+V7tzRVo45ev73VJJfz2AkL/69BdA0S+lSfW+8b2gCwvNpPR7sTGbJ8WHSC+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rM9DSQIxYciNDglaL20GVtHT0dRWq85YIEIHFnb+y8g=;
 b=IOu+5iBa8vlxUXDGzh/Js1VscgZm9t/aCoZMbtqX5h+n48qrp3MdT1m6JhIJAA3q9cKIrZimEmlymAhegBTn3defgDwcSutQQhmQNezjL3tgsEVkEQmhWJ2Rd6RCtgLKN9s7F6/ksJqNGsFvHICVGvdEayP1l2zFUfazfteS6+POePheepAXdsji8WvPAX5yXVuYNEfjtX/snORz3XFMUs2c1OPW0eMrmnT0N/UYna8bB4j7Dkrr4m91O9oIdT5x7ej9aOX3zMg4obD6pa28ci6wSd3rlEbJu4lyBkzQ5nX1Xsl8RK18/hyQppUf4F/O6GdxnYHi7Ztdw1UmtCQHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rM9DSQIxYciNDglaL20GVtHT0dRWq85YIEIHFnb+y8g=;
 b=WBd7ZibjcXZrBWsVM2ubd14rPLvGe9/iukmafZf7Ered5A0Reo6/8hTlyNe9AOTIJcX+QB+zDfsK4Y1Dd16XJc2/P+4mr0X13Q0ooZF2N80YrSRlCdAJDRc5GdMmD+XSE1Zujl/b3njtcQzEeEL24MGYZlO4cWud1GU+x2C/MVM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 02/14] xen/riscv: add <asm/asm.h> header
Thread-Topic: [PATCH v1 02/14] xen/riscv: add <asm/asm.h> header
Thread-Index: AQHZLN/mQOdIReGXikafzlTdFxmXvK6nbsiAgARrVYCAAALRAA==
Date: Mon, 23 Jan 2023 11:10:48 +0000
Message-ID: <9a82205e-acfd-0704-43aa-ab01e19d0e85@citrix.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <621e8ef8c6a721927ecade5bb41cdc85df386bbf.1674226563.git.oleksii.kurochko@gmail.com>
 <610308ac-3440-e84e-02ec-928f0652e9d3@citrix.com>
 <e82c32fa-4318-96e8-4c0a-eee26b1cea74@suse.com>
In-Reply-To: <e82c32fa-4318-96e8-4c0a-eee26b1cea74@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO3PR03MB6790:EE_
x-ms-office365-filtering-correlation-id: cc39b212-56de-47f7-0936-08dafd327b24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mQcgZP02zLu3TMruPh3LBuuDZg5qYQ7adlYyPFJtDC0ZdFNTv55nFv0id2KSgHpcEyZv4suicG49ltgsQN9cKIlprhrVnrYpTdlRhtKXhQfdRg1lU40srDgaE7+EtS9klrD9szvVbDXeNUcZdb6TrcaZORyX+DlULFIlkxiCe80qKyujIRGgSPZnJPiGa0A7XLi/bbcI2CI9PAR15Onow0AZrtZD4DkxkaKM5+hruSwfz+jZycpuSczbddJwgjPdtvZI7haKaBL+drKsUbR0+r56qej7mbKLZC0cWn1O2ccqWEL6VpJlg29qdadhI1iOjzpqOtWekIuJZRUkj7Wqr1NMrnH3pq6pBnc/AmmjLyNquixaZ81aPOhqfLSQZuoZLBzEoIj+NPrYjbsZ6jS5e2hM+KEjKs23bqSDC92UNibz/67/Z4fxinWfpWg8iaOmLj2o8zrrSaPzhoLQr3qVv71uLYAl7cAULgqF2adeQ7lGeeCZJDY3EzDrlrkZ08m9LjCR0mET7LW+HGygXP7VhelDEpZq1w/ZXMRRpiDrVsM2hl0RprGfX3WJLk0MgSNryouyi+WM1iyFkw5YoKAWJ84zeE5wThGHBoYWGkjlRZOvPhUXfpE/eQfRwBHJPmOTn9U9h9JUj2Q7qwaRGuVJJzjQS/kyKoyx0cUgWFxR6BDkF76/6vCgzjujmCwWeUrbFgh4h+Jqt3SttMWSzi98VW16NIBoNftqvq+3HQCu6Zl+nn8+GTPbKQxfNvEXhLwd5mZ/Qp9MSzmZr6uYatDYNQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199015)(122000001)(38100700002)(38070700005)(82960400001)(31696002)(86362001)(41300700001)(2906002)(4744005)(4326008)(5660300002)(8936002)(6916009)(8676002)(26005)(53546011)(6506007)(186003)(6512007)(66476007)(316002)(66946007)(54906003)(2616005)(76116006)(64756008)(66556008)(66446008)(91956017)(478600001)(6486002)(71200400001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEVOZFhQMXZXektxUWNrdE9SajR1aE1obGplNDN4RG5vb0FlUUx1OStSTDNq?=
 =?utf-8?B?bTFFYlNMODM2ZTVNTy9xdGtMZXZoNjY5UlRsMWVlamtkaS9SU1NlNER4YTFz?=
 =?utf-8?B?eFE5VlpyaFZzamV1RS92d09BUUVLRnI3N0tJTU9uSkoyRnpHdTVndkthMm9W?=
 =?utf-8?B?VDU2OXVPQzcyK1Q5ZEc5aGljZThpQ3kydW4veFFmNU9vVHd0SkRtOEpnb0RF?=
 =?utf-8?B?dEpxZ210QVIxdisxMURQZVY5Tk1oUUk4ZDNleWRERzdZMysxS1hHY045Lzkv?=
 =?utf-8?B?RUsreHlhY0pjS3YxOUNpL3NzS1QyWTNsRnlXWWl1Y05Da2RtWmZlLzloYmNW?=
 =?utf-8?B?YjJPdG1BMnlCMzFqMzFoLzVYSnRMaHlZSTg3RUhqLy9nUllQSThDMGFzdnFt?=
 =?utf-8?B?ZWxWQnlnWWYwZmI3ekJMRFRjSnpNUW5vekpPUVRLZzFCdnBDV1NFamNVZTRM?=
 =?utf-8?B?cGtGc0VqKzQ5anlkR0dlY3cxd0dTVEd2OFg1KzVtOHBCV2pBb0hRRGxCZFBS?=
 =?utf-8?B?M2pBVnhWdDBtTTFuWkJsT2hGbVN2QVJ2ejZPdjZCeTFLZURGQU4zeTRxRmRN?=
 =?utf-8?B?aWpaaG9EMzIydGliQnlKZkhrNWdobHgzNjdzakVsSmVxV2VOYTJldkdPQ3ZK?=
 =?utf-8?B?TE1aOVdLZ0hlMVFGK25xaDQzeHAxc2ZUQlYwOUhOZ01yOWFLQUZFL0Q1RWRo?=
 =?utf-8?B?RzJjeWhsUVZvbHptSDJqcU9qSHFUZklEL0NhV1Q5eWNkeVdxWFA3UzBtb0lC?=
 =?utf-8?B?b1VaVFFaM0gzVUhROVc3YnhKM1VCbjY4eStiUTE4bVNrOFg2bUpJeDhqd1g2?=
 =?utf-8?B?MW4xSDV5RDd4eUV2NndHOXdEckIxS1gyMk83Y2xVRXd6WXBqcGJqL2JpTER6?=
 =?utf-8?B?VjZqZ3RJd1phaW8rQTE5L09vK3RVMUFINmhNU1JJSVlOM1J2OHdiL3lDdVU3?=
 =?utf-8?B?ei92RmlIMnVxYXhJSHBIK2xxVHMxYjNwcTQ4aFJaRUsrQjRnYjZIWWFIYXk0?=
 =?utf-8?B?TVVlSFh5RTFBcE1YYVVqdEtMYmxEWlZydHlYVForRitPWGgwK1RFOEVVRnZB?=
 =?utf-8?B?elc1QVVGQk5MMVpoUTluNkRXK1RIcURvcG95enQyRnM3VDhTSFB0M3FuWUY0?=
 =?utf-8?B?RllkVTVnNENRUnZwQk0xOGw3SGpOanhja2VQNUEwTWNVL3ZJU3l3YlhOaVlF?=
 =?utf-8?B?RjZuWlErdjJIMHdRdmkrY1dRZkZWTVlsVDE0aXNoMERCcDZzQVFBVTNRYmpa?=
 =?utf-8?B?UXRZMGNtaVVxdENGV1RqTmxPZUJGQzhKQjdJRzRlaFZzbFlKM003S2gvemlK?=
 =?utf-8?B?RXlNV0FoeHNHY1AyTEJHWmNBTjVIeEFGV2loQmsvNHp6OHloZHFCSmZDeWQw?=
 =?utf-8?B?MXdqN1V2THRRTnRoK1I0WEpXZE9rVTlmQ2ZzVVNreUk5VnhPU0hMTFVRcEhY?=
 =?utf-8?B?WFRrVWdrS2lmdGlGWjlmMzFvbjdzenVEaFFzYWhIbmp5VkF0akladWVzUFVQ?=
 =?utf-8?B?UE9IaWh6V2ZnOFpFc1g1VUsveGZGQkJvaFM2SEdLTDlEZWdQOHY0OFBtemRF?=
 =?utf-8?B?amtGVWF5dWQ5akpTY0k3dnNlVTQ2YStQWXhKMGpReFJEcTBaRnhsRHA0VG1l?=
 =?utf-8?B?UUxaY0dNVUg3SVA2c0tHR2pVeWRwQjFMWmE5UkFzSXdtMUlCcThaVjVIM3JQ?=
 =?utf-8?B?dmNoTHV3SFh4L1BJWnhoNEdjY0dHeDJDWE4zb2FrbDFzb2Y4OUlsZCtMUlVz?=
 =?utf-8?B?VnFTZ3pERzFDT1dRci9EOXdpNVJ3dGVEK3lmZGZNOEkvdGd3UklZUlJpTWMx?=
 =?utf-8?B?NnlRWHpHVEVvWTZqKzFIeGYrZnhLZE5OSHJXOFpEK2FUKytqNDNGSjhPbHhO?=
 =?utf-8?B?NEUwUCsxemk4Q2NTWm84cExPU2JaMjNkYTJaNWdjb2RWYVRFL0tzTXM1Q1Jj?=
 =?utf-8?B?c0I5V2lSNGxkdFBCM3dBeHB6eU5XNURVSUhnRnFHcVVPZnBPRTh5aTYrVnJm?=
 =?utf-8?B?VHd1OElEaXZQMEt1OFlPaExhbmlZYWd4bHJhaXVsZ0E5TjFKWjQxQUxaNDlk?=
 =?utf-8?B?YW9CS3c1RUllQ0gySTdIMkVZYkxkV2RoU2lsWVlHMnVKVTFEMVNERS8yQXJM?=
 =?utf-8?Q?e34pfyoV92E7vwPHuLUsq+pD8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C716BDAE5126B4489E38EC881F31617D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oq9OV6IwZuz2BCXkSXYDer14NXldWUwbR8pEFHdoWDXUD/5xohjVB24Ef6ajRXar9td+2wzdEQtww5EBcQu5N8hvqy+reMNG2BnXPtwrhRwJR2nqghz9v1s9cpuBuLJja2Y+YuglDkFCTMuGS/r++YTa4Md9npZU8QwDpFY4GG2tVaCgt/q0fcC+49fXEAjZEObMLmbIvwLYVfy024kZyjHiYCP2O1PFy/XTK52/wda3hbLRjekI0AFRggAsY5RIOHmAUYEwGU2z3LqGGDJ0mTgvN2nQx3aZz/M5S4qIXtiZqufd3WlHXacbUUR9jlpiO4bWnXjlDSrOoS1Z1H7aO25S4q/tJqmJez7cxLixGitDQdz59RxVgOR39XH0mazLiy3NkYW1cZZ9FBhlYofC/dv7163z/AGEGebqQxgAd4dlxf68bvh5XH9vAN6ansM3V9ZcWwh7ozi8mu/PRZqACQayn3gr2TvBNya5PWobsjYErozTVW4O/3rdQ+HPfC4l2IenYFO1qB5RKi4RO7n2OMwAxjCpheScVVjVdDcnv+nwd2s+tCaRMUt/zqn6JU90bnnBMPyI/C1QVHGuz7gkianBq9JfWNMu/XVDLNglIKxnYzQj4fdh8CMkZ6KyWAjMToB94x5/OFJ+A3KVNh/314LC0kzhNo5mgMZK9nm7G/l7Y6sP8/uY6jwtMyjZN3ZI5bUx/LjrJl8SyY++AdVr9OiKhhudyh2AQFCm+E751FN8da4sB3+Ay+s+Xjp59AehyG73WrDl8ykGqsglLk/bzEN+js0oanRXURAQg8kIBM0eQTECiVvajUH8OUZW4l/PMIHh1ei9SylsI5tqGII2PmLeRjMytH2HMN17+23cu4ErmapxJ9BHGxvDqQ7oZTcaIDCTpjFpdVT7qO+zNbtQ/2Y0j1WlvN3cz4z+huT0P+A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc39b212-56de-47f7-0936-08dafd327b24
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 11:10:48.2185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 366rypIIwQ3APGwB+qMGwA7ICwudWTrhZEeqJv4A08SfJHJQYOG+oDffNrf+CsbyVaCxNTIJGJ5v+llQME/4nERPxEclsCBAnpH5pk9dWs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6790

T24gMjMvMDEvMjAyMyAxMTowMCBhbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIwLjAxLjIw
MjMgMTY6MzEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAyMC8wMS8yMDIzIDI6NTkgcG0s
IE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NpaSBLdXJv
Y2hrbyA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+DQo+PiBUaGVyZSdzIHNvbWUgc3R1ZmYg
aW4gaGVyZSB3aGljaCBpcyBub3QgUklTQ1Ytc3BlY2lmaWMuwqAgV2UgcmVhbGx5IHdhbnQNCj4+
IHRvIGRlZHVwIHdpdGggdGhlIG90aGVyIGFyY2hpdGVjdHVyZXMgYW5kIG1vdmUgaW50byBjb21t
b24uDQo+IEkgaGF2ZSB0byBhZG1pdCB0aGF0IEknbSBub3QgZnVsbHkgY29udmluY2VkIGluIHRo
aXMgY2FzZTogV2hhdCBhbiBhcmNoDQo+IG1heSBvciBtYXkgbm90IG5lZWQgaW4gc3VwcG9ydCBv
ZiBpdHMgYXNzZW1ibHkgY29kZSBtYXkgaGVhdmlseSB2YXJ5LiBJdA0KPiB3b3VsZCBuZWVkIHRv
IGJlIHZlcnkgZ2VuZXJpYyB0aGluZyB3aGljaCBjb3VsZCBiZSBtb3ZlZCBvdXQuIFRoZW4gYWdh
aW4NCj4geGVuL2FzbS5oIGZlZWxzIGxpa2Ugc2xpZ2h0bHkgb2RkIGEgbmFtZSB3aXRoLCBhcyBr
aW5kIG9mIGFscmVhZHkgaW1wbGllZA0KPiBhYm92ZSwgYXNzZW1ibHkgY29kZSBiZWluZyBhdCB0
aW1lcyB2ZXJ5IHNwZWNpZmljIHRvIGFuIGFyY2hpdGVjdHVyZQ0KPiAoaW5jbHVkaW5nIGUuZy4g
Zm9ybWF0dGluZyBjb25zdHJhaW50cyBvciB3aGV0aGVyIGxhYmVscyBhcmUgdG8gYmUNCj4gZm9s
bG93ZWQgYnkgY29sb25zKS4NCg0KSGFsZiBvZiB0aGlzIGhlYWRlciBmaWxlIGlzIHJlLWludmVu
dGluZyBnZW5lcmljIGNvbmNlcHRzIHRoYXQgd2UNCmFscmVhZHkgc3BlbGwgZGlmZmVyZW50bHkg
aW4gdGhlIFhlbiBjb2RlYmFzZS4NCg0KSXQgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBib2x0
aW5nIHNvbWV0aGluZyBvbiB0aGUgc2lkZSwgYW5kDQppbnRlZ3JhdGluZyB0aGUgY29kZSBwcm9w
ZXJseS4NCg0KfkFuZHJldw0K

