Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C326F842F
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 15:36:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530362.825955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puvbk-0002zu-Cr; Fri, 05 May 2023 13:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530362.825955; Fri, 05 May 2023 13:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puvbk-0002wX-9y; Fri, 05 May 2023 13:36:24 +0000
Received: by outflank-mailman (input) for mailman id 530362;
 Fri, 05 May 2023 13:36:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XVLi=A2=citrix.com=prvs=4822586d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puvbj-0002wR-BI
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 13:36:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0ab8697-eb49-11ed-8611-37d641c3527e;
 Fri, 05 May 2023 15:36:20 +0200 (CEST)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 May 2023 09:36:10 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6673.namprd03.prod.outlook.com (2603:10b6:a03:398::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 13:36:08 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 13:36:08 +0000
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
X-Inumbo-ID: d0ab8697-eb49-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683293780;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aTwukeDh98r/JtbIfsvOG1co2CDLfI3A8dC8ocd0cUg=;
  b=AkNpv9sxBIjphBuj+NBMP9SPhaVEdAUkiWwPqc+Ng5p5I52MCSgOv2Wv
   nVwixYfDJvH2Xc45YpzbwytGQbRiOeOQQGOJiaNxGAIAuCWNxqqLHbE/b
   n0B3wRKFsfancdaFZXMvLgh1de0Sqw6nN0Dckf6WIaYE2d+VKVDnMuOVY
   E=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 110447861
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+ranJaAz53owRRVW/+Piw5YqxClBgxIJ4kV8jS/XYbTApD9x0TdVm
 2MeDGrTPviJYmf0c9skYYXg80hQ6sWHm9VhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw1epQWURQz
 eMkGR8nRC6B29y5/++2Rbw57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xruQA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37aXwX+kCNxLfFG+3txgp0+UzFINMzcxe36fvfCIiEGgVPsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBqW1qPe7gKdB24FZj1MctorsIkxXzNC/
 kCNt8PkA3poqrL9YXCA8raZqxuiNC5TKnUNDQcUQA1A79T9rYUbihPUUs0lAKOzlsfyGzz73
 3aNtidWulkIpcsC1qH++E+dhTup/8LNVlRtul+RWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGS0bYJHd3X5ywmQxg==
IronPort-HdrOrdr: A9a23:2wCszK4x0xaVxNEm5wPXwD7XdLJyesId70hD6qkQc3Fom6uj5q
 eTdZUgpHvJYVMqMk3I9urwWpVoLUm9yXcX2+gs1NWZLW/bUQKTRekIgeSN/9SKIVyaygcy79
 YCT4FOTOTqC150lMD75xT9PeoB7bC8gduVrNab9mxqSw5ybaFm8kNeMSa0VmNLZCQuP+tCKL
 OsovNdoTyuYHIWadn+PHkKc/nIosHHmPvdEGc77zhO0njzsdpt0s+DYmWl4is=
X-Talos-CUID: =?us-ascii?q?9a23=3AYDGd0Gijdo9H4BzkpZSATFjVDDJuXXH6lFLOG1C?=
 =?us-ascii?q?EOElDYoOXFWGfx/5pnJ87?=
X-Talos-MUID: 9a23:Q6CEcQYo6w92meBTlTXLljZoCtlTyYOALWQRmKQEtNeLHHkl
X-IronPort-AV: E=Sophos;i="5.99,252,1677560400"; 
   d="scan'208";a="110447861"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+UqyigkdsytwZkYLZn0zoyFmbgEMsh8CiXAyeOip4eNDpnBuP6Sfz67ovI/h6BbKPeak+lf69oiFZoIQJdXBLjh7seD7PLI89Ywct74Dtdt/a6yfZsIoZ+8Lr+LbnU/dt0vZIB9+0yT7EjvHg9vGjFwTMfrhjIoUr9O9QfmDqMvI63yDvAVDVPeCxI8KwwqM3Z3Nbrdi9aAvjRQLjPO9c8x8wUeQ1wH8rSWVX97+J97v2X3iXGKBchQxUuKHiBLCT1YXDtTJlgHEK3O0dTyrBrIj/o/GMP+U2ra/TyFwt7DzcvTAjtXoVpPzwzBw5jUDx9Q9mzOeXPAEEUOKeFcKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgDkydVTkHtXCOHYGpAUhRwTNDLOWQG5oFcoYqgo3C8=;
 b=c2wPqybdovOExTebKFN+r+wZSeiFuN58g2iER84E+Dq6osX6PAE7vUJJwb3paZZdeemN+zSNxZHRNFT7t5RE7NxMKXfF9IVo/vDCYPT1X176LPGI4lxoGYtzQcukevLCMQmna4gCK8PAQRmNJAZeWCYXFvrVtdqnjqqp3uKR0PsnB9k6MlRwFo+kMnd4XfDfXYkBDB/Z0b7bueuiJR5eyzWiVk1RtHeixpoDzveYLJyOzMHEDU+ZeyH9FswXToqaHEtyohYckvlh+iZMFWdkms+/x6SNYOMlsXcTvH74CxBpnpYOv5uc7IInK2gipjjxyOU20rm0VWlmn8q7Jjr3XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgDkydVTkHtXCOHYGpAUhRwTNDLOWQG5oFcoYqgo3C8=;
 b=XSbQKeJOVbnLLda7NDFPgQ2C80SI3vY1sbYKpwxJOYSG9t9PbPeWtcztezEt7Etbd6cWg09NjoOksl6WH+mdMS9mV0r2paM+srYbBVy7LYGFwAeIfLqn5cPGnwymIs/Ov92ysAhasok18kyA63lQDlfvbuRtaJP5CCF2yCBQoPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <df25cf9e-cf90-030a-91eb-6ee16b7b4dc7@citrix.com>
Date: Fri, 5 May 2023 14:36:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] LICENSES: Remove the use of deprecated LGPL SPDX tags
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230505130533.3580545-1-andrew.cooper3@citrix.com>
 <20230505130533.3580545-3-andrew.cooper3@citrix.com>
 <40d70f11-37e7-ff29-37c1-a94d3e286455@suse.com>
 <8fa2cf23-4832-a033-cfc3-e3225eff0047@citrix.com>
 <ac1662eb-41de-baee-45a0-db01b2141692@suse.com>
