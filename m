Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4759544867
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:10:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344834.570439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzF6d-00067d-Hy; Thu, 09 Jun 2022 10:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344834.570439; Thu, 09 Jun 2022 10:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzF6d-00065D-ER; Thu, 09 Jun 2022 10:09:35 +0000
Received: by outflank-mailman (input) for mailman id 344834;
 Thu, 09 Jun 2022 10:09:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xsch=WQ=citrix.com=prvs=152c7a754=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nzF6c-000657-07
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:09:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40fb8587-e7dc-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 12:09:32 +0200 (CEST)
Received: from mail-bn1nam07lp2046.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2022 06:09:26 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO1PR03MB5828.namprd03.prod.outlook.com (2603:10b6:303:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 10:09:23 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 10:09:23 +0000
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
X-Inumbo-ID: 40fb8587-e7dc-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654769372;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tFrNL56WR6J3LF3LsjSrGu5DMIJyLUUbkKS20m2Ib3A=;
  b=HDjG2w7r3Kb+IArrpcnYTAp71EBiBK/JB/1qNkydGzy+9o/b50lqDqB3
   Q6y3Z7IN4+M4keXbahAmcgV7RoFnN9qyWxU1vJPiLXec4zuh+4cATVGR+
   R6S3EmrZuyQxzQ+kmJjboug2gAXvG8I3N5TVx12JE7zVZjUvo7kczjPzb
   w=;
X-IronPort-RemoteIP: 104.47.51.46
X-IronPort-MID: 72565683
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:r0Ch/KJpRQgoDLOrFE+RIZQlxSXFcZb7ZxGr2PjKsXjdYENS0TwGz
 jNJC2uBaK7bM2r1eo9wbYi3oUlVvpDcmtJkGQplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3NY42YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Md9v8GrdgoSB7PBwb8RUjtFKnFRIqITrdcrIVDn2SCS52vvViO2ht9IVQQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMmFH/uiCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33CShLmMI8zp5o4Ixs3b5zhxhwoTuF9n8QMenZYZ/gFSx8
 zeuE2PRR0ty2Mak4SqE+3W9j+iJmSLTWYQOGbn+/flv6HWQy3ISDlsKVFK9ifi/lkO6HdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooL2yQuEAmkPThZadccr8sQxQFQC1
 EKNnt7vLSxitvuSU3313qyPsTq4NCwRLGkDTSwJVw0I55/kuo5bpg3LZsZuFuiylNKdMTPtx
 XaMpSs3hbQWhOYK0bm2+RbMhDfEjpPJQwgk50POX2uj4St4YpKoY8qj7l2z0BpbBIOQT13Et
 n5dncGbtL8KFcvVyHLLR/gRFra04frDKCfbnVNkA5gm8XKq5mKneodTpjp5IS+FL/o5RNMgW
 2eL0Ss52XOZFCL2BUOrS+pd0/gX8JU=
IronPort-HdrOrdr: A9a23:u4iQ5634y+sl/Ie35II3KAqjBTtyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMUj+Ka+Adwo4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 LxiiZlG/42x2Laf2mzrxeo8w780Aw243un8lOciWuLm72PeBsKT+56wa5JeBrQ7EQt+Ptm1r
 hQ4m6fv51LSTvdgSXU/bHzJl9Xv3vxhUBnvf8YjnRZX4dbQqRWt5Yj8ERcF4pFND7m6bogDP
 JlAKjnlblrmGuhHjDkV1RUsZ+RtixZJGbFfqFCgL3Y79FupgE586NCr/Zv20vp9/oGOu15Dq
 r/Q+BVfYp1P74rhJJGdZk8qPSMexzwqDL3QRSvyAfcZeg600ykke+E3JwFoMeXRbcv8Lwe3L
 z8bXIwjx9GR6upM7zC4KF2
X-IronPort-AV: E=Sophos;i="5.91,287,1647316800"; 
   d="scan'208";a="72565683"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFFkFQmrmyQJXm4ZSKGMQqXEOe//dvQacECnJgPoz+/R/+bnzbCKhWvvqTkVVfGrTOgUqihdPPP27ZGgHuc1EbOkflcRY7oEtqrSlLrZLEwjHo8HLf4HC5biWLnUnCsVD7t4irqSNrtnjQ6aV9XfZjc0XSTYj34laymUZBhLdX2wbsFLJAnGcid4DS0fkvGrncIBn8cdyhamF0h7Ejy0VlCxx35JcSnmTicf8tShy/Eehjq8LcMeccnWP//6zPIhsezwBWnTlxBTxYVVCy2WsBXiQQzF7utFHjOGQ7ucnmxZ3NagheexBAEpy/vy3JpAmu3Pv5Id9PcqEzSw/jHV4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2E4PxDigpKPE9tD7lv2bPpV+3LSY190CMvzZwrejMf0=;
 b=Zazln7noNmwiTlPNyPMAwr2kpfUaFZKZ5kj3z8FS3KDetuUtG2IqCpojReEd5Lta/DC9UEYe/BRsGvrkcDLY4RCXth6Dkz5EAKMQbTJUtMfQlWis6Zua/IL/vPJ2x7fVEBVZNGq3QeJRhSGrDbz0Ze8cgFeLBlEdxbQYmg3gd+fcK7gs+RWBUJQFKWEgsZQgLb2PPYwKlvaKCNVNFqi+h+eP1jn0aK8XgWF+COU63C//GbHuoFM8SN4TiPkmn8cTSVAtn3oSGmlrau0dIpdM7LOkWtXsuS23lIYN0fSUHJ0GhQymEKJ6cqu3Bt9mIGyn/Awc83/xh6kvgEj6UKyCWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2E4PxDigpKPE9tD7lv2bPpV+3LSY190CMvzZwrejMf0=;
 b=rbJfVuZZf89rjWSMIrurYmulzw2EouRCC31ojSh0nTwBN5F/mlCfEU+5E8YfL8Iindwnp05sQ4qmNTY4c941zVgX20yp8rL50T156SnAQGaUf7Sglc8pybpTO3jF+LYz7L3fvz+jH/m8bBsW5RZMQdTHQ4YwuJjBqRD+Tu9GtgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 9 Jun 2022 12:09:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Cooper, Andrew" <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	"Beulich, Jan" <JBeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"Nakajima, Jun" <jun.nakajima@intel.com>,
	"Qiang, Chenyi" <chenyi.qiang@intel.com>
Subject: Re: [PATCH v2 3/3] x86/vmx: implement Notify VM Exit
Message-ID: <YqHGzuJ+D0WjaW+6@Air-de-Roger>
References: <20220526111157.24479-1-roger.pau@citrix.com>
 <20220526111157.24479-4-roger.pau@citrix.com>
 <BN9PR11MB5276B16CB69514120B7E0E318CA79@BN9PR11MB5276.namprd11.prod.outlook.com>
 <4f2c4d5b-dab8-c9d2-f4c2-b8cd44011630@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f2c4d5b-dab8-c9d2-f4c2-b8cd44011630@intel.com>
X-ClientProxiedBy: MR1P264CA0043.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38084208-6db5-434e-1dd1-08da4a0020ce
X-MS-TrafficTypeDiagnostic: CO1PR03MB5828:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<CO1PR03MB58284F58082110F9DEAA8EEF8FA79@CO1PR03MB5828.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xi+LPy7uekwQ5Yviv5Rars/SLMQJCO1gUai3uM8PaiddCniBa1jTvYn6NTlfWUR+difDxtBu3acMt3iEkqqcKNXG8qFcQLk+hV9gK8kofn/q10tvtdewnc0u87J0FvZocNH5hCTQFELAPIgBWRxo9O4xhYfyHsGGAmnwT0u+w3jN2Vwljk8muk04hZiwQBNE2ARQPTk8n+q8493a5/FRxEwQu4806qN3C2/yfMKqRAmxeop4VhDgoX0TJTMtTaZzOTDuAQLjXKWQs0Tnt27pEf/Dr+UUiawbFhNNx6I3GnrOz5wS/hsi9KmmUunrHGMdyc/KbylpRvKzf7Mwl5QRM7d/7gWaN5UoyAJtkSKWMJK9VLibPGtFW5+vuSFRo7hXCBAyBYKWSjSi/ZGNPpAtDvCm7Jy5a3+SGnUU/BoY2XdEXAC9L0R5L4rhoUqJLKKbQlSL1VWHdb6SCrhPjgPusU5tesndKw+qpYQ1GW5Lpv+6yj3/J8LkxaEJiZ3BreTqz7NCEj0Ji3x8z9w0pAsxB5B+ehVzkOi7NHhAV8dFvHNkRuXh5IJ2mmU9cl1Bylll6MHlfDTcrqUMHGaH3RmczqTC7dYS9tMoR5PO4ZzGBDMEzmXyDJc4C8dmT7ix1lBW0SipPCEMNJIoJ30TaxzY0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(82960400001)(6666004)(54906003)(85182001)(83380400001)(6486002)(186003)(33716001)(508600001)(6506007)(53546011)(2906002)(8676002)(8936002)(66556008)(26005)(66946007)(4326008)(5660300002)(9686003)(316002)(6512007)(38100700002)(86362001)(6916009)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VncwS3htMUUvOGlVWmxHbFBjSXpQTkhUc0c5NmIwbFBjelBxR1lWeTQzanhB?=
 =?utf-8?B?K3l0VkY5S0FFdGlHWXdxbFdDK3A2ekhuei9qSkpmRWJqU0dsVnFQeStReW5Y?=
 =?utf-8?B?cG52NjFZbm5oVkFSZDBORmdleEVmNFcwOXdlU0J0cmhLRFRnM0V5V3F3UmRr?=
 =?utf-8?B?QkxLdVNZdGtpT3dDcjFPMGxPeUFkMi9CcjlGSVlkZTZCQjlDd1dxNFdsTVBn?=
 =?utf-8?B?SkVNaS90UHFXNzh0RDRPSWhyd3REeFB3Tkhkb1JGY1hSOEtybk5NWVNQVWla?=
 =?utf-8?B?Q2JZWWZWWnFtLzhyRFYrWnlhNkQwaUpLQVAvUHBsTm5oMTJaQVlyaGpNVFhE?=
 =?utf-8?B?WDFWTElrUGhvQWsrL0k4MzVDLzhpV2J2ZStVMGhwNWs4NjdsOVZ6YlQxdTJK?=
 =?utf-8?B?RVJJbTlrcVVhS1VkOUYwWUhhQlMvWVJYbHFUeFpwOTllclFOd1JlZDlQNHNo?=
 =?utf-8?B?T2o2bkNtUEVyUml6NkZwWnV6aUhZZ3JXSis2UmZIUld2Tm5QSkVmQnMzOU1N?=
 =?utf-8?B?OFVvVWpOL3FzYkFNSXc5TE9GVDJ2c2dXUXdYaTZaRlZwQ2Q3bmtuQS9kSW0v?=
 =?utf-8?B?NzdjQXJLSEwwMGhUYVZUMXE2Q2hOUVFDTllxYTVqOG12b3BHU0p0WnM3VFYx?=
 =?utf-8?B?UjFxSFR6ZXhDN2t5bmlvd3J5L24vRWs5WSt3RjJhUzY4bWJjT2dheHF2cEdj?=
 =?utf-8?B?NXVINE1GZTJwb1VDSWluZmJBaXdHNXozRGpTcllsNHEvRWtvUTYrSGx2eUll?=
 =?utf-8?B?dm01TU5CMzVyZEQzd3JQeStNbnJBWVRnZS9PNVcrUGpDSC9MYlEwdHlCcS9Z?=
 =?utf-8?B?cXFiWGlyTmZiUHZXdVlVcG9wb0VBUXZxN2NRMFhYdlJPZE9NbXUwNVpmM0VJ?=
 =?utf-8?B?Nmc0c3UxMEk4VUszS3dqclRIRGlMQTlFV2JHTXFNZ096L29sWEo1YmZXdWpV?=
 =?utf-8?B?YnFQTXNYQlhGeEZlL0xxdHc4WWVDSlBCc1Vzb0pvN1AzUnZzYXR2dE94NDE2?=
 =?utf-8?B?RU5PSHlOYzJrVjZ6MTEyZzNRL2cra2xnZ3pUU3JQZStMZWk1TTdDZEVqanVz?=
 =?utf-8?B?Q0lhclk3UnY0Rnc1VFZnRXVjZEZFUzRqUFVGb2N1ZzFFM3JXR0RvaTlxelpW?=
 =?utf-8?B?NXdGbVp0UDY0T3ZMUkV1R1Z2Vi9WbW8wdUtBY2YreVpBOENKcElZdFNDZGc3?=
 =?utf-8?B?Q0dnYXFTbGZHd1ViaE5sU3AxeFJ5VnFVYmcwcnRRc0VNWkc4Y2tXVEVRYTVG?=
 =?utf-8?B?VmtiL2RmczVjTkcraHR6elVYOVQ2bkRXTjVyZU96c284VEZQczd3eDExZnNj?=
 =?utf-8?B?VmJMcGpPeEVoK3ZVaDhuR0ZUU2hQVlhNTVJTdGRrVy9NZk1GK3YyN3VyVFh1?=
 =?utf-8?B?VzhGYkgrUWY2UkJLN2tXdFA3RThXRloxTDZHSjNZb3dWQk1QL3FLZEFiRnoz?=
 =?utf-8?B?TTV6NmYxSVhBakhiQ3pOLzhGWkk1OGJWZCtBTnMzQTVtNUV2VVcrbHRrMzJ2?=
 =?utf-8?B?S2JKTjhYWWYyUmpNM0tUdlVCME5wVkFSeHYxUTVPbVg0SGswZUphdEhpTjVm?=
 =?utf-8?B?UnNYdXV2Y1owRjU2YWpzVjJxT2pjT0dqbmdBaUk5RlpndE4zWldwc09aR2Vj?=
 =?utf-8?B?eFJDUGNIS1gxOU5kL3hPQUY1MTByM2xCZ2M4N09uSGcyaUJVOUl0bitnbVRu?=
 =?utf-8?B?clY5NHBkK2Vsa1Q3Y3c0THUzdWJ1SGVUWmVLMWtZOGlIRzNndSs2R1UwQ0g3?=
 =?utf-8?B?UkJXSUNRTTUwMDljQm81S0RjdEc4V2FEY3ZqUjYwRWhxQ2h6d1U3L0RWbWMr?=
 =?utf-8?B?cXEvLzMrVGxJVGk5QjY2d3lZZ2xWaUJGdjN6bFhkTkExTTRzNnVpVnpEVVdw?=
 =?utf-8?B?TFhxOXpFNGU3OW1aQWJ0N2p2ZVlBZ1E5N2YwTm0xbEhQSjZGMm1nejkvNmVZ?=
 =?utf-8?B?T0h0anRDQzlYOFR1R1hzZlZPSnNMb0ozcDlUZ1lJOW1oVkwyQW9hS0lZUCtI?=
 =?utf-8?B?WnNCMkROMHBmWFdPcHBRWHRKa2Z4RFRrdFN3dFFpWE5YYkJWVXgrc2FkK2FS?=
 =?utf-8?B?UE15b1dWOGw4WTV4aU53MFdmR2lOeVY5cHoxR1p6MkJmSmNVTlQ2K1pxYXgy?=
 =?utf-8?B?WnljRDVBN1lCSHpPZDBQS1I4T3hqbmFYYXNLZnFVMmhUaWRqdzMrL3k4WE9S?=
 =?utf-8?B?U1NjMFc4Q0FVQmNOZTM0S1IzbmRwMlJ4cVV3STE5Z3MxSXFmcjF1TG9CQVdq?=
 =?utf-8?B?dXBWQ0twbmd5WTVCbXpkeUhtQnl0K3ZPVXE4eE5QWTJCQnF0ZFgxNnRXdFg1?=
 =?utf-8?B?NjhvOEFKbStYcGFMOFpxclNQRlFQVURRdzZzMWcvK2hENVB2eVFFSTY5dXZJ?=
 =?utf-8?Q?ttVkeJV37PfE68uc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38084208-6db5-434e-1dd1-08da4a0020ce
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:09:23.8274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GjihrytaKVKG5NhxJz89XD2ajBLsao0NMBsyx2pT0OJdckt9dBBqKzwwagwIh5RExYe+djOpqFTAH7IAS8LMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5828

On Thu, Jun 09, 2022 at 03:39:33PM +0800, Xiaoyao Li wrote:
> On 6/9/2022 3:04 PM, Tian, Kevin wrote:
> > +Chenyi/Xiaoyao who worked on the KVM support. Presumably
> > similar opens have been discussed in KVM hence they have the
> > right background to comment here.
> > 
> > > From: Roger Pau Monne <roger.pau@citrix.com>
> > > Sent: Thursday, May 26, 2022 7:12 PM
> > > 
> > > Under certain conditions guests can get the CPU stuck in an unbounded
> > > loop without the possibility of an interrupt window to occur on
> > > instruction boundary.  This was the case with the scenarios described
> > > in XSA-156.
> > > 
> > > Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
> > > if no interrupt window occurs for a specified amount of time.  Note
> > > that using the Notify VM Exit avoids having to trap #AC and #DB
> > > exceptions, as Xen is guaranteed to get a VM Exit even if the guest
> > > puts the CPU in a loop without an interrupt window, as such disable
> > > the intercepts if the feature is available and enabled.
> > > 
> > > Setting the notify VM exit window to 0 is safe because there's a
> > > threshold added by the hardware in order to have a sane window value.
> > > 
> > > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > ---
> > > Changes since v1:
> > >   - Properly update debug state when using notify VM exit.
> > >   - Reword commit message.
> > > ---
> > > This change enables the notify VM exit by default, KVM however doesn't
> > > seem to enable it by default, and there's the following note in the
> > > commit message:
> > > 
> > > "- There's a possibility, however small, that a notify VM exit happens
> > >     with VM_CONTEXT_INVALID set in exit qualification. In this case, the
> > >     vcpu can no longer run. To avoid killing a well-behaved guest, set
> > >     notify window as -1 to disable this feature by default."
> > > 
> > > It's not obviously clear to me whether the comment was meant to be:
> > > "There's a possibility, however small, that a notify VM exit _wrongly_
> > > happens with VM_CONTEXT_INVALID".
> > > 
> > > It's also not clear whether such wrong hardware behavior only affects
> > > a specific set of hardware,
> 
> I'm not sure what you mean for a specific set of hardware.
> 
> We make it default off in KVM just in case that future silicon wrongly sets
> VM_CONTEXT_INVALID bit. Becuase we make the policy that VM cannot continue
> running in that case.
> 
> For the worst case, if some future silicon happens to have this kind silly
> bug, then the existing product kernel all suffer the possibility that their
> VM being killed due to the feature is default on.

That's IMO a weird policy.  If there's such behavior in any hardware
platform I would assume Intel would issue an errata, and then we would
just avoid using the feature on affected hardware (like we do with
other hardware features when they have erratas).

If we applied the same logic to all new Intel features we won't use
any of them.  At least in Xen there are already combinations of vmexit
conditions that will lead to the guest being killed.

> > > in a way that we could avoid enabling
> > > notify VM exit there.
> > > 
> > > There's a discussion in one of the Linux patches that 128K might be
> > > the safer value in order to prevent false positives, but I have no
> > > formal confirmation about this.  Maybe our Intel maintainers can
> > > provide some more feedback on a suitable notify VM exit window
> > > value.
> 
> The 128k is the internal threshold for SPR silicon. The internal threshold
> is tuned by Intel for each silicon, to make sure it's big enough to avoid
> false positive even when user set vmcs.notify_window to 0.
> 
> However, it varies for different processor generations.
> 
> What is the suitable value is hard to say, it depends on how soon does VMM
> want to intercept the VM. Anyway, Intel ensures that even value 0 is safe.

Ideally we need a fixed default value that's guaranteed to work on all
possible hardware that supports the feature, or alternatively a way to
calculate a sane default window based on the hardware platform.

Could we get some wording added to the ISE regarding 0 being a
suitable default value to use because hardware will add a threshold
internally to make the value safe?

Thanks, Roger.

