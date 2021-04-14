Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD51B35F43B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 14:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110581.211064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWexI-0006v2-OV; Wed, 14 Apr 2021 12:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110581.211064; Wed, 14 Apr 2021 12:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWexI-0006ud-Kp; Wed, 14 Apr 2021 12:49:16 +0000
Received: by outflank-mailman (input) for mailman id 110581;
 Wed, 14 Apr 2021 12:49:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoOq=JL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lWexG-0006uF-MN
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 12:49:14 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cad62ab-44b9-4d4a-a51f-d0e337609d4c;
 Wed, 14 Apr 2021 12:49:13 +0000 (UTC)
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
X-Inumbo-ID: 5cad62ab-44b9-4d4a-a51f-d0e337609d4c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618404553;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nD6m/a5puRLvonq8D8OwtcJStQyAjFf7jDmhlo6MCZc=;
  b=RaD/Fh/1UXmERIgeVFT5rr6ZsHjhQnK76y4+m4tnGGRs7tRKWaxCiqcV
   qncOOzuyhwit3p1W/+dOnsXqRBlP/uyD2IGSOOOZ5Gb4+ZCaQIuMEldHu
   85BM8Wf/KwvVB7lOKSZaqQdLiVjBicX6iPP0dLQemRRn2OCpiRt2WMDJ5
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gjYc6yjXK7NpMaaq61jU0/UcZ4nb+215+gM6WqeeJHL+JA+l4GTqAHspiBuOQzuae2RgYUBIsj
 wPkoMbc+wRjLubpIznMlbgeLMtzs3e6DYzRcdvp1vMEyeGnJhe2gUkslF7iWwJwhys4Wt2H1Dx
 tHZOuKxKBa6TE0HgjaLvauzVcf9R13HVwd4vEo2h0ugxk7wxQlJcM+Bj29bR7xAmD+0qKJ3AS7
 gnDxxCJNzKEiRIDLwsGYh5R1HP69I/NiIKSmQZLBaLKsKhLJ8tlrc3p6BIqgEtteTdiXOiMyVz
 7zc=
X-SBRS: 5.2
X-MesageID: 41952102
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:drXaqqEasEuJ7VLxpLqFvZXXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7MBbh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1Tbak/D38Zn/+
 Nbf6B6YeeAbmRSpczx7BCkV/Mpx9ea+K6l7N2uv0tFZysCUdAZ0y5SDAGHHkpqACxPApQkHJ
 SRj/A31AaIU3IRc8i9Gz05RODFvdLGj9bLZhQBCh4h5mC1/HGVwZT9FAWV2QpbbiNXzd4ZgC
 v4uiHw+6nLiYDG9jbyzGnWhq4m/ufJ6twGP8CUj9hQFzOEsHfYWK1AQLuEhTYvvaWUxW1Cqr
 LxijMBG+g21H/LZGGypnLWqkzd+RIj8WXrx1PdoVaLm72HeBsAB8BMhZ1Uf3LigiJM0L4Tsc
 I7uxP/i7NtARzNhyj77dTTPisa6Hacm2YokuIYkhVkIPAjQYJRtoAW8Qd0F5oNDUvBmf0aOd
 RuF83V6bJqd0qbZRnizxNS6eGrN05DZyuucwwjocqT6j5MgTRQ8CIjrvA3rzMlztYQWpNE7+
 PLPuBDj7dVVPIbaqp7GaMoXda3Inale2OJDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJjs3IocU6GM7zI4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDHcjjtWnuPdaJsHAQf
 68NNZ3DpbYXC3TMLcM+ze7d4hZKHEYXsFQkM08QUiyrsXCLZCvuffcdPrVObrxATcpUm7yGR
 I4LWDODfQFynrudm7zgRDXVX+oUFf454hMHK/T+PVWyIVlDPwWjiElzXCCou2bIzxLtaI7OG
 FkJqn8r6+9rW6quWLB72BjPAtBHl9YiY+QCU9ilEsvCQfZYLwDs9KQdSR5x32cPCJySMvQDU
 pYvFR4+aW+KpSK3iA8A9e7MmaX5kFj/U6iftM5oOmu9M3lcpQ3AtINQ6pqDzjGEBRzhEJ3sm
 tZcRQFQUXeDzvqjq2ggPUvdbziXug5pD3uDd9fqHrZu0nZmNomQWEDWSWyFeSNhxw1ejZSjl
 pt0qMWjbaagwyzIW8njOlQCiwRVE2nRJZ9SCWMfsF9h63icgAYdxb5uRWqzzUIPlfM22pXrG
 r7NiGQcezMGTNmywVl+5ev1kh1eGWbd193cVZgv+RGZDv7k35uzO6GYbey2WONal0EhvoQKi
 3BfCF6GHIb+/mnkBGSgzqMDnMg29EnOfHcFq0qd/XJ1mqqM5Dgr9BGI9ZEuJJkPsvpqOkFTK
 aWfBKUNirxD4oSqkOoj2dgPCl/s38/l/z0nBXj8WijxXY6Rf7fOk5vSb1eI9aS6QHfNri1+Y
 Q8idI+pu2rNGrtLtaA1KHMdjZGbgrJvnTedZBjlblE+aYp8LdjFZjSVjXFkHlBwRUlNc/x0E
 cTWr5y7rzNMpJmFvZiOx5x7x4sjpCCPUErugv5DqslcVYhg2TSMtmJ77DLwIBfTnGptU/1Ix
 2S4idd9/DKU2+fzrYcEbs3OnkTZ04m6nhuldnyPLH4GUGvbaVE81W7OHPmL+MYR6iBBLkKrh
 F1p9uPhPSaciLk2AbW+Tt3S5g+ulqPUIe3GkaLH+UN7tmxfVKLiaGu6NSojDj2RSCgAn5oyL
 FtZAgVdIBbljImjIcrySC8Raz8v1I9nzJlkEdav0+o3pLj/XzSEk5HOxDIm5laXTFcNX6TkM
 TOmNLonEjV8XxCwpnMFEBZY9FIFZwRV+HMXlBTFfQ=