In-Reply-To: <ac1662eb-41de-baee-45a0-db01b2141692@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0082.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: e920757b-65ff-4eb6-fa8e-08db4d6dae96
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	INs1AL5LAZ+sZ/IxKrFl5NVtE4/40ojjkIWmIqFg5IrLvqs1vlrEOyaLnzGZKoW0jrEssQNiqu9bizCNQKVDs+fwqahggq8fScyUU/72hCZduLKEPRAtjsPLFxkqlLaFO5DpDTMhXu0HdH2qA1EkWIkoevoeigy38IxawfzSJScogaTK+DQmE7IhniM6pvqnjQJxFT2QxMsgJbcRztmNXglin0GaR5m9tFqZmb+ji+N+wCs48RT/ik77XpdnNQ4ghrzwF3O8yyjCH8kwRoqGVe8eaTVCwWOjYXuORoxcZvZHt51o6rzzbJyfgd7Z34plKZ9Xvx+KI0OKiPqoKMx8l60/B9SjTdPWlQZG4Ar5jBtoXLcIxYbVozF/ErnN4uw2gtqlzGdOKzyh3ybOUMDXorYmFvWeHc3Yls3D8189HPQ+nGehDrWnf7EYnM+6SlSma898aVvpG3mFU6RDVlvxV1DzRZqoQnaLhOBATMfnX2S5bJLTh7OGEO1eTgQqMkSGmJXKgYcnwUkGAWNdW3h+Ha6fQsZYnTBKPF9n3ZxyJ4wc4roiJAwebdO3+WG7IBvnAqNODGq1lNwCvtEBIFbnj+e+R0EqOGmNn1d5b2BsMrXFPSxrfuz0MVaAyuM1Gp3vGV0+pc8a9Lj1uR2q0m8btw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199021)(8936002)(966005)(26005)(6512007)(2616005)(6506007)(8676002)(53546011)(186003)(82960400001)(5660300002)(316002)(66476007)(54906003)(66556008)(66946007)(6916009)(41300700001)(6486002)(478600001)(6666004)(4326008)(38100700002)(36756003)(86362001)(31696002)(83380400001)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUt4WGpSTEZhSlAyZm9qeWJxdmdMR0hkc0w1dkpwSjNraXlwRXNiOWRVT1dH?=
 =?utf-8?B?SnVhb3BzRFhXajFvNTJldGhFTE1kNmprcnZmakg1OUhVV0NLQXhTZUovR2Rs?=
 =?utf-8?B?eWhrWHhGZ0dUUUhSc0xYK3B6V2d3SVZDa3lPMHlVTmdWSlhjZnFVZnhSaDI1?=
 =?utf-8?B?QkpEakp0SW5mVjBZTGdsbjRTZUJwaUptOFdJU3FYWnBzQnZYUzdjLzI2Zjl3?=
 =?utf-8?B?dVVkd1F5UkpZSmdSNlUwM1NMaUJIWklLRzB0QWxybyt1T0U3cjhTQmRLa0h2?=
 =?utf-8?B?T21BVnhSMmJtM2VqSlIxS2Z3Ykp2WnFGeGdLSWVHWDVYUkFBbzdBdkdHZ3Vy?=
 =?utf-8?B?aWdGTWNPUjBFUVYyVDQ5K25LODUrSmdIYlJJOVIrakhOcFArdTkvL21MYnlD?=
 =?utf-8?B?T2xjZDFKZ2ZzZ1lxZ1ViK2QrdVhSOUVSSTFXblk0a2dHdU8rSzkxcSt3TStp?=
 =?utf-8?B?aDJUQm9hekIwbk9HM0VNR1RyUmlUOFp3Sk5uM3ZKQnVzYm8vYyt0amRMRjhR?=
 =?utf-8?B?cklIbGhWK2ZVMHBSdSt1Q1Z5UG5haE5QTWlLdkE4UnMzeHd0S3pUeW5VcFQv?=
 =?utf-8?B?UEl0d2NiZVNqZmUxcHhwd3R6UTRIV0JRdjVoY3NIc2ZlbzB6by9FN2NGdE9U?=
 =?utf-8?B?OHNPWmlhdnUyeTdHRkpUTXRKa2VmWUhSSXY4eEZLd2l1dVo2SitWS3ZKNE9J?=
 =?utf-8?B?c0JwaFVWRUdiVjlKcStnYUczNjBYUFBVRHJlWmVYb3M2LzZidXRBaVZiSEdR?=
 =?utf-8?B?bzllNVJHcmVqeGhvTjBieGNRSmpOM0cyQk1kUno1MlpDNFlOQ2FxbjRvdUw2?=
 =?utf-8?B?Q0lFOU54OUdoYWc3S2JzYm05azhRb1dyeWRkY2QrRDF2aXhwaEhVU1o2cnBD?=
 =?utf-8?B?YjBpUzJZMy8wNGFQZU11WktsdzE2QVNpYjJGQndFZ2hxQ2g0eWtUK2pJK1Nv?=
 =?utf-8?B?WUQ3YUE4MXRUQkR4V09CWjkyRlFoR25uNTNuMVQwZ01SNHdnL3hhZW96d1Fo?=
 =?utf-8?B?NDdnOUdjd1JDNlIySFBJYmZ4M0NORU1WSFF4d1lBdWFLYy9LTGZvQm52Ykpv?=
 =?utf-8?B?US8wc1FwT3VaRDREc24xelQxUnBZbnB2aHovTnhzMCt6S3Flc2ZDdDEvQWhv?=
 =?utf-8?B?NTgxbjl1OVI3YkZURThKY253M3llSWpEL1R6bHpFWEI3bUZuOEh4UEN2YUJv?=
 =?utf-8?B?YzFRSTJyQlJRTTJjZjhXNE14YVNBZEVRRldYek5hSEVjR3BzWGFhbnM2MWRu?=
 =?utf-8?B?Q2VmMC9hV2xrWlRIbkdFSHJseFIzOW1xT0oyRkZmVkVBUUVZdkd2d25MM21V?=
 =?utf-8?B?eWNWbXhPdlMrS1JDVVR5MnJpTk1kUmVydG1ERlV1a2xWQ1lmampnWDJsczBo?=
 =?utf-8?B?c3kwWEo0bmlXampxemxxRU1iTjdscGJRYytEL05RaXd0Zmduelgyd2ZYRDZJ?=
 =?utf-8?B?bzJtcGZZa1A4cC81ZHY0VTRjZlBhcmRWblB3R2UwcXd3WGIvbnVYaWZVVmNL?=
 =?utf-8?B?dzhQbXFZdjBkdVhlbU1VdnFwcWhkdnU5Y0dXaHJCTnludllWbzJZYU84RThI?=
 =?utf-8?B?dExUZW5aVTlFcGZXVUVxalZNejdPNG4vd0hlWStFNCtKZU5HejdjSmpYZ3lw?=
 =?utf-8?B?YUdMSWdFdkxnbExtSmFpcjJvRk53NjZRN01QSVMrZkJaaWc0QlluZXU5NW00?=
 =?utf-8?B?bGlJNFcwMnVFdmNkajhRblMzYkhqRGNqcWN2N3loeUpDNmJYRWErbHB2SzRh?=
 =?utf-8?B?OFJYNnY4TEZKQVF0cG56cjIxNkxZWFpCYXhjdjBYRVExeEhWZTFMbjZvVURQ?=
 =?utf-8?B?QXhuZXV6TlQ4Nml6N1hhWFZ4WC9DTDBnMlVhRzU2VjlUbk9QcGgvNWg2djVN?=
 =?utf-8?B?UGt2ekR3YjRmaTN1d1hvKzB6Q3pwR1E5ZWNnSXFwakdBSFJnRUx5SnNGQm54?=
 =?utf-8?B?M2lCclZrRHFEYllzb0QrZ1pNNm5GTzcwVmZFakgrYzhlRCtrVS8wUE9TNFYy?=
 =?utf-8?B?NldBZVdTNlhpQUhSaUp0c1cwZWx3RERoKytaeHY3MGtHa3pBYjVlQTNpNEV1?=
 =?utf-8?B?Q0owMWFIdEFmRUZiTzVnTFJoUjgwektzMU1tUEU4UjFtSE1LYkRJcVVuUWZi?=
 =?utf-8?B?anZxbHFXTXhtTUljZGlRQTg2NHA5WXZVaklrbEt1L1pNNDNrTHRsQ1gzYkQ5?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IsllrZDxOjXJGTIn3EdzFwhDgFnFSoxYcEVAjeAWV1yDi8ZRKDGrZuuhXqfhb1wf/gitPqJX4UXZvrfeoRflq3pyvU896TehEE9aKQ1gQIvvj8fumYXNW/SHi+cPlDrhHrCBNtngcqWEbJJQRTk57HNGkE43MAZ7YtvOdfjRA1XThLi3Jogbt42nSfK6Q8W2a/A5vaBjsqaQZ+robydSaR6v3gInBVVnHvLztdjNBgX/1J9U5vvg1iAJRwl0tSSpcxm0s5kwllEJ55QeMSC50ebDALJPHANGFYAFK0ucpGTSJJngKKm3cq9W57vLCVMUlomSnFktHIIXVeSBvLh9hG6ciLwc0gRCzgWqLmo//4WbdojLRtesEltsZ3FE51aqtwraYv9gbCbQ1AfSc0YvFafAC0dwoge43aYXJPs4nE5HzygNmzYnt7vPv2bCkb6EFZM2Hu7PwMn4cBHdYZs3tKXT1kzCPrvMjo1oyIx1dw45DSgldRCQn6w7lHFW9wYWmt3QVPYtpJqxkNj4GSXw9Eq3yQm7gkYXddAys88QMILm9+1yt6Y0JtBXAolVpaKc5gHYhdYWGhoLxs3SgNP6vUcvCiPEIknxNiNJHAR5K/g2e5Tq81IElJ+Ys4f6ayyAhH2DAwhJ2Mn6cNz0Ohu5Ae16SDU+TYvhkINBb1LM+6eOaMvTGv3pyceFZqjVKuqxRxt+M8QioVMLw0fn1G/D134oSI5ybelFSbIhB4dSlPR5KR46isE079hSkHefqBySSpY+lLKritA45QV1qoCENvEBuMRWI+7R5DY8Eay3T+EBmS8gVUfQJI/xNUDXjerR7iytYLeR+MUDkm5LM4qf70yfmcwCmWllXnzmWdnkWZ8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e920757b-65ff-4eb6-fa8e-08db4d6dae96
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 13:36:08.2338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8S133c1BZPdnfbVPik+rWgrJQYDh+vPh2f0QM6e95mIQr2UO+sKhZGIfTNeEz+ueqjFoCFBiChGXpuTUrfzEa60xVVeZmu+yBfmyDTqD5Sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6673

