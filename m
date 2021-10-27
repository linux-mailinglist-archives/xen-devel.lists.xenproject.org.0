Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A74A43BF33
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 03:47:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216640.376313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfWV5-00027z-P4; Wed, 27 Oct 2021 00:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216640.376313; Wed, 27 Oct 2021 00:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfWV5-000254-L7; Wed, 27 Oct 2021 00:09:03 +0000
Received: by outflank-mailman (input) for mailman id 216640;
 Wed, 27 Oct 2021 00:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMsA=PP=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mfWV3-00024y-KA
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 00:09:01 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 879efac2-55ba-4406-839f-9e978ba5a569;
 Wed, 27 Oct 2021 00:09:00 +0000 (UTC)
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
X-Inumbo-ID: 879efac2-55ba-4406-839f-9e978ba5a569
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635293340;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dY7p4zfKEf51a7lsmM858uXPFZIZDnvj98syNj/Jcnc=;
  b=JqyhylsYduxf7ADIIuytypooh1LsL4eqmnfB5Os6NCYt5YcH9hYNhCxu
   Srl1uN6Zeh/jI/rMgE3PQW3IMiwrfb6gbGDqr0ei0pTYjMy+coq4vNL/5
   FoihgvQ5vnOmGQkiM1wKeA2Cb8/0DRMB3wSrmk2pRC03uch2okjfYMGRA
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SnVNSyueiUM7aVnfwZZMAFK8QXnodC/JiJHX9xq8f75iUHcHXEmcrH7EfknvVrG1RKGTynBTdq
 laTdC42MzWW85G65tdrqMlr0n+mQ999GwikkyinvLk3TXtBL1lTI0J+gsQdenGpWNaqr6cJHnU
 ZwNwn9GhpKmOrlHpv4iJKK7B2kPCBDvoFrmHfRs01RNF2C9KPYT+MsM0QQtosLa9uxjdLYNQVZ
 E8gpLwoKwzmp6f0caojG/7f0+4vQZxVYpahfroB0TakIrWSTRJ5BMMr0tZVmlSRa8O6SyPI8Oh
 IwV62RST8d9LOFXo/L7im+uF
X-SBRS: 5.1
X-MesageID: 56158697
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZMs88aj2xw7sgdv/9VRUtmRVX161gRcKZh0ujC45NGQN5FlHY01je
 htvWjiOOveMYGenL4hxYIyy/U0OvJaByNFqHgs++yk3Eysb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Yy34Dla++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Wib6OS0AsJJTnxvYFXAYHCxthL4NvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauAP
 pdJN2swBPjGSxweEAsnA4wGoMmTlEHuTGxysX62opNitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOTvv2RmkO4HdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4CNEY1gPKz7DtyFiLHmcbESZ7d84InZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnBcE1NUizX3iMRq1EiXF4c8eEKgpoStQWmY/
 tyckMQpa1z/Z+Yw3KKn4UuPvTuoopXYJuLezlSKBjz7hu+ViYjMWmBJ1bQ5xaofRGp6ZgPY1
 JThpyR4xLpWZX1qvHfUKNjh5Jnzu5643MT02DaD5aUJ+TW34GKEdotN+jx4L0oBGp9aImKzP
 xSD41sIvMI70J6WgUlfOdrZ5yMClvGIKDgYfqqMMoomjmZZLVfvEN5Sib64gDm2zRlEfVAXM
 paHa8e8ZUv2+ow8pAdas9w1iOdxrghnnDu7bcmik3yPjOrPDFbIGOxtGAbfMYgEAFas/Vy9H
 yB3bJDRlX2ykYTWP0HqzGLkBQpVciFrVMqv8p0/myzqClMOJVzNwsT5mNsJU4dkg75UhqHP+
 HS8UVVf013xmTvMLgDiV5ypQO+HsU9XoS1pMCoyE0yv3nR/M4+j4L1GL8k8fKU99fwlxvlxF
 qFXd8KFC/VJazLG5zVCMsWt8N08LEym1VCUIi6oQDkjZJo8FQbHzcDpI1n0/y4UAyvp6cZn+
 ++81hnWSIYoThh5CJqEc+qmyl685CBPmO97U0bSDMNUfUHgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExMDTWfB7LuwOS3LxUaZwNdNALSSYDTQdGLo46H+N
 +9b+O7xba8cl1FQvosiT7sylfAi58HirqNxxxh/GCmZdEyiD75tLyXU3cRLsaERlLZVtRHvB
 xCK89hef76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgCbQORjCF9LaduNNJ3y
 Ogsj8ca9gijh0d4Kd2BlC1VqzyBI3Fov3/LbX3G7FsHUjYW92w=
