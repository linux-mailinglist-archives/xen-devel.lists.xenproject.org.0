Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9EE722C34
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 18:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543802.849074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6CkO-00037Z-Kk; Mon, 05 Jun 2023 16:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543802.849074; Mon, 05 Jun 2023 16:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6CkO-00035t-Hj; Mon, 05 Jun 2023 16:07:56 +0000
Received: by outflank-mailman (input) for mailman id 543802;
 Mon, 05 Jun 2023 16:07:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6CkM-00035R-3h
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 16:07:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d1f012d-03bb-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 18:07:49 +0200 (CEST)
Received: from mail-bn1nam02lp2042.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 12:07:22 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5745.namprd03.prod.outlook.com (2603:10b6:303:99::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 16:07:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 16:07:19 +0000
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
X-Inumbo-ID: 1d1f012d-03bb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685981269;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dFUzLf+TIvv8kcHkgUNNKXnqQz02UFhCuf6tsURbiR4=;
  b=guzxKl6DN85NqJjv5ahKzX7JAu3y0fhc0zetN6/JTTkH4V3HnxKyYULU
   Sg5fh2ggPBM9K204CCuUGgo52S0FAXzk/MncveJGwkk4m78yMkZe5ZgIO
   +G2Vh9ndiybiO23JXKhrGwwRc/pYRRDNXNG1NsRFMsff/FSaA0bJy3U68
   I=;
X-IronPort-RemoteIP: 104.47.51.42
X-IronPort-MID: 110973800
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cOmNaK3e8LWA3YOfavbD5QZwkn2cJEfYwER7XKvMYLTBsI5bpzYGy
 WAeDDyPPvyMZjCkfYt1bImy80kGvpHWzddnTQdppC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJmOagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHGV2s
 twmCWA2bSvb3e+V2auqRstgiZF2RCXrFNt3VnBI6xj8Vaxja7aaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqui6PlmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqjCd1JROXgnhJsqF7U33FMFRIJbAKU/r650kusXfAFN
 2VBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQN47sM47QxQ62
 1nPmMnmbRR0q6GcQ3+Z8raSrBuxNDITIGtEYjULJSMV7t+mrIwtgxbnStd4DLXzntDzASv3w
 T2BsG45nbp7sCIQ/6Cy/FSCiTT1oJHMFlQx/l+PAjjj6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQ41d3X931xBI0KeQL0=
IronPort-HdrOrdr: A9a23:yTHtqK6rqGETofNNIAPXwdWCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6H4BEDyewK6yXcT2/htAV7CZnidhILMFu1fBOTZsl7d8kHFh4tgPO
 JbAtND4b7LfCZHZKTBgDVQeuxIqLfnzEnrv5an854Ed3AUV0gK1XYcNu/0KDwReOALP+taKH
 LKjfA32wZINE5nJvhSQRI+Lpr+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd8gYCXyhJybIC93
 GAtwDi/K2sv9yy1xeZjgbonthrseqk7uEGKN2Hi8ATJDmpogG0ZL55U7nHkCEprPqp4FMKls
 CJhxs7Jcx8517YY2nwixrw3AvL1ioo9hbZuBKlqEqmhfa8aCMxCsJHi44cWhzF63A4tNU59K
 5QxWqWu7deEBuFxU3GlpL1fiAvsnDxjWspkOYVgXAaeYwCaIVJpYha2E9OCp8PEA/z9YhiOu
 hzC8P34upQbDqhHjvkl1gq5ObpcmU4Hx+ATERHksuJ0wJOlHQ89EcczNx3pAZ2yLsND71/o8
 jUOKVhk79DCuUMa7hmOesHScyrTkTQXBPlKgupUBTaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dnXIuenjpFdaF0PRwg1HwqV2GLHbQI/xllt1EUuWWfsuuDcTDciFhryKYmYRdPiWBMM
 zDf66/AJfYXB/T8MhyrkvDsqJpWAojuf0uy6cGsm2107L2w63Rx5rmmaXoVfPQOAdhfF/DKV
 0+exW2DPl8zymQKwrFaV7qKjzQRnA=
X-Talos-CUID: 9a23:WRf7522ldy5oGfMPaxYct7xfB8QdNV3j7SfrIHTgU2tKUaSERX2c9/Yx
X-Talos-MUID: 9a23:LrthSATVx6rtx5SKRXTvwyh/a9pn/J33Jx9Kkc0Dqc+mbzBZbmI=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="110973800"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTEjHH4Gg0o4tNE6IqMA0P1flyAX2BVNjW6Ksnkrc+k5bFwzLiuTuJfcy2l8LMSc2vRZchQwRMlAeLVbd3sWp0w7IzaAYowp87lotRzcwPG9LQBencYRtfxe1fyS56PESCF6RmHGdhJYsraPVtf2ApM2JRMzjVy8dM1IsbjFzRABsXN14+EQK3aGPoLaGsSGnkz9es/RBlLd8kwcaiECuJdH42Sq7yU62EwJDPNbatRnWw0VOs14ot6hVjUbE7M9UeWFj7uY04djQpyrsN4VORCuuShhXf11XFRAXk6LrVkC2KBzT7+A4pRb5OXc0kxq9xSYbY2Efu/CDq6A23QZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7eg8/yKrb/adfBAvsZCiYR/nvdSQdZgqyg4qN4NBbU=;
 b=FZvHYB3eL/LUDuKaevwh8/uGBpGgt7gbdOV00nM9c+Amjuby1wgy4MBTw5pr3hEOxVNj1YIiluqi4WkDTRH8ggLGEZfsty7FHhgNaVn1sLjWL847uGDulJ0Nf/0UaRqDgUpYkkN2OcFV2Nw8y1oYPEc6ilohvXqyTMaJsc+8aLWYakVxx10VHxqaStapQb2zynegZzlQ6B7C2XV1jkGusXH5Gi1dLLrHcbhEMzx5CAu6KmqYgz2O9fscZnWmi+vjp0c5OtlUvoxLQd3ABBKhdS12iFP7CFETiatlrQQEcMmVtIuEFlj0Km8XxlRe6vuYJfFI7pO/UuEqxFiEpWbwxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7eg8/yKrb/adfBAvsZCiYR/nvdSQdZgqyg4qN4NBbU=;
 b=MTfMsLhLzTlkhA1ntbifePT42uXGHxPJLGW5r5QKjdetAju7m0ktfgpT72nrxMPx0GDOX08GmHuu1Ij6zfWm99Khx1ORCQbDNkBr+r5E8q8Yfoq3eFnbv0++5lDCCzYOVlIigCRrzQ7Mbk+SvkAXLNgOJ3UFYPXzlqLgcAMHYPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <610e9c61-f503-8cc0-23b8-f4b2cc4553e9@citrix.com>
Date: Mon, 5 Jun 2023 17:07:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] amd: disable C6 after 1000 days on Fam17h models 30-3fh
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20230605151036.18085-1-roger.pau@citrix.com>
 <c0c4142d-586f-09be-b2d1-502be72e7968@suse.com>
