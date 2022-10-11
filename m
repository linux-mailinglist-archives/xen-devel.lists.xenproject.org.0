Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE345FB817
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 18:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420426.665254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiHvB-0004AP-T9; Tue, 11 Oct 2022 16:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420426.665254; Tue, 11 Oct 2022 16:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiHvB-000473-Py; Tue, 11 Oct 2022 16:15:57 +0000
Received: by outflank-mailman (input) for mailman id 420426;
 Tue, 11 Oct 2022 16:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHIK=2M=citrix.com=prvs=2762267ab=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiHlL-0000OR-Uf
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 16:05:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f27c28c-497e-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 18:05:46 +0200 (CEST)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Oct 2022 12:04:08 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA2PR03MB5769.namprd03.prod.outlook.com (2603:10b6:806:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Tue, 11 Oct
 2022 16:04:06 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 16:04:06 +0000
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
X-Inumbo-ID: 8f27c28c-497e-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665504346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lgz/WGO6rZZcxY5NBE3oZRmF8PNamyCzYRjCRBsXCds=;
  b=OuAF7PuJwEKfiJsHtCwhHS6ivkdEtHIpW2z1t5ssQimhVsXIjcpz6SJV
   0uHGDep3uIG++r3i8tJLlfnID9vUsOGLSl2tQj0ih7xI4U8jzofX9aXyA
   k846lJy0sbATagHDPLIfEu6+7HUAobd4rrUYezOsnJHS28h0BEWmiopkS
   g=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 82907556
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ktAw06n/DiHhRdkyp22qL9Lo5gy3J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfWDjSPvePNmGkKI10PYXg8hsB65CBmtQxTlFsrHwxHyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRnPKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfUGoJ3
 qYGdWAxXjfcgMaM+Y6bTPhVv5F2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PnGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iL217eQwH6lMG4UPJGDzaZuhG+D/Tw0Ex9RD1a38PK6hmfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAkQzhbeZoZvck5bTUw0
 xmCmNaBLT5lvaCRSHmd3qyJtj70Mi8QRUcdYQcUQA1D5MPsyLzflTrKR9dnVauq1Nv8HGiqx
 yjQ9HRuwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBdypb2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:0R1vB6iDzAKgUfEjIkw6gO1V83BQX0F13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hqAV7CZnichILMFu1fBOTZslnd8kHFltK1kJ
 0QCpSWa+eAcmSS8/yKhzVQeuxIqLfnzEnrv5an854Ed3AXV0gK1XYdNu/0KDwUeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0l9
 gsAp4Y6o2mcfVmHJ6VfN1xJ/dfKla9NS4kY1jiVmjPJeUgB0/njaLRzfEc2NyKEaZ4v6fa3q
 6xG29liQ==
X-IronPort-AV: E=Sophos;i="5.95,176,1661832000"; 
   d="scan'208";a="82907556"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl+buQGtwI2MurLh9L+YAB4FgDdkKLpt7Idxva4/91C5iP/jzbTBPzmWjCmVX1W9sZxdmDLfRLKS6GsXBZHlCSpuyjcmJw5BxoceYaiQP0+3bNcS6qrulUQO/W8BwhNJAqLKwu2Hev+PP8PQfNReTCQACwDM78W1c0lHEXM9sB4JDhs6mz5t7AZJPFqR4/dkBH2s6EvxI/lg4mhhYqVFKqGEpVMWRRZE5SefI3UHymKXcCn/mQY2Doc3u0d7FymF0o2sOptRVDvMtjdgfBbxS7GCLhU4zNlAztYcYQvhcGKDNmb27M0BsgrMh12fETSznSW86rns2PmdZVdE13OUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWS8sZqxQqNjj3kC11vQty6DTyEgLxdM96zPK2XwtGA=;
 b=T0OmC4qLDyG4mfYwW9S+IZbVgQNvaJNnh7Mb8fc1ED48DfaaSm4N2rfEAqVS5fXExecHuhXb3ChUHHtH78na1btNwho4neaUByzwz/lhNUaCfZbwDP6G3/dr9a3gx9ayWrmFefmMiTh6eivLahHxJEilBQxOxnWI3reqGvkKKfNxhPlBWtTHsSedvZf/ItvzwBYAHAdYdKdqSZywYWHOCmJpKYIk8ac98fLk8D/g0Q6alNg03GdVrUCboHKnQ+T3PJCTYfJQGlybl//aBJkKECA9iO7N/cXurHfY20qi5mK8J4dnO/WJq9hlEdu+fFiXQcG1ySKljsdBiUdW4KH/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWS8sZqxQqNjj3kC11vQty6DTyEgLxdM96zPK2XwtGA=;
 b=m3+FNu4hSIpFjgw8tmc9XFFRN48UCUxnRmE8co5QEIlexOUscVmEpntloVI7wBSfG6ao3QH5iCUqxFkPiGGPx/fDajCTcUY00wzv8HowmOaLrs78sECT9PF6vN/S/kL5aqJ04qlKcXym3azEUJZduKJo1XthzPWgvFLT+JOWjqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 1/4] amd/virt_ssbd: set SSBD at vCPU context switch