X-IronPort-AV: E=Sophos;i="5.82,222,1613451600"; 
   d="scan'208";a="41952102"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZt6iwMGTfg5aMF3ZzTCMbsncj6e4uVJJ5q50Rxuyw4V5GdhN1dYQZ9zeABrmYSi/rzFb02QzwQKipOU5vRgoy4kRAivH6kF3NPNAGhaZu8XRCq5NDeKNajRwD0uXxmScrQFYgvjK0vpAHAEU1JoAWbD1h8nScODLhLGpo8aqUvdkjaINXElWsuA7QIxdPFKSLse121czEFCN24zQCmRwxWzxuRy9WeTyFpiEYx6D549WexFHmJCJu/FDJU9Ky82mechzHc7nhV5jnFctz+qNrqHXWgkvikSjOSTD1jlcNzfZ/nCQ6B0j/GrPXO1/qUe1rkyR12t9uzHGXzPCsxS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFe5AyKIYZ6R8ytjJFK0IlNDoqyNylHCztAikAkr3c8=;
 b=Hb1hCiHJOwQ8fe4MoqKdby/cBe1Q3fUKxZXpgqfLZfHCpb4fTD/tXBbuYIFEYPvU428LaOJTVNAEbouDt5wpFQuD+ziJwIM2CDMDwO+IQ95+BukBnyHROlK83KLGLWDBouXA27wAya0oB0Lj6T6p8a55jKfRW1WO5exBU2NQDSRqT3rf/tN3ICuFTqknAper+Yu4gdgMmcJh8kMx/wIh2shMNNJRNV5rZO3gUEgyGe7fIikN4cS1d3Kz5U7xBbSjr+4piK9TxogxVNMvu7cbs5/8E8KGkElMYgPTvnsNSyG3e3JEhUFdUuQm8eWxCZ1KdhnlHeDPqApKo2895y0Qyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFe5AyKIYZ6R8ytjJFK0IlNDoqyNylHCztAikAkr3c8=;
 b=xKgBomUYK6K+uXR1tCW/PGlEBYMAVuAIN9NLHXj2HCUnBZUBfb7GqouJ3wcyIjGtRPVVGb7yCA5H7HKrWFD60CiIKlfGSpZM1FdTuhVMA+Ssml9XBd1GVVT4mYY5FLGjojMOgTdq1W95xIFllHN4SwAIqxXH+ol1TA/JVt0mZOw=
Subject: Re: [PATCH 2/2] x86/cpuid: support LFENCE always serializing CPUID
 bit
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	<xen-devel@lists.xenproject.org>
References: <20210414110433.83084-1-roger.pau@citrix.com>
 <20210414110433.83084-3-roger.pau@citrix.com>
 <97d443b0-f5c2-0183-74c1-ab16d3cf1e7d@citrix.com>
 <63738788-c7ed-13f7-acaa-c1ad102442a3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <84012b3b-9ed6-7724-8738-986570be6a44@citrix.com>
