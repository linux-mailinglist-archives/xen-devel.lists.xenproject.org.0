Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14AB6F062D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 14:49:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527002.819124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps13h-00088e-MH; Thu, 27 Apr 2023 12:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527002.819124; Thu, 27 Apr 2023 12:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps13h-00085e-JU; Thu, 27 Apr 2023 12:49:13 +0000
Received: by outflank-mailman (input) for mailman id 527002;
 Thu, 27 Apr 2023 12:49:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LZ9G=AS=citrix.com=prvs=474adc217=jennifer.herbert@srs-se1.protection.inumbo.net>)
 id 1ps13g-00085Y-EX
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 12:49:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e62e7cb3-e4f9-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 14:49:11 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 08:49:06 -0400
Received: from DS7PR03MB5414.namprd03.prod.outlook.com (2603:10b6:5:2c2::6) by
 MW4PR03MB6524.namprd03.prod.outlook.com (2603:10b6:303:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 12:49:01 +0000
Received: from DS7PR03MB5414.namprd03.prod.outlook.com
 ([fe80::fdfd:97e5:7c55:82d]) by DS7PR03MB5414.namprd03.prod.outlook.com
 ([fe80::fdfd:97e5:7c55:82d%6]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 12:49:00 +0000
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
X-Inumbo-ID: e62e7cb3-e4f9-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682599751;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MowOelL4WY3AnOtRtFAPyjhQBaxNSL96IxypAZPYVLo=;
  b=RcHJnkYBW1r9h786s4HLs5hfI6NZdFdHXcuZelgfseIgNrbh9oouwOqD
   znIVTUFf4jgbYS/gGZA3JQQQgBsboVc4EE1i8DTz9J4ClHlCNmS3Uf7OY
   SpdoKO17GM65gx8HynUvOVk7pgcJHoFBuc6Bn3fw+M+QtfQa6D6BkjQFZ
   U=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 107480919
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:R0fmqK1vc0KKiLH4R/bD5Rhwkn2cJEfYwER7XKvMYLTBsI5bpzYCy
 zYaUGzQPvqKamT1fY8iOdyxo0MGv5WGmN83HQNqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBkOqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfUDsW0
 9EHMCg0QxWOi/jpmb60EPFRmZF2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6Kkl0ZPLvFabI5fvSISMNTn0iVv
 CTG8n7zDwsGHNee1SCE4jSngeqncSbTAdpNSO3gp6c76LGV7jQsSzkGaGG5nfWorxODXd1Gd
 HwL/yV7+MDe82TuFLERRSaQoneCsgQNRtl4HOgz6QXLwa3Riy6bC24CTzBMcpomudU8SCY2/
 lSIg8n5QzdotdW9WX+bs7uZsz62ESwUNnMZIz8JSxMf5Nvuq511iQjAJv5hGqOoitz+GRnr3
 iuH6iM5gt0uYdUj0qy6+RXNhWKqr52QFwotvFyJDySi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02DaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:LXssXqCp9hm80YXlHem955DYdb4zR+YMi2TDtnoddfUxSKfzqy
 nApoV56faKskdyZJhNo7690cq7LU80l6QU3WB5B97LYOCMggSVxe9ZjLcKygeQfhHDyg==
X-Talos-CUID: 9a23:VJE8i2CTskMCh176E3g9rGg5Bdg9S1DYwXvKfBa0BjxxdaLAHA==
X-Talos-MUID: 9a23:srDOTQQF5kBj2DbQRXS0u3JGJPpS4ZiiGWVQrJMJopa0Kil/bmI=
X-IronPort-AV: E=Sophos;i="5.99,230,1677560400"; 
   d="scan'208";a="107480919"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIWum3x6Mp+b/9/kZCaK9Kccn7Eyx/p7DC8O5hOx9rdhSuLMvdqJz79pgb31+qm8ec5efNBlfOq3isNfGXdri9j3B33CkhHBMGj8m93wEZaJFV+nocXQvT+GDNSlZF0tk7wzbYBtdhnGUi/4tOW+aR/bPmtW9odnWeDGbyBt+rJ4qVoQ+FoA8CaiCfDAn81vzwmUdXyneBdFdPqPlBwpNcCQxKzlE+cEYFmCQf8gnVpR/bnCudOPgM72V+WkUZr9qeMkQG0b8F0Z1N6BWYhZbZgv09IrUoUtsNtHFFZMUyv3q7N1leGNWlIQgvAxN0u7euk3alRBusHsa6RXNpadgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWKRVpndLVHinVcMqV1UFuUnAHGkarNRH1V6BXiQHHY=;
 b=Lf0oG7BpSaxXsSSaRCdQABq+VpHZgT6H6Aud6lHrFc6vflGKQhZWXgbDlI84s5lOGVhqD9cXWYisqe8z8aWVPdhi3aZZqMyKaCSqfX5X+ak3Wl8z0Cr1YJLJpXQuYi0v1kZTQn+s2oAP3L4xZb3E0/safIzfKUQF44H1uGBULvcmtTEZ/n/YtJDjK+0mukBVrpU5G3ONyVWUQuirQxxq95NfuvSRCr0AqB0SOC1ka1UUvdW1IJfbsSPS7qaZosUJjBsCXbEfdClsChpwNAfqMRq/rl9TqQME5/dMwDvCLnHSvIy87UN7oC1txkyovKGjp5U3jYpd484784u6F/5qhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWKRVpndLVHinVcMqV1UFuUnAHGkarNRH1V6BXiQHHY=;
 b=PcNjp9kK2nEfOUNRl6h5dwmXmHM/eHaxwz2G1FdKjWwK/K6HFbKgLppVH7uuxju1wAJBIxs6dj5Y6O7a/GiXbTrg+XhCgyfmaYZoiykDwX8RaRrSm3wPucMoTbzxj+auJMwbJoV/CqfPQUoU1LJmoS5qU7J7o8CvQ8DM2MWbUek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <573ebf81-5565-b127-61c1-fc08854c9064@citrix.com>
Date: Thu, 27 Apr 2023 13:48:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 1/2] acpi: Make TPM version configurable.
To: Jason Andryuk <jandryuk@gmail.com>
Cc: jennifer.herbert@citrx.com, Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230425174733.795961-1-jennifer.herbert@citrix.com>
 <20230425174733.795961-2-jennifer.herbert@citrix.com>
 <CAKf6xpsbaZMMFCW3Uw0XZ2gm185iwwtT2H+RcAReFrze9UWdAw@mail.gmail.com>
From: Jennifer Herbert <jennifer.herbert@citrix.com>
In-Reply-To: <CAKf6xpsbaZMMFCW3Uw0XZ2gm185iwwtT2H+RcAReFrze9UWdAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0251.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::23) To DS7PR03MB5414.namprd03.prod.outlook.com
 (2603:10b6:5:2c2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5414:EE_|MW4PR03MB6524:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0c0187-ad5b-49d6-fdf4-08db471dc5f6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d8ZN2rUPNbMLfj8B7h9BftVGi3n+zl62cP1erHv58oZUg4Zx0JfL0XzeuyJ2W8kUFEgu6iOrG4GXpi26+S+RB8ZI98NMm/o6XyT+iZ2eY7orr7q0qYmzsy0g/z+1BWnZP5SwSXeE8SF/XsHaqhXspz6DbSKRCZ5z9gVPaKw9ZcF02qgHkj7k8HFNqRn/OFpU7Cm9UbfoKPSOz1S238B5Tji2a1QwxCzgZ9PMB69LGyk7WgRqZdI+K/SvnxX5v6bOBD149bycHPuMRkH7J//3H6+BqdsoDL8mkPvZVvCh5dYQpv7aYRxCp3NanyO5UmjRKpqiCyfFeMICmiZe2RFwKN4cs4ImStnGRvk3RfBjrwCR8V/ezqwayICUBOJd/dFS8ue4NLFRgF5/lLWIg1aqV+GSxjzWvykFH3R+WxB+bmMHbamPH/vksniP5TPwizX6N6CEavzpGZBwO6ClNEe23Z4PCrj1ZcXeBKCeVxl3sneFRtTi4DhPUkHcwUZFuXnFegiaQkU9c5rsD3xHjzZW1CV7VJMpJKSw8D44uB4zBLnkKhAD4ULDcqxVoVIAPRQcSAsHTSf6H3evrSdNkZy4qILC4FXXjlJtb4Gpe6LLOmWENchdnBEM7V02hE1ETYnxA/Her9M9zU4a7lvaHzhDgA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5414.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(6666004)(478600001)(6486002)(6916009)(66556008)(316002)(66946007)(54906003)(66476007)(4326008)(107886003)(2616005)(53546011)(186003)(36756003)(26005)(6512007)(6506007)(2906002)(41300700001)(8936002)(5660300002)(8676002)(44832011)(38100700002)(31686004)(31696002)(82960400001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RS8vSVAzSnNiU1hMWEl5bHVLN09KMytDdzFDNzFNanRjb3F3ams0UWRtSVpC?=
 =?utf-8?B?Q3JOTmwwK2pSVmVWeS8wQjVZc0FWZXJ6MVdZcnI1K2JwUlRaNWVuUmR6T0Iy?=
 =?utf-8?B?NGc3S0R1WU56OUY5LzdPdC9icmdMWmtSUmdma0tGb1ZrTitBQk1FMHV5UEZX?=
 =?utf-8?B?VkRrTStrR3p4cVdMZUVPZWN2NFIzUlBaSW9OdnRhcndtODQ5NnpjWXlmM3U1?=
 =?utf-8?B?UGtlVDFMZHNXZ0grZlloQ2xSTnBKWmUvempTcmtkTG1yQWNzQlNSMjFtaGFK?=
 =?utf-8?B?Q0tERjQvNEpVcS9odjV6ZU4rYWo3WGV6cWRzdTFLZEtLcXNQVGNmUmdGRWtY?=
 =?utf-8?B?MVg5WHVqSng5b2lHbUdBbW40czJ5M2JRU3NLOS9kUTYvc3RFM2ZNK1QyL3R3?=
 =?utf-8?B?VThpUEhZWWFlV3JPdkg4dm1zRWdhQ3N4emhETWhKc2JQSTBTbjcvZEttZ2pS?=
 =?utf-8?B?MXRyL2lkVmNsTzFKb3lmZmQ0WHp2ZmJxZXlmZDdZQXFHd0FHQXZBYXFUSlUy?=
 =?utf-8?B?V24xTjlxMHpEaUt3d0hrb1JPM0RRVmVLdStVWTY5d0RuUkhMaTl3ekpUYnAz?=
 =?utf-8?B?S1o4VTdpclBrREhSQkJkNlFqY0p0ODR4N1JJb3F4YWRVVmRhdDZMaEtVMkdy?=
 =?utf-8?B?RkZKWWlWNmt1SC9yYjdLdDZ3RmpaUnhBQ3pkVEVvdVA0SHFzd3hUdDJrdldj?=
 =?utf-8?B?ZlZ1OS9NZW5DbVAyaXRUVHczZlJCSjMxd1FxS29qY3cwMDRjUlhnZmdPaE4x?=
 =?utf-8?B?eTRlcGNMR29iaHNmbXRGc0RHNnBITDRadmorL2hMNWhHeXRCcldWeXVFQlJt?=
 =?utf-8?B?c3hLT3Zsa21ZQlNwSERUNDU3YVdJMTBndEIwZWxBc01VUi9kZW5RalhZUTl2?=
 =?utf-8?B?TTN2VXlrY2hIcEU0WXhlSFNkNDZpZitwL2xmbUdYWUNGRFVLbnE4Tnkxbjl6?=
 =?utf-8?B?dTBONHhURmJnaHVNWnZUS2szYTMvUTFwL0lZRDhzc2VZU0s5RlhieC83WGkx?=
 =?utf-8?B?c21uNFRJVysweVN3TXY4SVRFNnE3bEhDQXFJZHp4RzFwbEtzbTdvL05VSXJs?=
 =?utf-8?B?UEFsZ3VOWHBhc2gyN29HWlUvb3puMHVJcEhjWFV3Y3hsRmJ2Znp4R2FBamxl?=
 =?utf-8?B?UnZmTnJnU1ZVdFlicTRZVUpKUEw5VjdSeXBoOUVjalEzS0NOZmZtZVFVdmhj?=
 =?utf-8?B?R3p6K3ZYK3JROTVxa3R5WE5DS1F4NE95cHYwRXVWeFlDWnhrVEVXWkVINXdT?=
 =?utf-8?B?T1BWRlpxL3BVMWQrelphUjlEcXdFVzlDNkdWZFpOOE9WN1d1UGprd1ZMdGZp?=
 =?utf-8?B?czlXc2YxWnJXZDhmSUM4clJaRlVhRnhMMlk1azExbDJqdC85SzVRdE5TK3hp?=
 =?utf-8?B?WUVwbkhBTE45RC84MFkwQ04zY291bkg1VTlEdVl6NDhpWUp3d2pXRlFIN3h4?=
 =?utf-8?B?d1dZR2ZaZ1pRTGhNMVFxaGd5ZGUzT3JheUd6dmlDZEY1WGU5TXljbE8yVzFW?=
 =?utf-8?B?ejdScFV3WTJlbHRlYjJkRXVzWkg2bW1abkdpNWpoeFVYY3BvNU45TmNRT1Ru?=
 =?utf-8?B?SzBZOUYxM0wya2lWOWFZdDhXVzhaU0ZBUmlpSVVvUnNIUVozWmE2dEI1NDhB?=
 =?utf-8?B?Q3dHR0RDbTdzSFZCamxpRlVDQnVtb2Y5SG5wZzBKVlBtV29nWmZTS2dpTEN2?=
 =?utf-8?B?cjBLUnlUcE5IWTJrb3FrL1Z1a0orU0xwK2ZLM1FxWHpKVFpybzhnRVR2V3Q2?=
 =?utf-8?B?OHE1Zi95NElTcUZDUm4ydTJ3QmZKcld3d0Z2dVVQeE54ZWltR3JvQUd3cndX?=
 =?utf-8?B?akp5RWJ4L2ZwWFB6RDRKV2dvQWw1N1JDVzVweHVwaDVTK1ZoU0NGOUFaTEtr?=
 =?utf-8?B?WUtNOXJMa081aTN4RFF1R2hMYW5Sc2Fxbk1XTjhhKzFVVkZSU2syejNZSnhZ?=
 =?utf-8?B?OEhjTDhqSFA3cS9GZlBFWjV1YWZzRE9jNFVjUEZDM0gxa0gvbVJ0dVlzS0Fa?=
 =?utf-8?B?U3JBWU16ZmFyNG9jR1pzSGZ3RGw0RnFMZm8vMkVjUFFIckpRaGRsM001UmFa?=
 =?utf-8?B?WjJRSmlCMHRTQUszM05LSHRmQWJsWkRHY3dhTFN0WE5OMFNWQmxWZUgyWm1i?=
 =?utf-8?B?YTl3cW9wU3F3QnpWa3RSbWw2ZzhkWlpQU21RQ0RpZHlMS0dBeW43YXNsVmxy?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FeD9rghYNlPg+Pq7zuK+br30K/dZ0UvwpsYydKlxT3MWZOl48uxYB9SohpZ7MqV+iN/j17p0+ia4r/tMrfLCtaWWUQav/4sH91kn/a2shcNMwmPucNF1c9HCdyfzUk0TIsPhimvX7fVYgv1KBAk+aBdC5zTv+WZ5c7nGX2jJfLtPrWuTn0OrkxUElMZmrQtiLeoVJVbPFle9ZdOsG4qDeJ4adulsrmIij2BWDLdMTEKaQ5CIRdNnkDwWdkB7zV9DA1wruMpczFLVLYe1EqXnujv5WPzENv4FRK1qQyaoeMOyyvMoYaQ+OtKSit//qM4R8nAV9mEI2+5JjGX5F2h5aoQ+Q/eCsFdNhDNn+XKenXPiPPLzolOKuJqJ1h5xqhp3VLbymk2fMvFZLm86TpGJ9qIx14QacIYMABUjau/lZ77EUHJXFOfFk7rbPKZjlVPAidnq/LPvPMK53R6dFgu0jeuoW/q3Fn2xfzZyWxfQJrnYqaVcDdMBgO5ib5H1j8kGckjU4nEtBl9RtkHYnjm2IvCs2QQiUOXnEmzXomzkSMMkHbn0PxcVQ5EjKybxjWJDWnTqQykD+0q31Ae1dWzYOorXlVXE4WpnQ5zuZNR0Q1jI+rLDvZX3waKnIziyC9NyBUson1SrgNgEOnLSvEz8sHow/X6pqmUep50A9qBuxknBRinjCvAWV1W0tBtaP8+1jm+qArOcxxGbdwlv7jFj6zzFCaTESame2mC8hR5SOHwBI3MLY+HzbmHzEBOlfDx59siGltmKGgLf7o0tQz6urXRpLrRN6tgk2NnlP6P1OFlCVmt/3EBCWOfCauDB/qi76iT8hCZrVGNWhi8u37ZWVd11Rgg9ndvKWyqM28+HsBo=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0c0187-ad5b-49d6-fdf4-08db471dc5f6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5414.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 12:49:00.5490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quXx1z2fdz7yU9E52ODtVIzZOM423nKATfv0MxDRPU4P/yGlLSbVtOj9DsQIyweF0VPd0AndV1aPQw+5ml5xyGaFomaw/pKtRGl97ccrN5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6524


On 26/04/2023 21:27, Jason Andryuk wrote:
> Hi, Jennifer,
>
> On Tue, Apr 25, 2023 at 1:48 PM Jennifer Herbert
> <jennifer.herbert@citrix.com> wrote:
>> This patch makes the TPM version, for which the ACPI libary probes, configurable.
>> If acpi_config.tpm_verison is set to 1, it indicates that 1.2 (TCPA) should be probed.
>> I have also added to hvmloader an option to allow setting this new config, which can
>> be triggered by setting the platform/tpm_version xenstore key.
>>
>> Signed-off-by: Jennifer Herbert <jennifer.herbert@citrix.com>
> ...
>> --- a/tools/libacpi/build.c
>> +++ b/tools/libacpi/build.c
>> @@ -409,38 +409,47 @@ static int construct_secondary_tables(struct acpi_ctxt *ctxt,
> ...
>> +        switch ( config->tpm_version )
>>           {
>> -            tcpa->lasa = ctxt->mem_ops.v2p(ctxt, lasa);
>> -            tcpa->laml = ACPI_2_0_TCPA_LAML_SIZE;
>> -            memset(lasa, 0, tcpa->laml);
>> -            set_checksum(tcpa,
>> -                         offsetof(struct acpi_header, checksum),
>> -                         tcpa->header.length);
>> +        case 0: /* Assume legacy code wanted tpm 1.2 */
> This shouldn't be reached, since tpm_version == 0 won't have
> ACPI_HAS_TPM set.  Still, do you want to make it a break or drop the
> case to avoid falling through to the TPM1.2 code?

So there was concerns in v2 about backward compatilibity before of this 
area of code.  The exact nature of the concern was vauge, so I made this 
very conservative.   This was intended to mitigate agaist this code 
being run, but with the structure being set up with something other 
then  the code in tools/firmware/hvmloader/util.c.  Any such alaternate 
code would set the tpm flag, but not know about the version field, and 
so leave it at zero.  In this case, dropping into 1.2 probing would be 
the correct solution.

As you say, in the use cases I'm farmiliar with, this would not get 
reached, so shoudn't affect anything.
Haveing a break or dropping the case would result in it silently 
ignoring the 'invalid' tpm configuration, so if not compatibilty mode, 
I'd personally prefer some sort of assert, although i'm not sure how 
best to do that in this code.


-jenny


> Looks good though.
>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
>
> Thanks,
> Jason