IronPort-HdrOrdr: A9a23:NZ/Ze629ZZgMbN+vmSSCbAqjBSByeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJk80hqQFn7X5Wo3SIzUO2VHYUL2KiLGC/9SOIVyEygcw79
 YYT0E6MqyMMbEYt7eI3ODbKadZ/DDvysnB7o2yvhQdL3AZV0gj1XYeNu/yKDwHeOAsP+tdKH
 Pz3Lsim9PtQwVsUiztbUN1LtQr6ue72K7OUFojPVoK+QOOhTSn5PrTFAWZ5A4XV3dqza05+W
 bIvgTl7uH72svLhCP05iv21dB7idHhwtxMCIiljdUUECzljkKNaJ56U7OPkTgpqKWE6Uoskv
 PLvxA8Vv4DpE/5TyWQm1/AygPg2DEh5zvLzkKZu2LqpYjDSDczG6N69MlkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l2KvyEBS0tI7vjh6a88zebVRpYsQ8Ad+C5EbBh/374ghDa
 1HENzc3vBLalmXBkqp/lWH+ObcG0jbIy32BnTr4qeuon9rdTFCvgolLfUk7zU9HMlXcegD2w
 zGWp4Y3I2mAPVmNJ6VP91xNfdfPFa9CC4kAFjiVGgPK5t3TE4li6SHqondt9vaNaDh8vMJ6e
 L8uRVjxDYPR34=
X-IronPort-AV: E=Sophos;i="5.87,184,1631592000"; 
   d="scan'208";a="56158697"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwPrpBMdaAbQHo787oICEd3Vt5bcr5lg+zySf675MzSfpmAgZOj7O+vXlHbsW+7AGu9wL3ikslXsPBkVQaLacWjvcVNzG5jNs27G7GzutvRS8Y4EY9sZwthdKgC77WjHRLt0Jlwz0hvn+Bjzuc9bP4i2/mXPgV+sWePCFn8iEnHvLnR2A/9wUZmFDx7cS+c+A1cE68st4f2Qu8SQbGq3N+UNd9mvt5t5NmAnXF16wclI7LzZKcE9Q9Px26L9zoXB9MmVlh+ICaLauRsQq0mxqDCWB+E6E3yLERlfaBma+KHUYeQKV7ANiHJb60VrjMyjNUCJSQROgThzOjS/1YRcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY7p4zfKEf51a7lsmM858uXPFZIZDnvj98syNj/Jcnc=;
 b=K8lIIXNyUD3W/QxkEItOA9Zu90vRJGaBnqPkGOySmiDCRBKCNnZ2MTM5zmfiMqCkhm2lzCoaoE9QZC6ZlJzdXyfGuLcGsSSgqIpeOkPo9W71pX//Fd/ImePHtXRuQMocticuuea7QIcRtru6ZBZsbyMW+SBdNCzyho30MMHlA6jAgppjD6ikt333p57Tzjl/7bvk1yV1E02ItCahBW0iDkjIGTFDbLKCYlUAaPmX7jwF3C0i1bZNP1Oq3pFbUeFLDrednSDx6nADnkzZ3yEDHvfn7rxE/XNZQULcvtzwNYzfivGvx9mkSbJzeJXK6g6w+jbpFLjjIIO/SjJQfa1j3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY7p4zfKEf51a7lsmM858uXPFZIZDnvj98syNj/Jcnc=;
 b=uBDdldmb78bWJZmayFI75q967LHJrHxAWBzruyHNmSiwRAlqPbedYpbknm7FhbfDovXZ/XdVijLRUyLgAHl4jRkab8eeKyOGcY2Dew/9BuqhbPQNo98hB6Q1nY1gTYpKmxLCMjwdShSqPT+9lgdOHkwZNw38Zw7BIktiwuOBj/c=
Subject: Re: [PATCH] x86/hpet: setup HPET even when disabled due to stopping
 in deep C states
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <68352fc1-9ba0-1081-be50-065b212f96a3@citrix.com>
 <20211026151233.57246-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <67ed6c84-2046-0cd6-1e68-e462ffb11592@citrix.com>