Date: Tue, 11 Oct 2022 18:02:42 +0200
Message-Id: <20221011160245.56735-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011160245.56735-1-roger.pau@citrix.com>
References: <20221011160245.56735-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA2PR03MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 690056f4-3f94-4648-57c9-08daaba2397b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jb56XMXcBPBAObEpiAJjySbz14te1MQdqpf0IbZihkLqBA5Jo98RIr+vnfLaw0PkG8LU/gV9V2ftKkjzANRyuipsbdALytQSqjTx4zW0Sg32qmvRspB2KjH/qEieiKCT/I7grPXsk4LB8YtFSLuiqG3GQcUHZyHtDNdWWWmkitZyOZ9w/ZMEwvBY2A8u7wCjZ3ZTM/tLBFmXHN9BDE/qwvJUblLkG4VuiVgkztxOmMS7epJ9boE/1hMsIBDUy7y4CpeB9tP9vdCn9gstFY8sLRxsGzR25j1BzioyiIjEWs2hY6BEKJsoOkork6sDzQT47ObgqCqPw/Gje+3dYi+qiaz0xhXvtNmucDqdnFsJGi6TPFw8uuN21ICvK21Hz0GC7cmSbjZ1u1oKQoUTmA5atk4KJ6vVXTlek/AruXIwob6go23UUsON8I8LYgaxssRVibbHeppMogvHcKpHRUj54PaFE9CmIOm0gPYmQ62d+znptiTZvaZyYrm+I+kJHeo23Gn54eYcpNgISbtxwFBb0+WGc8btMFimerehO+U6uW8oNbGIp0EkGkX0PE8rFfvwW1fzU1tQWJOykwPtePec/XsdBt113wkTi8eWmWhGUJ1z9IKSPFyL0jSnNXflx/NNktV4ibjGzxdwXgtwxVESf+1ExBMm6YF0aqKhAgvYOXzQTL1G/+jK2cMBar+TjdcTxqgSriVqQ07mbOHbi/l8yg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199015)(36756003)(86362001)(83380400001)(5660300002)(38100700002)(82960400001)(2616005)(186003)(1076003)(6512007)(6506007)(6486002)(6666004)(26005)(478600001)(54906003)(6916009)(8676002)(66946007)(66556008)(66476007)(316002)(8936002)(41300700001)(2906002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NExLOHNEc3ppdmJKMVdraGwySzVSQXN4RXI5cnNnRUpoeGVUM2pJZVo5Q0dx?=
 =?utf-8?B?SW5TbXZVVWV2TTlNQTBqQVpXWXRJTGpNVC9lQXBJbEVHTk5xUFV2bDJvUTFS?=
 =?utf-8?B?d3VLR0hTYUNlOGhLZ3E0RW52WHd3SmlJd1psUWtDL0hHVGREY3FxN3JlVS95?=
 =?utf-8?B?Ly85cWRSWTZvL0lxTEp0S1k4ODBVMDNaeThYRXU5NmxDNnhydE1SSkUyTThl?=
 =?utf-8?B?REdzckZxVk02Nm5ZTVBQSWU1UFRrWVBjcElaUXVGSlY3dWh0WmRqRUtZQU1Q?=
 =?utf-8?B?V0tVM1Zsa29KdVJDUGR6VHJ2Y3ltWGhSdHB4ZkZzdlBua2Y2VHlKWkQ0Q09O?=
 =?utf-8?B?OGlWakt6WDhyQXI1RFlFaGkzVm5ITnBnQjBzMHBXOCtsVUpkbTdzQWxzWkdv?=
 =?utf-8?B?Y01La3BQQzg0MlpoZkhFN08vUGhiSmJWajVkK2tyZDJMSHYwQ1ZndDUwVExt?=
 =?utf-8?B?ZmRML1Vxc3A2S1NLcXNWcFc4S2t1Z1JYVktvdzI3R2VUcmlJaEJsWGVObS9G?=
 =?utf-8?B?WlkrZC9jNUpidHVQQVl4cCs3cjdoQjNWZjRTc3dQZHVzNVdIRHExSDEzbWZp?=
 =?utf-8?B?WXFwVFNqaXZwcFlWVE9oYWI4aFlUR1hBMGNDUTRkbGtBcysxVFpNeGZCcnR5?=
 =?utf-8?B?L0YrVmdXajRNb2VSdDFXbG5zSENCMHdYSDIvR3QwRDJSdld3b2NYdGVMa2Y0?=
 =?utf-8?B?c2VLZ0U3UGJSNnZFTVlpbTJUT1lRMkdEa1E3OXYya0FWU0tDM3d0VmpSZHB0?=
 =?utf-8?B?aTlUNENHL2R6YXppQUNTMHhWTW1QNHF3UjQwNHJwS3ErK1pydE91VzU0ZU8y?=
 =?utf-8?B?N0F6ZmcrYVJ5Y3NTeGVBVFhpbTdUYWlGVCtOQWtNSGZZVXdSWVFCZUJKY3p5?=
 =?utf-8?B?cTlXaHUyWVRCMjY3OFhKYkM1Q3BBRC9Fc2hWRFVvVzhtZnZubzROUDBMSjNJ?=
 =?utf-8?B?UmRIc3pJclhuclU4a3VBbGU0blV4dHBSTlFLVi9KVFE4eWZvSXc4aVAyVW0w?=
 =?utf-8?B?VXhYUlIwcmxnaDREUE1VUzlENnEvdy9lM0tjdHIrcEt1YjFudDhOSUFVUlhx?=
 =?utf-8?B?VUZKbFBjbWxkdUtsNlVsdkxZbDZNYTB0aHdCUVpDeW15a2JvRmFHUlZ1UnVQ?=
 =?utf-8?B?MlliMkVpblR4TjhTeFVzL0Z0K29qVTMybWYzdFFmSCtBWWJnM0tpdmEzeEhr?=
 =?utf-8?B?U1VJekt2WmpMWVZtczl1ek0yVG1ocllQNVhPMk9QNkwzdzRBRDJrcEhBdldE?=
 =?utf-8?B?aERYMmNDYWJDYUVLTG90aG1pRHRRaFJLdnZzZXU5enF1ZFJneW9FYURMS21l?=
 =?utf-8?B?dWlwUVdRR2llOUhLaVo0Uk9CWWU0T1FhNlNUUnA5K0JvL3V5RFBwK1c5NTVL?=
 =?utf-8?B?b3NWejVSb3M3NDVxemg5eWxYcUlhVk5KcTQzVXJhZEh6aVUvaEEwUkdTekRo?=
 =?utf-8?B?M2VXM0RwaUdHOHpiK1p5WXlOQ3BNWWYwd2hPSUlPSW5iTndiVHBGdloySzAr?=
 =?utf-8?B?dnVKdHlzRzNQc1dEVDdSTGUvWkFUWldOOHZycDNGTHRCYTN3NTJyS2NRUTlU?=
 =?utf-8?B?M3lsL0pOVGJqR1NBelZtREM5UCtzaXVoMWlqOVBDbUU1UmN2ME5KWmZtRTRX?=
 =?utf-8?B?UUw4UE42RGU3ZUJxa3htK2kxNDdmMmpUMVdEeUtMODZLTEk2SFZLMHhGbzN3?=
 =?utf-8?B?NU04VWdmQ0hZSDFma2g0aXFRM2U4eHpRaTVJZ012SVZ1TGtlSmVhUUU5WXZk?=
 =?utf-8?B?NHBsbGNxSzF2OEhOUm9FUC95ZFRsUlJ0VDUzNXRvTHlwYnNIQ2E2cmN0blN3?=
 =?utf-8?B?RzZUMUdoNkNiSlpqZ2pyVk5RN1d5T29USHJLOCtaK1h0YzVpeHh2NWNBQUkz?=
 =?utf-8?B?V05zL3ltM3hIOEtwQ3p2dlVtUFgvZnV1bHVYVlRFck5BYjhOdzQ2YjlRT1I4?=
 =?utf-8?B?aUdjNndTa0UvNUhqUlB2bUM2UHJCSStZVExVTzI5SUxWUVFncWJXaDl4ZEk0?=
 =?utf-8?B?dnBYcjArRDhvYVdaOEpJdGZ4c293K0RhbCtKRmJKdnRIMUtjdjFiMzFYZW1m?=
 =?utf-8?B?T1lEUXUyMUE2cjJteityakpvM1h2ZmhVNVMxRWRrZEFDbTlUWXkzZDVtcnlK?=
 =?utf-8?Q?z7UVCKhPjHPr6EUrdxuSM/7bN?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690056f4-3f94-4648-57c9-08daaba2397b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 16:04:06.7219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XY7WKD2QERFZtJupM8JqBZCtW/uoc6RgffHXNzEUPdN6I11KmsJsr6iNFBJ3Z48xufnZuYrX5MrvYXBxx/Y8jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5769

The current logic for AMD SSBD context switches it on every
vm{entry,exit} if the Xen and guest selections don't match.  This is
expensive when not using SPEC_CTRL, and hence should be avoided as
much as possible.

When SSBD is not being set from SPEC_CTRL on AMD don't context switch
at vm{entry,exit} and instead only context switch SSBD when switching
vCPUs.  This has the side effect of running Xen code with the guest
selection of SSBD, which renders the ssbd option without effect (in a
similar way to what already happens on Intel hardware).

This fixes an issue with running C code in a GIF=0 region, that's
problematic when using UBSAN or other instrumentation techniques.

As a result of no longer running the code to set SSBD in a GIF=0
region the locking of amd_set_legacy_ssbd() can be done using normal
spinlocks, and some more checks can be added to assure it works as
intended.

Finally it's also worth noticing that since the guest SSBD selection
is no longer set on vmentry the VIRT_SPEC_MSR handling needs to
propagate the value to the hardware as part of handling the wrmsr.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c         | 50 ++++++++++++++++++----------------
 xen/arch/x86/hvm/svm/entry.S   |  6 +---
 xen/arch/x86/hvm/svm/svm.c     | 45 ++++++++++++------------------
 xen/arch/x86/include/asm/amd.h |  2 +-
 xen/arch/x86/msr.c             |  7 +++++
 5 files changed, 52 insertions(+), 58 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 98c52d0686..a1582e1cc9 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -742,7 +742,7 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 }
 
 static struct ssbd_ls_cfg {
-    bool locked;
+    spinlock_t lock;
     unsigned int count;
 } __cacheline_aligned *ssbd_ls_cfg;
 static unsigned int __ro_after_init ssbd_max_cores;
