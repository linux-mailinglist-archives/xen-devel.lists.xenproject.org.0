Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2564BF497
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 10:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276575.472773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMRMh-0003yf-Jn; Tue, 22 Feb 2022 09:21:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276575.472773; Tue, 22 Feb 2022 09:21:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMRMh-0003vz-G1; Tue, 22 Feb 2022 09:21:47 +0000
Received: by outflank-mailman (input) for mailman id 276575;
 Tue, 22 Feb 2022 09:21:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4CiU=TF=citrix.com=prvs=045c9559e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nMRMf-0003vt-Ks
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 09:21:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d92ff154-93c0-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 10:21:44 +0100 (CET)
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
X-Inumbo-ID: d92ff154-93c0-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645521704;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ACa3DvRBh9KMcEYtqPqbWWXnOzdzKwiVElUtxnfxrIQ=;
  b=WXTSX9gfB4bwg9UYGu6u+qjchLN0HmM/f/XSOlsN0DzT3s/CGcb3tQZs
   Odo6xN0m8IynkV/rJs7q1GjEVHs6YvFHzY1//tbOFPZyPWaNFgcC0SPRE
   ROLeKxkKuANtG1CkYxvXv9XMnu4wh9NkXikkxfSQqdDM5Lr8geIhizZld
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66954165
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kAxrSq76l+C78Uwh6gY2/AxRtC/HchMFZxGqfqrLsTDasY5as4F+v
 msWDD2APa2MZjPzfYx1PI61phxUsMXWnNAwS1Bp+S8yHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFx2XqPp8Zj2tQy2YLjWVvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSXYgZwFIPuqdg8eAEBAQ5nYKkX44DYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQ6eDO
 5NHNFKDajyZIA9mG289L6ljhaCrhFPCQyQH+Fes8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc/17ErQQxiO89ov/+1+LKXFZSm9aV8Nz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 iNsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ieRs3Y5tZI2OwO
 Cc/XD+9ArcJZxNGioctPuqM5zkCl/C8RbwJqNiOBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WkPHGMqNZLdQpiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSevxdmiApy7VI7SYA==
IronPort-HdrOrdr: A9a23:Di0qm6BaTHri7n3lHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpYfHHfFAlEii8eV57HzzcZdQ60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="66954165"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nd/E2N6hp0jayzZrqTW1FrEUxgEgCMgODZB3GrRay3F0haOj3KTPkx1vCe275UG8+avJl4wU8aC3gNnsCZhS8UcoQWUJyEPA1BhOeszmp0wN2eLSPYrB1FTGgooVqQFPTfeTNGF4QVMp/cWJrziN1Pm1UHH0gpfj2LXm22yuhuqhi7roQ9pv2FyHroyL0EwRxgyL8IAuWmyCZgtOPcYC0WbaD6onIOUC3ACfTwM6TLN/tPxMMeakV9yhCLdSumbXsrj1pGbPSqzNCXLw5O3EODDYb/WNqfMhagSOO2Wq0C45l8qTBuJzKMrQleRFChy09fbO86eksh+ekqANYI9PBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+rDSTY7lRS5NQF2BOLMKBYxyt129NsK7YVVuf5nAxU=;
 b=BXmrpoapXRNEAhS60l7sQ9fWNuRe61WhpnkHJXTuxEAbtxNP9pVgM0cavuJU3SgR/tTQ7oxEeh7fjovGF4aq2604ClcwXuky28MTdKUi2x1r57CM1W9evT3VRUr8R5Ieeu/eINuCwDMmRbGl3XxkLTb6gmLkHw+EY03RZi0ukqkPkWc49k/4IVz58ZO6ZHQqVa1UASOdP/TpN50I5e8P6av33zQntvMffcwQ+GN8s8CLxVvjA3sUeF3kpDWyMcV3hkzB+nXpjB9fd1RIF7nNK9Daf5/celaBMRy5TKJsVJ+Hz0Ig4k3aKurh0dJoqXVcY9qQpGGYuvfTPcQBrAK5NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+rDSTY7lRS5NQF2BOLMKBYxyt129NsK7YVVuf5nAxU=;
 b=JlxDXCGUR2Owea/2tHs2pSP5hmFlvcReWOOlCI716ArlwPl61/ldLgQ5/UmJtW2aezQN3AltYgurBqdcPl2hYv/xjtDzNBXCEAk1JlHTWM0lIiWnyapHFzy0NajK1vQV1I4FYIs7cXZwOBncyFEb+BVsWeVPdFskqXrN34aTm8E=
Date: Tue, 22 Feb 2022 10:21:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/3] SVM: sync VM-exit perf counters with known
 VM-exit reasons
Message-ID: <YhSrGECFFGafLehR@Air-de-Roger>
References: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
 <00a9007c-62ef-8bad-5a92-67d0b880fda6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00a9007c-62ef-8bad-5a92-67d0b880fda6@suse.com>
