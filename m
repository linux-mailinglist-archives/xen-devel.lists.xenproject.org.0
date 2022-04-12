Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262614FE13F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 14:55:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303653.518067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neG2e-0006mW-OZ; Tue, 12 Apr 2022 12:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303653.518067; Tue, 12 Apr 2022 12:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neG2e-0006jH-KW; Tue, 12 Apr 2022 12:54:44 +0000
Received: by outflank-mailman (input) for mailman id 303653;
 Tue, 12 Apr 2022 12:54:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=to5A=UW=citrix.com=prvs=094341a74=roger.pau@srs-se1.protection.inumbo.net>)
 id 1neG2c-0006j5-Kt
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 12:54:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b69fee4b-ba5f-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 14:54:40 +0200 (CEST)
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
X-Inumbo-ID: b69fee4b-ba5f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649768080;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tNxdZv/RzBK/Jxwr5m15VHsp0Bxq8FqxjkZQi4iKLi8=;
  b=aojLXRIbkcaW+NcnfzqV8f1JdlnUFLUFGxdWj18ytQ5QY/t+mp95lt9o
   GqO6sbz/RuDx7vTDXqP9Y3fkCJ23agyb92lAYoWIwYgFP4QrlOXrUwmFo
   JeH/XWl/Be7JjeBavsx9ukB+sEvhutgnnWEdHX+diH5fuVNGbh0Sea4eO
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68079374
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:V5H0nq+IJRW0Cq+RalWXDrUDrH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WQYDTyBP/rcMWr0KIp0YY7j9UhSvpSDnd8wQFBuq3o8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YHjW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZibE0AoEobUodZeEBBWDjhHMKwdopaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4eRamPP
 JVFAdZpRE7dbhlPKGcSM50nocDwuHffWWIHpHvA8MLb5ECMlVcsgdABKuH9edGURMMTgkeRo
 ErH+Xj0BlcRM9n34SKM73aEluLJ2yThV+o6Fre16/pri1273XEIBVsdUl7Tiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXYht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIOsORsAj0G/
 UewrZCqDDJyqYSYSCnH3+LBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Qqf6w9AsKQlWeLcCu//emu+pj10a4e+D2BDwQiKtK0QRGp1o7Tog
 ZTlpyR8xL1WZX1uvHbUKAnoIF1Pz6zbWNE7qQQyd6TNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0Mf4oO9PhW513l/WI+THZuhb8NIUmjn9ZLlHvwc2TTRTIgzCFfLYEzMnTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+8zN7Ti7eHwP9Dz+ieD2TCfMEd8taQLSBshkvPLsiFiEq
 L53aprVoyizpcWjO0E7B6ZIdgtURZX6bLirw/FqmhmrflI9SD58UaeIqV7jEqQ895loei7z1
 ijVcmdTyUblhG2BLgOPa3t5b6joU4o5pnU+VRHA937zs5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:x6R/Lqt5UlF8hBadjyMfqqI47skC7YMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1FdQq4Lbw5ebbSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu1Ph/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1Imj7sV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8fz4+A9opv/MRTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uduxMZ4K8upk0adbFbRK5arIQZ8k8QOowHBjjG5IcuF/
 QrJN3A5cxRbUiRYxnizydSKeSXLzcO9yq9Mwo/UpT/6UkSoJk59TpW+CUnpAZByHpnIKM0o9
 gtMcxT5cdzp4EtHOVA7dw6MLmK41z2MGHx2V2pUCHa/YE8SjrwQs3Mkf4IDN/DQu1+8HJ1ou
 WGbG9l