In-Reply-To: <c0c4142d-586f-09be-b2d1-502be72e7968@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: e2aa9e44-f0ac-439a-f9a4-08db65def07b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	poBDn14kUdbZm66PLgXz3q0snOP2FJQZfjwE47h8LaR7nqJLMby0lBlonQB2tiCv2AVPcQiRPPSsnfuxrbJsa53gYaLT/Xxohfw3NaoO9+StU7ICH1KjeK8+jRd0lR4gszhO2oIofEYJ3GTSkqoUVc/NlEjpt4N29hISRGcm+yk3mPC3zuFv3STUhaEOMh1G/Jr32DUoW38Jq2g8+h6IoswoKBT4d/9MQibJwHYIcfzZsDBd2nNN7inw8ogOBj0olaT/nJ0Vlvytj0T0avE3msYZaX3P8VxeZbSwkRfz3I0bLu4rzuF3neKF5NxjQfi63GWxUnDTrI9um8YEPcWn23lkt8wVSpptpie6VBDDKJa1nDIXfUe+9UqK2YtdowDLCGlxFq+vysDm7YUkQuD6yyFJJ+ImKcjIZ7K8Aorxzo4xSf9GEbqHf8mJxCbxKvOBuvLqwLKwzHwWz58RWD0WnQeVkGOxQxWNNTGqtNQVzdCIYBSMtEtLzrwsdLB4WGKxRZQ8gEdWG2lfbMc8MgxP+yXOGhIdJno/0iK4pSPUo5mEf8KDVpUO5BwAgLCztaDFdBSEMArb4zCfexUoIGA9o5Dspvrett6IIrCGJeNFlBFx+2mWcU8CrgecptrS8p9ig+iCx88fTeEFzx8Okp9V3I2t3+stw7jAGZbjpNriWrY360EUtAKc53UylDDJKn3W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199021)(478600001)(2906002)(36756003)(6486002)(6666004)(2616005)(83380400001)(6512007)(6506007)(26005)(53546011)(31696002)(86362001)(82960400001)(38100700002)(186003)(316002)(31686004)(8676002)(8936002)(66946007)(6636002)(4326008)(66556008)(66476007)(5660300002)(110136005)(54906003)(41300700001)(221023011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHkyMitNeDJqdHp3SXU2ZkFsUHpZVzlCd0VQUWh1Q2xTUUR2NFBsc3c2ZEw5?=
 =?utf-8?B?L2lKUDAyampKT0NiWHRjTEI0Tkx5U3dRQmpaMW5kYlY4dWlZenFBZk80Nm1U?=
 =?utf-8?B?clAxSVpzVDdMVnZFckVQMFhablB4a2xKcDV3VjNuSDdDN0ljWkd3dWh5L3c0?=
 =?utf-8?B?aXVhbVRQd2xMZ254M3Rsb2R4TWovaDdUUXh5Rm9qZmJVbldKbTN5TW1HWXVI?=
 =?utf-8?B?bzZOZFlsaThabituTXg5azY3STB5OUVwZVZNRkFPWUJBbXEyWDMrTEpwRzZ1?=
 =?utf-8?B?SmY0WjNKc3NIMEJURnFLRU01ZEN4dFFINjlXYXEvK00vSEE3MEMzNDAzVkU3?=
 =?utf-8?B?Wi92bUpBd2JqSlc3bHFMWmxzQk9oUUFuWnV0eUxabXVXekx4MnJ4bk1iT3JN?=
 =?utf-8?B?OUVBcU1MbU5tdUoxRHhKWmhZNVdkbURYOGx1Qi80NTlRWDNOZEVOT2dMeWJE?=
 =?utf-8?B?dStCL3ExeExZeXRzNCtaaG1PLzkxMFJya1cyVkY4UXN4SVp3K1VoL2s2UHlp?=
 =?utf-8?B?aHhnQzc2N1R6aWh4Z3ZlenYwRTEvWWlqSkoxWlRLNHlxaHpjbFljQ2xQQU8v?=
 =?utf-8?B?M2tDUklaeks1dU9XOEM0SHU4QW9pclNzM2ZSa2U5MUtNeXZPNFhPQUE3Qzg2?=
 =?utf-8?B?SUVEaUtIaWNEWHlBMFoxN1J3MmNWNG10ZWlESHprbk50VnhqSndDREhxM0Yz?=
 =?utf-8?B?K1RFSW54TmdVd1B6Tjl2VHVYMjl0Z1kzZko0dzVGcElEOXpkUEdWZWlPZzJB?=
 =?utf-8?B?RzR2eVpwWHNKVEMyT1kyR0NBeEtqeDZ4RjFXQm45bDJ5SStqdVN0UUJnMDNr?=
 =?utf-8?B?SHkyYWcvRFJCUUlsTkJrcGtxRlNidjdqRFE2RzJsOE5XaElHK1hiVmZFTGZJ?=
 =?utf-8?B?RU56Y1JKdTE2V0Q2R1FEZThMekhEVm0rSnhoVm1QUWNzNmRIV09ObG1BTk0x?=
 =?utf-8?B?by9QZjAvV1BjYlpOWEEwbHltY25oZStXUCtQWjd6U2lmalJRMXVBYXlaVGVw?=
 =?utf-8?B?T2E5amF5NWpESVA0V0JoaGZyTWFjeHpJUGZsNjQrS1VWdXJJL3ZZaUcyaWZY?=
 =?utf-8?B?YkZINldHUWVhWlZ6MDNUV1BrUkkxRS9Ea0liMHk1Mm44RnpwK2d3bHQyeHIy?=
 =?utf-8?B?QjNaK2l0enYxMFF1M3RpekorcFRhUjNZdWlWMGVwTG02QXFUaEI4S0VYTVQw?=
 =?utf-8?B?MkplM3AxVVM2R1kzNlVlQ2Y5VkpOWTRPV0lsaGQwVGZHVzk5eXhmQWQydkxJ?=
 =?utf-8?B?Qy81eWRhVUh3eVRKU1J2Z3o2ZkhxR3JveWZOR0l3NXh1K1hRU0tjTWU2Tlhx?=
 =?utf-8?B?SE9ZanJidTQ2OC85NWZxV1BKZHI0V3hHQ2dCNTJBTU5jYjZ5R1JLeUUxUHpR?=
 =?utf-8?B?K1Y1UjlNMVpCZkR6QURwNU9NWE9OYkQ5Z2Z5V0p0SWlHS3BFaWJXOWFDVDI3?=
 =?utf-8?B?RkIrMFFnNXV5enlTRXVEUE1CSkZ1RThKRlhTL1h3ZUIxS002T21CQ0QwZXY5?=
 =?utf-8?B?eVFXZFNqbGJzeE5sdmJaT2JQdG1XN3dWZ1djdm1IVTBPMTUyeXZuc3pWNDNm?=
 =?utf-8?B?ZjZNakxvVkxJMVhaT0JWbHd1UzI2cHN0MWRaUTBSWXZIVmJjYUZkTi9udHVS?=
 =?utf-8?B?dFZSMGc5ZmtkdHRqUVdjYThUc05VVTB6eGwyWHg5UE9LN1RHQVVJUUhzZVN1?=
 =?utf-8?B?RDlTSDFzN3Vaa3JwSURXZGpXajNUakFTaFpHSTFFRm9na2ttbWtKZnJGWUFw?=
 =?utf-8?B?bWRGQjhiMmhPWHpReGFGa3JWUGpqYlc2VGJtTFZKSjFybkoyY2t2K1lnTG56?=
 =?utf-8?B?TmN5SUZmVVIvMGFQQURBVjhlQ2g3dEVRZ081VTBWS2U1L28zNUhydXlYbGxH?=
 =?utf-8?B?dUpyLzJpRDY0RmFKeE1vUGVMZ2FZRGpnRkMzWmhhTjFzbHFIZlJ6Y2UwaVpu?=
 =?utf-8?B?a0gwUjBzWmFISjVGaWdxY2tUMnh6VjVnNGQ4V2Jsb3RxS0ZUZitURVVnM21Q?=
 =?utf-8?B?YmxyNXpVWDA1N1JGemR4K2R3M3M5b0g4c0NtVytpbTlwa0ZaQlRGSjZ1UHJu?=
 =?utf-8?B?YjVRNkJKSDlwbTREZU92SC90K1BYR1FtNHlzeERSdmRsc0NiVjd5OEhrMXpr?=
 =?utf-8?B?UHA5VHF0V3pOQU9iVDMzaGhjcDBSSk1iRGJYd09kTVB5clMwc2RRRUg2Skho?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O3cQFl1W7qbmRjZSSdPACePNp/lxGcmfhp82PLcYx2jVKUfM3Q78KS3HWCJXT3XhkvkOSE9EKZJrOt/P091BMleNVNi61o430dm9AsXwqzpCAZTh4ut7kHaXRyRbg3Xjx25hnotVcbgg6PU8cTHuPD299zRS/D70a0V9jrc2NV99nEP5xLGlQJyjHRY8pA3FTANSICOoCg5JVLbLQgz2LdJzPgg7uHjdIogEDGgnaDiXHKs7hEAXn3148OG266DinMphEzA/5IcCDxJfprDjRFNzRCXDuQCMAyAZp2Cw5TMzxflX2rVwZ4ANqbILCxn8awkBZVxtdFuf7+JGkbSU2VSEQ+7V/jZb3mo9fj8KWColAoj7Kmp4B3ZSF7isGy/QfbQ/eSZkIKDn8epOK5sSrHlCTmeJqjh3o/0Lbx1ARI694Ex3OcSC1WIsgNERQ0nS2ITGWlhCc3OQ6SQDM1aeKJsvgaTvAuBrIXeEhlXtHZnkFqMhnsY1V/4ntBDI8R7/9IBLbiS46DEUZEhSPgSbXQGf2EUnlAuRAt/lawCAmYwnFcQ3eyrIQrbE1ysQGbaKH18Xw2ceIUAjVENiCp8ns98ZzQmOdxWM6QCT609RvXKir7L6Z9pB6NiIC0UG2fFIfm1ug1WUD5yxlFnyso1/n1yMYdZ1DJ7X9jGdukO5WuuYq9a2AeDPie4NRAMC9aOzBprcLm+JbYcojrCBTRlLPXcbDhKRHCFgyPnHWPaxXHT/eEETt7999g1sTbQAkKqcmfkRb/4nE9dXctNDFeAptjBsxFEhh1JvHgH2POBX3gLEaQ5vQxEXUnUa4RdVJli2Qu48kyUMB+Wb+Maveo+kUFIdxA+ZSApU438ccVL8Eys=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2aa9e44-f0ac-439a-f9a4-08db65def07b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 16:07:19.7657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIhSYcVCPYpixBKHuECXXx+7mQgvANNYx5MmPqaZTxifTqg4ptX5qu792F5cXZw3N7EuAIVP5aCt17hAkSUunzIsXFcgoRXFZngxlztrFkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5745

On 05/06/2023 4:54 pm, Jan Beulich wrote:
> On 05.06.2023 17:10, Roger Pau Monne wrote:
>> As specified on Errata 1474:
>>
>> "A core will fail to exit CC6 after about 1044 days after the last
>> system reset. The time of failure may vary depending on the spread
>> spectrum and REFCLK frequency."
>>
>> Detect when running on AMD Fam17h models 30h-3fh and setup a timer to
>> prevent entering C6 after 1000 days have elapsed.  Take into account
>> the TSC value at boot in order to account for any time elapsed before
>> Xen has been booted.
> Models 6x are also affected as per their RG. I have some trouble with
> the site, so it's too slow going to actually try and fish out the RGs
> for the other possible models.
>
> Given more than one set of models is affected I of course also wonder
> whether Hygon CPUs wouldn't be affected, too. But I realize we have
> hardly any means to find out.

I'd say it's more likely than unlikely, and ...

>> @@ -1189,3 +1190,44 @@ const struct cpu_dev amd_cpu_dev = {
>>  	.c_early_init	= early_init_amd,
>>  	.c_init		= init_amd,
>>  };
>> +
>> +static void cf_check disable_c6(void *arg)
>> +{
>> +	printk(XENLOG_WARNING
>> +	       "Disabling C6 after 1000 days uptime due to AMD errata 1474\n");
>> +	amd_disable_c6 = true;
>> +}
>> +
>> +static int __init cf_check amd_c6_errata(void)
>> +{
>> +	/*
>> +	 * Errata #1474: A Core May Hang After About 1044 Days
>> +	 * Set up a timer to disable C6 after 1000 days uptime.
>> +	 */
>> +	s_time_t;
>> +
>> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
>> +	    boot_cpu_data.x86 != 0x17 ||
>> +	    (boot_cpu_data.x86_model & 0xf0) != 0x30)
> Perhaps better ... & ~0xf, just to be future-proof?

... this wants to follow the same logic as for Branch Type Confusion. 
See amd_init_spectral_chicken() looking for STIBP.

It's very likely all Zen2 models, given that it will have taken nearly 3
years to be discovered in the first place...

~Andrew