Date: Wed, 14 Apr 2021 13:49:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <63738788-c7ed-13f7-acaa-c1ad102442a3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0369.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 935a22d5-2435-43c9-f7cc-08d8ff43b316
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5439E231851E56C3C0F4DEA1BA4E9@SJ0PR03MB5439.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bMyMuxn1pEALHwJVKRFrhK3v+5r9XTYENcu3QArw4fBMNjfck4Rw7Lt55SaI8fVFZeLWgFbeIaHvICtobxgGTttIs7giY6+FQ9dz/uVss4PeyJlw83f0kId4hOxYRd3sS2tnjfOtZ62iVGrpmr0XVx2Z29Vr1E8NAajIIsf3aRB9J6/eDzazabp5narQd2CMHZpEsRpl9y8JpJIDBu0omyAy+RU1wWdajiZllJtCLVLV+UcfHQO7ICy9xShpLmwKnvY+QbGRudAMiGDgbdkqTJ8wo39MysS2jcG+yK1lfwjopn8sxAUMZb69zOHPIK8TA5kk5ywDpMZUrKvsRtS4HYaqk+IFLdJCWbMVB658SGcr6Qzdc2ETwCTv/ZyM8InBL/t5AdQDnP3HsFo3vRbyTSbyCFZ8yj4GIAmGsYE0DQ2yfnsvOaH7w54fm57d0TO5DRmMVPAaFpJK6+EjqM3CofHxToBS0onSDsKRLDyJTC0Ew+W2iTy7gQtTVZy7kmrozOOjMsumJQdYFlaiJW3A4wZPif1YfiH/jQZmsbzfmMIcuU8VMfGD16PXCNiWXN8aa9ZFh9SQMViW66gSTGYyeIbVNxGdpRmLXxUp4dfCkQKd0SH/OHg0TJDWL3HseZrNaqLw/d9L16ZsiEBMgzhcds/jT1umXP2YPjr6CBnO6ZBmsUOhLjFzdZUcC8+8cpz2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(6486002)(2906002)(478600001)(66476007)(54906003)(110136005)(66556008)(86362001)(8936002)(31686004)(6636002)(5660300002)(36756003)(66946007)(186003)(16526019)(26005)(6666004)(2616005)(956004)(53546011)(16576012)(316002)(8676002)(38100700002)(31696002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2tTd1JaMGVMb3BPVUx0b3ZJampoMEhYekl5UXJEb1NOZ1FFWFVObkFrNm9G?=
 =?utf-8?B?U3pWQW16Q3hQTE9mamkwRHh2QWlzYjRSYmM5SC9jd3Q5eDI4N2dCRjNLa0xj?=
 =?utf-8?B?Y1JLcnpIMC9hd1hjcXphVTRvZkFSajRnNE9keGlVUXBZTUNrOWNHRWFPU3hT?=
 =?utf-8?B?LzA4SVZlTVV2WnRVRklCUlUzRFRjaGxvdHplbzkwR0dCMUg2eEpBci9TdjFq?=
 =?utf-8?B?cWoyWEZKYzkxbTEyOHp5Vm82bndVQnJMOG56dnNycFFFdmVJWitJREtIYkRz?=
 =?utf-8?B?WW0zd1d0RVl0MVR4ckhXbU5tUG0zRHgzTEJIckhibHJqQnNLWklXdytpdVBX?=
 =?utf-8?B?eVFWTXR2T2QvMEJxS1JZM0NSN0padFpRdXA4dGxVMHdwSkhOa0FDZ2FyelVt?=
 =?utf-8?B?S0lhdnlNT0lyQm4zekFWbWV5dWdzMlZSSmVySHVuTllyRnZrR29sQWxOM2tT?=
 =?utf-8?B?NVVCb1lmakl6Zk05ZEpBc2RwdXJUYTVIZ2hzM3dKaTFsTW01UE5HZ3ZZZVhi?=
 =?utf-8?B?RU1VQWY4WWx1QWovZXJlcCsxZVhGa0pEUi9lUzRIbXRPTU9sN0VWc0xtR01Y?=
 =?utf-8?B?eHNOd1hEelVNNVhXM3d2Mmx2ckxRc0Zhb1F1aFlvaUFjUllxSHA5UnBQK1lj?=
 =?utf-8?B?aGZQNGJjT29rRVluN290U1l3bVN1MGoyNmZ6bkVrVGZxRHpzVzZ2ZEZCRzVJ?=
 =?utf-8?B?dUdPejNIdFZnRDN5QnJxNElGYWhDZ1JvWGRVWkNyU0U5elN1MmZhU3FKM1hU?=
 =?utf-8?B?dnhuREpxWGlucWtJdlVDdHYwa05hQUZPMVBlbm45elF2M204bUViaWNWd1Ry?=
 =?utf-8?B?WVFjNHJvQ2lWR09PRzM0ZDlTemVkV29GaXFraFZTdmNMSERLTWo5UGJwcVNG?=
 =?utf-8?B?TDRzcnRXVWxZc2hyYTVJeXlYY2VSS2pXeGpwcHEwK3E1VGViM2pFVkdKb2Mx?=
 =?utf-8?B?OS9adVNEMndVQ3VwcW1uMy9QMGcvbFVVNkZFRktMMDRIOXlyMG8yWjRJQThq?=
 =?utf-8?B?QU1qTzVOT2dHemtrK0NOb1RxNm1lekZ6S0RKVmJRZURqNmlOd0VoMHZUUExi?=
 =?utf-8?B?SW54cWhFZlBzRm1wTzI5L0pxSkNWaHFubmhjR3NhMXpqQmxqQ3NMUms3TW14?=
 =?utf-8?B?VE5OcndENnVrQlNsM3lUc2tVODJxTTlXSC8vK2lMaGwvRUx5VzNiZWoxNVRw?=
 =?utf-8?B?NzEwV1RNQ0hHWDJMeGFIQUdIa3VZbE1tMG96WmdtVHpEcVpvbVJreE9EZjN6?=
 =?utf-8?B?V2hmZEhpSTdJTFJqRStteFVMcHRSbCtzckpwTUxjdWNSYUVRWjBNMFhyWHJq?=
 =?utf-8?B?dERLWmFCM3JMaEhqUGkzLzMvSzIxN1EreUZBQ1VDSUw4ems3M05xT2YzZWJL?=
 =?utf-8?B?UTg1aHFsTDhkMnpEQWxpQWlKQUQ3YXlaSG04VHRtZTRpd1VXdXYxRkY3ZCtW?=
 =?utf-8?B?aDVnVFRXdTRIdlo2alU5SWxxeUlPYlJjNTBzNnlSRGxBZkhLQWhrOThQOE5n?=
 =?utf-8?B?cnYza1RreldhT3NBWDgwNVhqb2tMZldORm9YMzdqS1ltZmU1Z0FSZGpCN1Fu?=
 =?utf-8?B?SFFmUnpkRkJ1M0lvanJkclFEUk1xWVpRcktrSWtmOVpVV3hWbnJzY0E4ejV5?=
 =?utf-8?B?YzN3VkhhcGV3TUxUQTRlTmt3cjV4SWlEdDViajVEeG9KS09GOGY2dVVvVEVJ?=
 =?utf-8?B?OFhuRXZTaExKaXVja3FSbmMrWEg5bm1ocXZUais2TDI2dFJMRGJUY094dTY2?=
 =?utf-8?Q?aRFZvM6naNv5vrSi5+y8at7MES4REVhW9vkUdvx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 935a22d5-2435-43c9-f7cc-08d8ff43b316
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 12:49:10.6793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qixzGALB+dgCI3uVDke+tmF0vtoHAgWA+LRVUysW7yYy3BQ2BDcGNgPJh7k9jZcp01166D6i/RbZMh4a0nCkI52al/eMw7mwz8wX0qYzoe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5439
X-OriginatorOrg: citrix.com

On 14/04/2021 13:45, Jan Beulich wrote:
> On 14.04.2021 14:33, Andrew Cooper wrote:
>> On 14/04/2021 12:04, Roger Pau Monne wrote:
>>> --- a/tools/misc/xen-cpuid.c
>>> +++ b/tools/misc/xen-cpuid.c
>>> @@ -178,6 +178,11 @@ static const char *const str_7a1[32] =
>>>      [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
>>>  };
>>>  
>>> +static const char *const str_e21a[32] =
>>> +{
>>> +    [ 2] = "lfence-always-serializing",
>> This is a bit of a mouthful.  One problem is the fact that "serialising"
>> is an ambiguous term, because neither Intel nor AMD formally specify
>> what it means in the architecture.
>>
>> There is a description of what "architecturally serialising" does, which
>> does occasionally move over time, and the name of this CPUID bit in the
>> PPR confusing at best, because it very much isn't "architecturally
>> serialising", and the term "dispatch serialising" isn't actually defined
>> anywhere.
>>
>> Intel have now started referring to LFENCE as a "speculative execution
>> barrier", but this still doesn't have a precise definition.
>>
>> I'm afraid I don't have a useful suggestion for something short and
>> concise, which also conveys the precise meaning.
> How about "lfence+" or some such?

Hmm yes - for xen-cpuid, that's probably fine, and for churn reasons, we
can keep X86_FEATURE_LFENCE_DISPATCH which was the best name I could
come up with at the time.

~Andrew