X-IronPort-AV: E=Sophos;i="5.90,253,1643691600"; 
   d="scan'208";a="68079374"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZVezfxhlRRiVo8t4cIP9uYMmFpaaMZ7VvxRQQVqstZHodNjmJcxc70axbDVfpb7UX3m9hW3tdRRNT++jpCE5r7BAwZzu6erDxH2NoN3u1M9PmHSHTIrGNXc5d2aoC3xYYKavbU/8bDFWYHHPWbA3wqn6384zIs3HuxghFP4BPsp1pV+ig1zM1xLvtYw7GEWqagmAv1dTj0z4yDpiJ3XGi6cD5wiutlnkWm2KORaFOEMZDvcR+KNm6mCIDvPk+iG6VkPBvOUL3JHcBfc1F4OQ/cC7Mmg34Kc/gKhPLvW2alwyTs6sEW6xR4fXF6tJzm6b4SKTv1CA9pUnEgxoY6lhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaQhTp+sXFwpQEa/WVO2RYvzfHchL021zmBFtm3MSAU=;
 b=drJ8JB2O+z+xj5Usv6x9RRjn83uFlUF2i/g0U04ObmZ3ecuRWEfPqP21lSd5pnwoIYQ/YhLTDCUPuLNqKmriShEKO5uSnKAjhsbhXC53mjZ6wX9/4TQ3zziCcU1buJjYtsMkYv5/a/ZnJ49GLzZJM6O1+lqusGhji8sliijtfkJB3NX6FCCM1F33jVvepsOZJ3q8vjLzqlMXA1do14mcGHkQ7NOwtxzjqKKwaqJhzUV70BE2aphAelTjl/V8+Sar01x9dnekdgYZOr9jgYL/2vwWqdetG1CiFz6PAeGTq17JQF3zfZW0yUKMTqK34+TfACV2YcdVYOmw03y7C9V2/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaQhTp+sXFwpQEa/WVO2RYvzfHchL021zmBFtm3MSAU=;
 b=lLp+AykT0ikwWEOsUOB5oK6ajV8DMloZteXvliwFnQ7aFC3sNBWka+c91D10JeVjcr4+yJEezq6Vh4KHFAP4LoL5je6ZfKoVi5nBctC8Q9x7ZtJqN6zDOJeu3zoO6pggokDQ4/njJ1b3vc62sXXIo7dDWbm2bXUgA8o/ImN5LAs=
Date: Tue, 12 Apr 2022 14:54:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Kevin
 Tian" <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/8] IOMMU/x86: drop locking from quarantine_init() hooks
Message-ID: <YlV2fseUZ6ss6bcS@Air-de-Roger>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <3430b8fa-6700-b5ec-a160-2e7609dd38a3@suse.com>
 <YlVc9shnBYKShLiP@Air-de-Roger>
 <5c09c09c-01b5-c020-5a8e-c0453e3b8fbe@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c09c09c-01b5-c020-5a8e-c0453e3b8fbe@suse.com>