@@ -776,46 +776,48 @@ bool __init amd_setup_legacy_ssbd(void)
 	if (!ssbd_ls_cfg)
 		return false;
 
-	if (opt_ssbd)
-		for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++)
-			/* Set initial state, applies to any (hotplug) CPU. */
-			ssbd_ls_cfg[i].count = boot_cpu_data.x86_num_siblings;
+	for (i = 0; i < ssbd_max_cores * AMD_FAM17H_MAX_SOCKETS; i++) {
+		/* Set initial state, applies to any (hotplug) CPU. */
+		ssbd_ls_cfg[i].count = opt_ssbd ? boot_cpu_data.x86_num_siblings
+		                                : 0;
+		spin_lock_init(&ssbd_ls_cfg[i].lock);
+	}
 
 	return true;
 }
 
-/*
- * Executed from GIF==0 context: avoid using BUG/ASSERT or other functionality
- * that relies on exceptions as those are not expected to run in GIF==0
- * context.
- */
-void amd_set_legacy_ssbd(bool enable)
+static void core_set_legacy_ssbd(bool enable)
 {
 	const struct cpuinfo_x86 *c = &current_cpu_data;
 	struct ssbd_ls_cfg *status;
+	unsigned long flags;
 
 	if ((c->x86 != 0x17 && c->x86 != 0x18) || c->x86_num_siblings <= 1) {
-		set_legacy_ssbd(c, enable);
+		BUG_ON(!set_legacy_ssbd(c, enable));
 		return;
 	}
 
+	BUG_ON(c->phys_proc_id >= AMD_FAM17H_MAX_SOCKETS);
+	BUG_ON(c->cpu_core_id >= ssbd_max_cores);
 	status = &ssbd_ls_cfg[c->phys_proc_id * ssbd_max_cores +
 	                      c->cpu_core_id];
 
-	/*
-	 * Open code a very simple spinlock: this function is used with GIF==0
-	 * and different IF values, so would trigger the checklock detector.
-	 * Instead of trying to workaround the detector, use a very simple lock
-	 * implementation: it's better to reduce the amount of code executed
-	 * with GIF==0.
-	 */
-	while (test_and_set_bool(status->locked))
-		cpu_relax();
+	spin_lock_irqsave(&status->lock, flags);
 	status->count += enable ? 1 : -1;
+	ASSERT(status->count <= c->x86_num_siblings);
 	if (enable ? status->count == 1 : !status->count)
-		set_legacy_ssbd(c, enable);
-	barrier();
-	write_atomic(&status->locked, false);
+		BUG_ON(!set_legacy_ssbd(c, enable));
+	spin_unlock_irqrestore(&status->lock, flags);
+}
+
+void amd_set_ssbd(bool enable)
+{
+	if ( cpu_has_virt_ssbd )
+		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
+	else if ( amd_legacy_ssbd )
+		core_set_legacy_ssbd(enable);
+	else
+		ASSERT_UNREACHABLE();
 }
 
 /*
diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index a26589aa9a..94089e61bc 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -59,9 +59,6 @@ __UNLIKELY_END(nsvm_hap)
 
         clgi
 
-        ALTERNATIVE "", STR(call vmentry_virt_spec_ctrl), \
-                        X86_FEATURE_VIRT_SC_MSR_HVM
-
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
@@ -131,8 +128,6 @@ __UNLIKELY_END(nsvm_hap)
         ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
-        ALTERNATIVE "", STR(call vmexit_virt_spec_ctrl), \
-                        X86_FEATURE_VIRT_SC_MSR_HVM
 
         /*
          * STGI is executed unconditionally, and is sufficiently serialising
@@ -140,6 +135,7 @@ __UNLIKELY_END(nsvm_hap)
          */
         stgi
 GLOBAL(svm_stgi_label)