X-ClientProxiedBy: LO2P265CA0442.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c29d9d3-fa8d-4ee3-3b4e-08d9f5e4b780
X-MS-TrafficTypeDiagnostic: MW4PR03MB6394:EE_
X-Microsoft-Antispam-PRVS: <MW4PR03MB6394E0115C3C5BB170ACF1FF8F3B9@MW4PR03MB6394.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m60agfg7r2wLp6BKX/KVtyV24XomfIDidMLQpCsjxC4g7oF4v8uATf+PCTBDyaZR/7jwJrc2IPM5CUuUEzWUkS6MQ82i2/RWdIg4VJDa8Lvh2WPtejUGXRqs2p8iBanKfsj8UB9jg2iSNI2Jlobq77WMYLQzp8jso3P7X70oC6cyUktUjfHak6XBpLPGr8nkWTyf5aRVn2bwTfzd47lTuJnyQUqIGYWRGz5uXelpm+mK/ekS+EeiSUeCTyq3ZQVnqvKTE8LRxD26TcgeprLU7cFKSie+5d/pJ/0lVTjl8hi1EzolKHe6QlWMYEA5RIL+0yAJJQAtORM1MVdaiwPETLCE1fw9lRKuNnL8MF6qatoMWoGBeoPgBFYQN+Tu94u3O2yXUGsXHD6i72OmOm19Qj+YBICeJe6yhvBrol+uwszZ+SG40zydI5jEQNRfxhTZWcytEIYaVDryfpwgz4bpRiaQlDiUoSb7AcdpPoWCO3RtVcnxw5Fp5iedXHoY9SJAZ64fbyowPZxVlCIKEKxtdq68aGyiCUUtkwKprl9/WxY8wDaifCQvt9qNWIjtxnn2tvET81fwMNVgc1D4r1SpHs2nwsbDmTAQE0lgiBEWoHWCiygOJ8GGCxUgA9nnDctZzJ4fK7zhZGnWjt8zDlqByg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(54906003)(508600001)(4744005)(8676002)(86362001)(26005)(85182001)(33716001)(6486002)(4326008)(66556008)(66476007)(38100700002)(8936002)(186003)(5660300002)(6512007)(6506007)(6916009)(6666004)(9686003)(82960400001)(66946007)(2906002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVBPajdWOWgyNkpXWkhyZHJZOGx4U0Z6Rmo3bHRGSXBQQVRJNk1qcnE3Zmti?=
 =?utf-8?B?aGQxS01TWjVnNVJ1SVMzMy9CSm4xdkZKVDBTajJFanhodXRQV3ozNmNsY1Nu?=
 =?utf-8?B?RkhEU0RkSXZGN0o3dFVBcFNxQXh4ZHpnVUxDYTRiZ1NIejRpMldFa2dlb3JV?=
 =?utf-8?B?UFBMWFNtSHM3NlBzMVc5RGowNWk5K2N4YThLSFpBOFVLT0tmZ1hzWVVRbFE2?=
 =?utf-8?B?Q3RmZnRpRVhuOW1oNkdqYnZuZloxNGQycmxHa0YzeVNKS1VxUW5HRG1iMlhT?=
 =?utf-8?B?L3MwSDdqU1gyczdQcGxEajd0OUd3RXAwRFVzR0dnNit4NTZxUFFJblRQbDVB?=
 =?utf-8?B?T053VXFwUWRaWTJ4Y2lFOFlxK3AycVV0NkhHU2Y2Rk9GMEZJeVJ2TjJySS8x?=
 =?utf-8?B?RWI1S1NETmhtN1QwSUlaaWRaaXNoL1BWa2hzR043QlVMYTJlV2YwNE0wREJ3?=
 =?utf-8?B?QzB1RThzRTlQeEhnVkRJckR6Zy9BOUh3K0pIODdhajdMUmJQU2tXTUlaRk5Y?=
 =?utf-8?B?K3RISnJRNkxmN08rL3c3c29nRFUwTmFkcW9TbDVjOTVwYXM4OGV4RDJLbS80?=
 =?utf-8?B?VXNGS2ZLUFdaWWgvUXhncDlSYlIzZUVDQWdWVjBUdUp4VkZ3anVyY3paUlpr?=
 =?utf-8?B?b21SeGFRVjRMbENPOGNkTnBtWThoUllaMjk4b2xhcTJzc3hpRS9xa0dzWmdF?=
 =?utf-8?B?VFBvbExVZ1RTd3hLMFB3K3dJR3VrVEFTZXA2TUdXTzVRelhSN0NDRTluNnBY?=
 =?utf-8?B?UGxFNGFqdSt6OUlrV1d3dzZSc28vcHNWNGZOZHMwUCtuNnB3c1dEb1poOGRH?=
 =?utf-8?B?MVJLcTMrQU5LRDZsLzJHWEFUMW15SVFWY1RPT0UxcUl4MnFzRkVwdk12Z0Rp?=
 =?utf-8?B?ZGZYMzJXdjBncElRdmlJRUdCMXQxZTZEVGNWcjhkdkFQSUU4alN0SXRPRzJR?=
 =?utf-8?B?YnJRR2VyLzJMczlDWmZ4ak5aWTZzaDRCYXR1cURSdStZVmhOSlhqZS9uYnZm?=
 =?utf-8?B?T1dTTjFsODBoWC8zV1c3bThwOW9aNmZ2VXZkdXg4Tm5kNFlXMzFIVFY2NE1r?=
 =?utf-8?B?Tnk4eEhUNFpGMVl3R2VXOHU2YUZvSWxpSXpVSlZCWUowcXJCL2Jic1RNNkda?=
 =?utf-8?B?VWFDWEhjNTBSRnc0ZkNqR1Q2VU5UZHdCemVZUU9KWHZ3NEhhQlo0N1ZJa0F1?=
 =?utf-8?B?TE1qOHZ1S2Y0Z2Y0YWtxdGx0MmxCMUZjd3ZkNVM4SXNxaHJoS1hZOHAxSllN?=
 =?utf-8?B?OW5wOHhNOXd5SW13OW8wV2tPcDhDdGtZemFzeVF4RlV5d0VSMU5nTUpNWVB4?=
 =?utf-8?B?TiswTS9Gc21YRWowRUYvbHNoYXRXdEIwdDhINUNwOHBSZFRFV0hRdEVrUHpi?=
 =?utf-8?B?R3plaDk1NVdEQTM2VTNVanJLTUtJa0JzblFuRDBNZkJ0VkJYVTdrd0JWeUhW?=
 =?utf-8?B?TzFLMmNEak5XcmxVVjJOaldVT21JWFI3anFZdGJTVFBVSG03M2RGbDJua1V0?=
 =?utf-8?B?SUNoRlg0VWZPWlgrY1F2d2pnTGhrb2Rua2c5anRkQTZSd09yRXpiT0ZIY3BM?=
 =?utf-8?B?NDdHK29FeVFPaDVLSGZCeWVjNHJWYkx2R3JZdlVObDluRDd0TzhBaWl2L1hH?=
 =?utf-8?B?b3lWTkJtMm93TFhJbzJLWExIRUFJZ1NrOHhrYXhiNkRBaXlvQXV1dEFHemJZ?=
 =?utf-8?B?ZytBRnNSUHV6b1p5aVp0YXN2d3BuVkMwaVgyT2FKSnVPanNydm5rS1ZrNzJP?=
 =?utf-8?B?aXdPL3V3OVZqN0Q0bkF1SEVwc0thbWwzVkxoQml6bEYwMUlPTjNGQ3FwV1lG?=
 =?utf-8?B?ZnRxMVE1NUhURjBhSzhsbVdRcnVKMVhKRUNsRElKcERqY2dIaWM0V01IQ21h?=
 =?utf-8?B?N242aG0rMGRMTjhaK1B6RGNSdmRNQmVDOWNJdk1rZ0wvZTkxR1N6c2g4VkRv?=
 =?utf-8?B?Q3cyanZoT2NETGxJT05GU2x2Z1pXVEF1cFFJQitmRDVGNDlQMlZpYzl4R3Ir?=
 =?utf-8?B?clZubkwzcHB3S1N2QVFwbTBnY0tGUC9hQTh5ZzNOcEFnL0pDVVVJcmhZZUZh?=
 =?utf-8?B?R05HVEhzRmZuRldrcWc5a0Q0UjlhaGdOblEvZUhtL0t4ZkZSRmlhZUhUN1k5?=
 =?utf-8?B?TEtHWnNYcHQvMWoweEpCQ2I2eTM3QjNTUGdrbk4xUmdrWXVnQlVScWhyQXo1?=
 =?utf-8?Q?23HnzpwvwJGdKdjusrfn8WM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c29d9d3-fa8d-4ee3-3b4e-08d9f5e4b780
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 09:21:33.0868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zi6HVNHTLY6ohKpT4xjwv+xxZrNti3xy1fd3031Mj1xhpYWxtJ6MEv/CWU8DCciSlTdPR/GO7y664CzVdT0SEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6394
X-OriginatorOrg: citrix.com

On Wed, Jan 05, 2022 at 02:58:11PM +0100, Jan Beulich wrote:
> This has gone out of sync over time, resulting in NPF and XSETBV exits
> incrementing the same counter. Introduce a simplistic mechanism to
> hopefully keep things in better sync going forward.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