X-ClientProxiedBy: LO2P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 358bffa8-e93b-418a-d92d-08da1c83940f
X-MS-TrafficTypeDiagnostic: SA1PR03MB6625:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <SA1PR03MB6625C1A043043D8A889F02458FED9@SA1PR03MB6625.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ntiVdJ7JhkDTWyY2kljjgi4MhisQhfWwayc0ubFiKb1l4QL+0Yxp87vSUX0MQ/V1VfnxaAstCOYTCGT0P5Qvpc5U2My9kStFGF2RmO+69e66Zsl7jhOcacee0k7CHqKBhDtrg+COmq0NhqWLCKY1hN+jq+r6wyeKA8EPx7P0cHnDv2SKZefBvSX5YHyiGSWajuxvepuZjthKbtywcHqB+4/olXM7KFSpZss2Sgni8NqGH9xtZuhxJNcx4bbWzerLJkqWlzJzStJ03YNqUM13fFqcUCZzOCnjqBZDlybw5/Z9ETRVvmvfXX+Aymad9NUgOUVQB6gdaq5W/Su5U3Rr8rbe9ejFtGOCjt9rZcxcnM0WQiQ/D9MsaEhM2f2+tTsG7YhrwMd1oqD39P/sZATz7qbSM7FjUTthKo33Seq6YJhbkefCiFEm+UHK+rybL63L0LqKRdo7UlHiRxsZZiQtNdFNMTXiQgXTfQQ0XK8JKgAwWaREC6KKq9L+63gj19tUfPYgMkwVZ9s3+TTzx2S6/wKupTUnMJV0wejBYqIA4q4FEtt7uUlPGVmrRY6WxzakUTP1zYqecZ/SC9IWLg8IG8SB3HvC6qhGf9LvMgPLs+9az/eEEdtTsTa263ZDDTRzAtkfpJqL6ok0Glhu/HXb/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(86362001)(316002)(53546011)(9686003)(66946007)(6512007)(8676002)(4326008)(26005)(186003)(66476007)(66556008)(107886003)(508600001)(6486002)(33716001)(6666004)(54906003)(6916009)(83380400001)(6506007)(38100700002)(8936002)(5660300002)(82960400001)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amRnbWJQUW9yNGJiWFN3c2twcHhkYVB2YjJWTnVHOEVjUzI4R2xHN0xJcnpx?=
 =?utf-8?B?SDJIK3phYjdLcWp6L2N3bkxaWS9RYUhqQW96Um4xdDdrZDVGUVNCUDBnMWcr?=
 =?utf-8?B?SjRZeU9NdWNwaHN1c010MnNqaUVxSEZUSDNFaHF2bUt6czhMcGR5RU1qLzZP?=
 =?utf-8?B?RmNqc0Zjc3JjcHdlU2kwd2hJTE5VdXFqb2hJeklnNHp6ZHl1SFYwTlhZSFBv?=
 =?utf-8?B?NUdGREVKK0VBaXJvZklxR2Q5K0lybEpOUXQ0OXhaMzRpZGJtaWU4Tk8zejFa?=
 =?utf-8?B?ODkzYXlpRjEzOFVHTTkrOUdzSW9lcGJqNzZ0MnRVM1VkNUdDREdIR0NDa2NG?=
 =?utf-8?B?SkZ3QU91MW1OVkgzaHhGclBYVGxJZUZPWjdRaEprekQ5VUU2S1E5aGdDUzZU?=
 =?utf-8?B?cVRwWTluYVZtcC85T0RYNSt5STNQZUpGWjVQMThlb29IVVF0N3IzRWNjZmVw?=
 =?utf-8?B?NUp0Qk94UEF6SXJXb2swYVNPQ3JxcTAxSCtRYTZQbUZTQXE1TDVFYWQrbmZR?=
 =?utf-8?B?T09mOExkWFM1emttSlpEMkhRREppODFWMFVVbTFYVXRyK08wUFVUL1BKUWNW?=
 =?utf-8?B?NVMxaUhDTjFIaEdvNE5TdTY0dHNlOFphQU1GNnJzVkFYSjVKTE1KS2s0OHJL?=
 =?utf-8?B?WFhkM0NkTGRVQ3ZCSXA1Qk1pbFZHOWZRYlZKKzVOVTJweVdnWG55UkRvaEpy?=
 =?utf-8?B?ZmM1LzRCOERPVUowbGhxSnRjYWxaT05nLzVlb2dDUllISGhXVXJjb2FQd0dP?=
 =?utf-8?B?T0VLT1ZBM1p4d1JCbTdpWDk0VTladS9vSStRVFk0UmhPZWFvWWVXRE9kVVVn?=
 =?utf-8?B?RktMSFJPWHBvYWZPRkRFb1d1WWhjVGZ3bTI1UUxWbk9hb3paTzgxWVlaSHVt?=
 =?utf-8?B?OXpOb3c5QWRWckxpaU5mKzFiT3lRZUVHV3VGRXc4M0U0MVRTTXA0a1VoUGlE?=
 =?utf-8?B?bUIxSGVYRkZuSk4zMmk2VVNxUlUzRzJhNzV2RU1CVW1pc21QRzE3NjFnTUNo?=
 =?utf-8?B?SGRaaGUwVmw4WWhtWEM2cDdrQmhYeEVYWUxhdmd3MmNNUHlPc1Q3b1A4SERo?=
 =?utf-8?B?ZTgvbkpSZEVWM2JKazA2bnBDYVZpS0dkTnVTYmtnS1ZnUGx6K0o3SGxDaDlw?=
 =?utf-8?B?YVRVZzdJMWFWVEU3MVNvUXhiY2RJNFR1bzFHU1FkMDZYRE5TendiQnQxaTJm?=
 =?utf-8?B?Ui9QYVRqT2MzdWp5WHh3L2NxWVNqenBZaDhGWVUzUkZEWTVPVFIrRjZvb1R6?=
 =?utf-8?B?clpqcHQ4ZVJrT1NMaU43QkxhQnhaNVowM1dzR1VJeDhCdk4zblpYRG9iTE5T?=
 =?utf-8?B?ZXVaQVNOTHRzQzFRb3hzckpTV2wxdG0rNmV2aGdXUkNTU2NzZVF6VmtzL2hm?=
 =?utf-8?B?MUpHeWFiODNKMnJsREs3Q1N4OElyTUdzUjg5UHNmV1RtbFpOeXppcjhSVFRv?=
 =?utf-8?B?Q1NFeFRRVEZBdC9vUmNpVWk3cUljVjdXQ25nbEMxb2xLT2g4VU5VaHpsWVRV?=
 =?utf-8?B?WU11WTN3MXpIM0E0RGtjNy9BdmZpYXNtcXQzN1daUUkvWm94d3NUVnJ2UjIr?=
 =?utf-8?B?UTg4QTd3eVA5K21MeEZnUWxJYWJxYTZ6Y0U3VmxiM1ZhQWNkWVYrVW0wV2hY?=
 =?utf-8?B?Z2prdTd0dmNSMHdLTHNxdElwaGxNVk5qM1hlRG9QVS9QcTh1T1N1SkZlWHdj?=
 =?utf-8?B?OCtSSUU2Q1k0bU5TdjFkWXdpaGRlRXBDb3JhT1poZVRRR1ZzRGlBcnhMWmph?=
 =?utf-8?B?OXNzcUMxZ3BpQURpOStWQXJBYk9kb3ZsZ0lFUlBzZVdDSmVDWkcwNlZlRVRC?=
 =?utf-8?B?Mms0Y1JCK2g3dXdaVHlFcXhwSzFERVkzZXlmaXZ2bGZVNjcwMCtCSXpwdEVU?=
 =?utf-8?B?OUFRNlBScXNCaUQxKzlOT25hZjl5bFFBUDRkd0xhREhRV3FGUnVYZGdTekhN?=
 =?utf-8?B?c3dHQ1pmZEQwZlFlZUZxTGk3YVFLUkNZekRPdVRKcWlXMGhsaGdBY3VLUm1U?=
 =?utf-8?B?WndSNlRGN2d2eVhPK1FHcW9HYjFqc2R3cXRyV01vbytveHhUQ0JTbm1oSkRQ?=
 =?utf-8?B?WEEzcU9EY0tIN3h3OEczVjJKTDV2VW9nNzVxZGVuNUVDVWY3TndsL3N0YmtB?=
 =?utf-8?B?aFZUTGxXQ1IreUxOVVduTnUrQm9xSjUyUDNZZjBnNVdYRFVyYXROQ3NUcTRv?=
 =?utf-8?B?VVNhTXZobHNlT091UmRydnVkSjdoYlZTdUJhTW1XTGdqRkVIaHdIaWZDOWZT?=
 =?utf-8?B?RFV2RTI2WWFLandmL25aNDRRdm8wOC84a2hIdzU2TXhNbVI5N3pKQ0Q2bVE3?=
 =?utf-8?B?QWdITGIzbmdrVWREa3BkR01obFZlYk9Rdk5CWmdsM3B6V2FaZ0dicEtxS2tw?=
 =?utf-8?Q?n9qw5TD7lcQMOhwY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 358bffa8-e93b-418a-d92d-08da1c83940f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 12:54:27.8112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHDEj3lc8eRr2/uBA9YbVq9zBI0exB4MyNqPlq15z6gmZeiZrc4nUBrRinpsACtJ6bwRW/EZUoh/JCtYugkgsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6625