+
         mov  %rsp,%rdi
         call svm_vmexit_handler
         jmp  .Lsvm_do_resume
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 1aeaabcb13..0c5ffad05d 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -973,6 +973,14 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
 
     /* Resume use of ISTs now that the host TR is reinstated. */
     enable_each_ist(idt_tables[cpu]);
+
+    /*
+     * Clear previous guest selection of SSBD if set.  Note that SPEC_CTRL.SSBD
+     * is already cleared by svm_vmexit_spec_ctrl.
+     */
+    if ( v->domain->arch.cpuid->extd.virt_ssbd &&
+         (v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD) )
+        amd_set_ssbd(false);
 }
 
 static void cf_check svm_ctxt_switch_to(struct vcpu *v)
@@ -1000,6 +1008,11 @@ static void cf_check svm_ctxt_switch_to(struct vcpu *v)
 
     if ( cpu_has_msr_tsc_aux )
         wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
+
+    /* Load SSBD if set by the guest. */
+    if ( v->domain->arch.cpuid->extd.virt_ssbd &&
+         (v->arch.msrs->virt_spec_ctrl.raw & SPEC_CTRL_SSBD) )
+        amd_set_ssbd(true);
 }
 
 static void noreturn cf_check svm_do_resume(void)
@@ -2518,6 +2531,10 @@ static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
         vmcb->spec_ctrl = val;
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        amd_set_ssbd(v->arch.msrs->virt_spec_ctrl.raw);
+        break;
+
     default:
         printk(XENLOG_G_ERR "%s(%pv, 0x%08x, 0x%016"PRIx64") Bad register\n",
                __func__, v, reg, val);