On 05/05/2023 2:31 pm, Jan Beulich wrote:
> On 05.05.2023 15:22, Andrew Cooper wrote:
>> On 05/05/2023 2:13 pm, Jan Beulich wrote:
>>> On 05.05.2023 15:05, Andrew Cooper wrote:
>>>> The SPDX forms without an explicit -only or -or-later suffix are deprecated
>>>> and should not be used.
>>> I guess this wants a reference to where this is specified. In particular ...
>>>
>>>> --- a/LICENSES/LGPL-2.1
>>>> +++ b/LICENSES/LGPL-2.1
>>>> @@ -1,5 +1,5 @@
>>>> -Valid-License-Identifier: LGPL-2.1
>>>> -Valid-License-Identifier: LGPL-2.1+
>>>> +Valid-License-Identifier: LGPL-2.1-only
>>>> +Valid-License-Identifier: LGPL-2.1-or-later
>>>>  
>>>>  SPDX-URL: https://spdx.org/licenses/LGPL-2.1.html
>>> ... I can't spot anything like this under e.g. this URL.
>> Hmm yeah, it is irritating.  The statement is at
>> https://spdx.org/licenses/ but only by virtue of two tables, the second
>> of which is the list of deprecated identifiers.
>>
>> I'll put a paragraph about this in the commit message.
>>
>>> Also is there a reason you add Deprecated-Identifier: only to GPL-2.0?
>>> Enumerating them would seem reasonable to me, not just for completeness,
>>> but also in case we end up importing a file with a deprecated tag.
>> We have problematic uses of GPL in tree, where we don't for LGPL.
>>
>> I'm considering a gitlab pass which will reject patches with use an
>> identifier not in the permitted list, and reject in introduction of new
>> uses of the deprecated ones.    For this, the deprecated-but-tolerated
>> tags need calling out in some machine-readable way, but I don't think
>> it's helpful to express the tolerating of a tag we don't have any
>> violations of.
> Hmm, okay. With the expanded commit message
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.  FAOD, here's the full commit message with adjustment:

LICENSES: Remove the use of deprecated LGPL SPDX tags

The SPDX forms without an explicit -only or -or-later suffix are deprecated
and should not be used.

Somewhat unhelpfully at the time of writing, this only appears to be
indicated
by the separation of the two tables at https://spdx.org/licenses/
   
The recent changes to libacpi are the only examples of deprecated LGPL
tags in
tree, so fix them all up.

For GPL, we have many examples using deprecated tags.  For now, just
identify
them as such and recommend that no new instances get added.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