X-OriginatorOrg: citrix.com

On Tue, Apr 12, 2022 at 02:17:16PM +0200, Jan Beulich wrote:
> On 12.04.2022 13:05, Roger Pau Monné wrote:
> > On Mon, Apr 11, 2022 at 11:35:54AM +0200, Jan Beulich wrote:
> >> Prior extension of these functions to enable per-device quarantine page
> >> tables already didn't add more locking there, but merely left in place
> >> what had been there before. But really locking is unnecessary here:
> >> We're running with pcidevs_lock held (i.e. multiple invocations of the
> >> same function [or their teardown equivalents] are impossible, and hence
> >> there are no "local" races), while all consuming of the data being
> >> populated here can't race anyway due to happening sequentially
> >> afterwards. See also the comment in struct arch_pci_dev.
> > 
> > I would explicitly say that none of the code in the locked region
> > touches any data in the domain_iommu struct, so taking the
> > mapping_lock is unneeded.
> 
> But that would limit what the mapping_lock protects more than it actually
> does: The entire page tables hanging off of the root table are also
> protected by that lock.

Right, but at the point where fill_qpt() gets called
hd->arch.amd.root_table == NULL, and hence it seems completely
pointless to wrap this in a mapping_lock locked region.

> It's just that for a pdev, after having
> installed identity mappings, the root doesn't hang off of hd. But in
> principle - i.e. if the per-device mappings weren't static once created -
> the lock would be the one to hold whenever any of these page tables was
> modified.

The lock would need to be held if pages tables are modified while
being set in hd->arch.amd.root_table, or at least that's my
understanding.

This is a special case anyway, as the page tables are not per-domain
but per-device, but it seems clear to me that if the page tables are
not set in hd->arch.amd.root_table the lock in hd->arch.mapping_lock
is not supposed to be protecting them.

> > Long term we might wish to implemented a per-device lock that could be
> > used here, instead of relying on the pcidevs lock.
> 
> Well, I would want to avoid this unless a need arises to not hold the
> pcidevs lock here. Or, of course, if a need arose to dynamically alter
> these page tables.

I think it's likely we will need such lock for other purposes if we
ever manage to convert the pcidevs lock into a rwlock, so my comment
was not so much as it's required for the use case here, but a side
effect if we ever manage to change pcidevs lock.

Thanks, Roger.