Date: Wed, 27 Oct 2021 01:08:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211026151233.57246-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9a92922-0546-468d-c8d3-08d998ddf36a
X-MS-TrafficTypeDiagnostic: BYAPR03MB4677:
X-Microsoft-Antispam-PRVS: <BYAPR03MB46777331E00D8FCD352E76C6BA859@BYAPR03MB4677.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUPjBUnY4MHOUJZqNFMp/tUawv4wC2NkvL2ndz86BZfDfwf9F9MuXi11Qwt5TR9XeTRYc6yyzoPX2WzGkskTzldpqhJsmP18oNcGHlm6IFpGPpS1UV+3jpvRPy8ftjom7lL+HIi+Sgxz+00FaVLMbWBosjlfyNVYHEXRah0pacTMwCgofL0H+5nVV5PoHjmVfUctAVL5p+/JtGrRUxb351aPeyrYes4ThC3KyUvj3IHaC80woI8ykG5uHA9ceilQc4+eK1Nowi4VP8G0DcMuGZNQmZyIegqSAEQW4KIgTuUCoGK+JqO98rE0NVF4UeLreF0C2bQ+QZ5ChFxbsRm0Vk8NdQnByFMJtmNmR+M/NsdpQdr2rxqV2vZzO6w8kxXElRxmDQ9tUmY5MbQMicb0bXAXUeSi9sl0g26KsDSETUxSvZ61hTrfjMZU9VpQT5sqixPwf+hzON444wDaTaqCR9SOon+HIB1dimPjRrM7OleGr5IUZsUigTkFpWOIDoH+t4esB8021H5hc5n9xOLQoyqV1cxAYwMFY7On1na9TvAYyneL16igs7zZRUoRYtbPBpuDlk17/6rPUIkNOZ+vlMkn19etfTIci9es+uS4OA2fBDJg8aRRgbCG9xYDRX/FakOndFKEQlnZnwr1AZHqiEqVGh/FwNbeZ5stNVRjAFO3SeWrxdQvkztZkQ2RbS2fFd8iLS8O5XGHXRinJRtn3ka1sEBGPYAGha/3h/r45h8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(36756003)(53546011)(2616005)(31686004)(186003)(54906003)(86362001)(16576012)(508600001)(8936002)(956004)(2906002)(4326008)(316002)(82960400001)(5660300002)(8676002)(26005)(4744005)(83380400001)(6666004)(6486002)(66946007)(38100700002)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rnk0VC9KOE1Uc29pS09sWFZad2tFTGpmZ0pzVmNkL3RYVEVpb1J3UTYwaDBI?=
 =?utf-8?B?MjBNWFllY0pFQk5mam95NSt2aG1qcEhQd2tZR2ZJYTg2SEV5ZFozNmNMQzRL?=
 =?utf-8?B?c0p1WWRNSjZSaHdObHk2U0hKUVQ5QTY3NnZoVFhIQS9jdVZRSGFMQ2RwNDF0?=
 =?utf-8?B?OFQzQ0tFNytmL3NnU3JDcjZSVXdvUkZ4N0tKN3puVFVHMzJSR0V2NE5oNUlZ?=
 =?utf-8?B?SkFyS1M0OTFQL0NSSGhtRGwwdjNFMU13SXIycnBaU2RMZGxjVWNuYlpFNHEw?=
 =?utf-8?B?R2dEdnpvU1hUc054ZkZQZm9MakZmNjMxeWdTekEvQVRlbWxzSjJGeEtOWkdi?=
 =?utf-8?B?SXhGMjdaR09sRXFvTzg5VlR1R0pUb0tEd2FGMHVDSEwwUFJ5UE5QMnV1ajV5?=
 =?utf-8?B?Rm8xNm43SXZSMWxmMEdkYjNoZ0dlNi9hZS9LTlJuYmlra1Fmakp2Tzd3Ny9Z?=
 =?utf-8?B?RGo4ZzFMMWQva3RCZWc3L0xUdHpCQ3JyM2U1VCt1TUJNL0NQYVc1SVNQU01I?=
 =?utf-8?B?aVIyY1l2TnhlZ2w3Q3pnejU1TTVxc3dJNjlqa29LMXVYZFhTcnlEK2NhZWVY?=
 =?utf-8?B?THBwOC9tT0Q1dnZCRExKWU5OYklWZmMrczYvRnVMeXhNYmVQMW94dDJZUmYv?=
 =?utf-8?B?QTNKOVhEY1JCQm5PR1hvYTd2Z3hVbGZnUlU0TW9nQm1qaGFDOTIxcm1qQVBu?=
 =?utf-8?B?VzU2WlNkR29FRjBqMitKTEgzOFRZV0VsWjVpdVdmLzlHNW1iamdTZlNRcWF6?=
 =?utf-8?B?LzFodFoxVHMrNVhPa3BhVU9lZnhsODJqRDllem5aRVl5SDAvb2FydC9VaVVM?=
 =?utf-8?B?cUx6ZzFLT3VWLzRVa2JCYVg4d0JHYXlpZGp4VTk0dlVCWk9mdWk4WVQ3OEZj?=
 =?utf-8?B?OWVFdzEybkpKcC91MG1uL1NDWjA3dGUwVDRNZklLdEh1a2xncTNpZ3UxSHI0?=
 =?utf-8?B?amE0dUJ2SW1zMVV2N2FyeFVCem1hMEFyRUR5Vmg4eE9ROVpuclhnZDRERkJH?=
 =?utf-8?B?eTdjK2VGSmloSUZnYzZKZUptc1V2d0RTZ3RQSVZoekZGclEyRUtzWkYyTmEx?=
 =?utf-8?B?L2I2WC9wcHppc2ZzZ0s3dVk0SER5T0VEbE1BeWo1c2VsNHFwbFJJUEZxMnJZ?=
 =?utf-8?B?b210KzljR2JnN1NxWDROZXJDdmx5L2tVd0FnbUNrbTdOUjFCM1FWeXNOUUVI?=
 =?utf-8?B?ejgrWG40cVl6LzlDWGsyd1llMkh4RGVsZU8vOHVnWWxZSlpMbzlKb2x6Umh0?=
 =?utf-8?B?VVljS3g1K1BtdUUxVi9mdGlYc2JJblk2VnUxd25MNWFHSFZ1Z0x6dVNDWCsy?=
 =?utf-8?B?NnNYVnZYeWYxTUh0UXlZd3FYYjAzajlDVUp4WDd1dWp3RUdra1YwQVUyMW5L?=
 =?utf-8?B?SjVlVXc4ZlRpL3pPaUNYYkJjdEJxK1JFNXZXbkNoR0I4b1puZWZoMStSMFd5?=
 =?utf-8?B?OXowRWI1b3p3cG5aNDNBb2svVmh0TnY1TmxJYXhWamhoU3FMb2lqdGZpdzZ4?=
 =?utf-8?B?ck5IVTZYYTk4c1Nmc1BJb21LbXlHZ0wzME5VaDVCL2EzNEZrd0xrRmdTaHhi?=
 =?utf-8?B?NmtxUlJ4UVNmVXcvNkNSOTZMY0F3OHVveUJxc09TdktuUnV5bVBaaDJ1NTYz?=
 =?utf-8?B?QksxdnJTbEVDTXR5eEZNUlpsMGQwNmtVVnhXN3ZyQXBTOGtOZy9RUGpDblVa?=
 =?utf-8?B?OUxCYWVCUjlOMWtpSG41TGtQYmg0TnpYVXFqM3RISnh1QTJKSFpoYXJuUG9j?=
 =?utf-8?B?Zzc4UVZYZ3o2NEY5S2ZmdXZhcGJvY2lMTXJoWTBuNkdPMWlCWEJOVDEyaDZC?=
 =?utf-8?B?OWRRaktYYU1ndzZDcXBaK3NTTmZ4Vlppd3NUUnJXNkJ3NTlvRUZydFdSdUg0?=
 =?utf-8?B?VkRFUzJCcjdvSlBxVVF2V2ptSXlNZmlRcDVOWCs2TDZ3Uk50T2VUMThTRlVL?=
 =?utf-8?B?RW9qUldMQzN0ODNtQ2JIS2E2UE5GL2EyNCtvQWgvK3BoemhQUTdsazBsQ2Rl?=
 =?utf-8?B?ZFVxaDl0dFhqQmtuTGtDRXF6OVVVS1drY3hHaUJ5MkN1eUV0UGNva0phK2ht?=
 =?utf-8?B?R3Bpa2FUbWQ3L3BpVVBaZHFtaWVzOXNNZXFCMnNpd21nZ1pmQzBvaVJCVXlS?=
 =?utf-8?B?UUFQdlA4azFGQi9MS2ttd1hiZXlBT1Q0WkhLVzR0N1N2WHNveitna3h0SUV1?=
 =?utf-8?B?elJxSW8zdVlWano4bWYrUGlIbWp5R0x0UnRHeUw1ZER1blQveGw2aGp3Uk5r?=
 =?utf-8?B?UlRRTWQ1OEpMNTBWK1ZYWDdVNmZBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a92922-0546-468d-c8d3-08d998ddf36a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 00:08:49.0181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2GbHGRynU31xImopY1jqr8OWgJA3QT7tDVzNLL1+sN19T7VozFEAFpQRzntKZGLoO6zUzTSUM/v9drmg8DFXrJU6HiQoxQ5z3e/U2tTBSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4677
X-OriginatorOrg: citrix.com

On 26/10/2021 16:12, Roger Pau Monne wrote:
> Always allow the HPET to be setup, but don't report a frequency back
> to the platform time source probe in order to avoid it from being
> selected as a valid timer if it's not usable.
>
> Doing the setup even when not intended to be used as a platform timer
> is required so that is can be used in legacy replacement mode in order
> to assert the IO-APIC is capable of receiving interrupts.
>
> Fixes: c12731493a ('x86/hpet: Use another crystalball to evaluate HPET usability')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Yup - does fix the regression.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