@@ -3116,34 +3133,6 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
-/* Called with GIF=0. */
-void vmexit_virt_spec_ctrl(void)
-{
-    unsigned int val = opt_ssbd ? SPEC_CTRL_SSBD : 0;
-
-    if ( val == current->arch.msrs->virt_spec_ctrl.raw )
-        return;
-
-    if ( cpu_has_virt_ssbd )
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
-    else
-        amd_set_legacy_ssbd(val);
-}
-
-/* Called with GIF=0. */
-void vmentry_virt_spec_ctrl(void)
-{
-    unsigned int val = current->arch.msrs->virt_spec_ctrl.raw;
-
-    if ( val == (opt_ssbd ? SPEC_CTRL_SSBD : 0) )
-        return;
-
-    if ( cpu_has_virt_ssbd )
-        wrmsr(MSR_VIRT_SPEC_CTRL, val, 0);
-    else
-        amd_set_legacy_ssbd(val);
-}
-
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 6a42f68542..81ed71710f 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -153,6 +153,6 @@ void amd_check_disable_c1e(unsigned int port, u8 value);
 
 extern bool amd_legacy_ssbd;
 bool amd_setup_legacy_ssbd(void);
-void amd_set_legacy_ssbd(bool enable);
+void amd_set_ssbd(bool enable);
 
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 95416995a5..a4c28879bc 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -697,7 +697,14 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
                 msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
         }
         else
+        {
             msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
+            /*
+             * Propagate the value to hardware, as it won't be context switched
+             * on vmentry.
+             */
+            goto set_reg;
+        }
         break;
 
     case MSR_AMD64_DE_CFG:
-- 
2.37.3


