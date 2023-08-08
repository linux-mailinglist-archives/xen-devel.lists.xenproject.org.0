Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 197D7773A0A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 14:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579727.907818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLUG-0001Kz-SG; Tue, 08 Aug 2023 12:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579727.907818; Tue, 08 Aug 2023 12:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLUG-0001GX-P0; Tue, 08 Aug 2023 12:06:56 +0000
Received: by outflank-mailman (input) for mailman id 579727;
 Tue, 08 Aug 2023 12:06:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCDA=DZ=citrix.com=prvs=577c1445c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTLUF-0001GR-W1
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 12:06:56 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fde57df-35e4-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 14:06:54 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Aug 2023 08:06:52 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5018.namprd03.prod.outlook.com (2603:10b6:5:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 12:06:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 12:06:46 +0000
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
X-Inumbo-ID: 0fde57df-35e4-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691496414;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nm06pE+DvkhhsspPt8Z2wjQuX5ALmz/AziCtoufuze4=;
  b=GRLVEPv4n+ylWigG7Xvi4j4gBcgfnUEeNkpmQvsPsPeXb3PTj8g7pdcr
   /IUk2fM1TdB8U8j/AfSAAGuECZB5VSlqvesYYVo+zHYeU/DmyHndyfxbW
   04khE749bN1e8yqBw96yLGxybxner/7Z+fCoI/JL6+6OfVsDn83xRDO3r
   o=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 119276021
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5rehuK3CnJuYLhT5ZPbD5Qhwkn2cJEfYwER7XKvMYLTBsI5bpzMBy
 GtKDW3Qa6zeZWSgfNEiYN+38kwG7cPUmNQ2QQJvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gxmNagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfEERE2
 acgcC0xdjOdo9qK0LGeT9RMr5F2RCXrFNt3VnBI6xj8VK5jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KlFUZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiCdhNSuXir5aGhnWvwWMzIjFRW2CAhr6erHXnBeJlI
 nY9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BXcLeCssXQYDpd75r+kbjA/LT9tlOL64iJvyAz6Y6
 yuWoSY3gbI7ltIC3ai/+VHBgnSqq4Shc+IuzgDeX2bg4gYnYoegPtSs8QKCta8GK5uFRF6cu
 nRCg9KZ8O0FEZCKkmqKXfkJG7aqof2CNVUwnGJSInXozBz1k1bLQGyayGgWyJtBWircRQLUX
 Q==
IronPort-HdrOrdr: A9a23:7bHX8K2UPZxw3o/NMNgDzwqjBLokLtp133Aq2lEZdPU1SL36qy
 nKpp8mPHDP5Qr5NEtNpTn4AtjkfZq+z/5ICOsqU4tKNTOO0AGVxepZjLcKrQeOJwTOstR3+o
 xEGpIOauHNMQ==
X-Talos-CUID: 9a23:ZhI1oW9aiGDDdxPfQwKVv18xEOx+SiXA8G/zPWuANXZqbbioaXbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AMf5eXw1YW29CN6igsircpJvbsjUj36OhKGoh1ps?=
 =?us-ascii?q?9gO7DEgpLYmmttj2Na9py?=
X-IronPort-AV: E=Sophos;i="6.01,156,1684814400"; 
   d="scan'208";a="119276021"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrilHjanNiWvw9CcBvuy18sUTV6V07vNyJk2troGZT/WY01hNvti2yCQFB70geGDPyB05/NsrjSLfKBEkoVPFPSo6A5qquvwo9LXDvdDCGHsgW7m2Uqbciqqyv6WVI4xoVscChmaDNG8fkdc9itN7zKyapoyVwsJ2TfWftm0IkrMyYFc6HWQqTWU+Uwk5RW65FdrGTbneR08hs/Hyj+Mgmd8p0D2nWRnLdAgBj+qwWvY8lABoySo3fAVRsKUcZzVbROlxN21QDEGRe/ArWiUB3uvPcfF0szU2l3G3DMipBsNWLRW8Sl8yL5Buyl8N4hoMRbQFMmQXY3u7OBU492hmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paskMqDzMx6NCTCwQr3nWGzjL6QapiqdakCF63HtgjQ=;
 b=eB6HjUkceKJ/HzC7vzb5fdMfbwKGtId2ZkbooKqVYEOR6R5LAj5nLd1Bf6NYGNBRJQWVKZSO3+T2qvVvt+r++sAhwsXkdCgET+qdLddhA59GTGWlQJWkRcw3wooRIydg2IgsYipyEmvS1jKmqmJXhtvtqy6sjFkMgA4oJoU6VxEvNzwQHc0Fb/W3kwo2yGJqr87+pcv16CmHgUQ5D1B8PynWNwKJVRVBZBOivjzlLZZaC9cG0sKcedKHOYCcGKGlzITXRvfxO1Oz/YroJu1KP8qD9fZySxiDhuVQF8FfEMx674Xgme9f+5YZTNVBZXmi7Kz/m+IvIcHCQUwsmVr3MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paskMqDzMx6NCTCwQr3nWGzjL6QapiqdakCF63HtgjQ=;
 b=KuD6+ryROWMnF45KUldwRpxBFU/bMavxsj0Zy3xrRrVmKz2FVC44zmHVHbkd82+QGHYhXLJItE4EIWwsZdNzEZ6PCIXunOXQFJ8kLH8nPBzpKDRY9dPQZEd2lX//JGLt6jh6FfFC/pElUFAqbPL261a7EcwXt89WIq0+zNRTAFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b2551bf8-06de-c098-77e8-ed1a01ef6319@citrix.com>
Date: Tue, 8 Aug 2023 13:06:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/IOMMU: Switch bool_t to bool
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano@stabellini.net>
References: <20230807165830.6719-1-andrew.cooper3@citrix.com>
 <504749e9-1782-f031-e015-d36c538e80cc@suse.com>
In-Reply-To: <504749e9-1782-f031-e015-d36c538e80cc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0233.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c927a1-8fc9-44a0-c833-08db9807f003
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	az1CEY54AJcccEsiWxKm1DNKmjwZnmNjzsUXKySpAwWHwKVtlJcXuWOULdf9JD1uc1lYfe/yU8B5vW4ySV8mq3Evfijg3D4upswVw6cvXQ4v4RNNg7M/myWseJgdr8K1Ui/C2Af6CUu7/BqNLCEpLYuEJyYvnLTh+gDto6wJeUKeBwYq8RgT+vHUy9KvOMkN24jaMWVaiazQDaQRoDIVC4l900PT9TWFZCl6TmBcSfLmtCsdIVN2ds9lOVZAHfhdUwcqGnTvs43qnsv2N/Sd+6pojI87jphR8aCfq21S/V3HGgNENPDIXVrGpi7Tpiu/sFQClnIM+RBkoUFDjwHRkHdAwWNmEUW61CMG22Uz3pBxPiptJ7vF61lM2BTvBpzO0v8qVGsgFD2+X6/7egy4ZbEWSECmsUcRAPLMCpnEuJAHhwjnNoBnbQ7AufjlclDz67hOEm/mZENgccBqvySDJ29qr+i+A8jIjvGyU+Qka/LgsGGt86EvzxtH7SmrGvthcG/wlnWMdROWpNMboBvoBgzV4Lhm2qGoZTBeE7DDeIExrT7xHy/H9j0v+RN9PLxgWO8acNa8nJ+/tnNhDAauVvnSiVwLQL48pz+jQ9WbSAEpPLO3TWLUQL9YW4NEoEyWZ2GJNjUyF0jDcVmuOvYIsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199021)(186006)(1800799003)(8936002)(8676002)(5660300002)(6916009)(4326008)(41300700001)(316002)(86362001)(31696002)(2906002)(6486002)(6512007)(6666004)(2616005)(53546011)(6506007)(26005)(36756003)(66476007)(66946007)(66556008)(82960400001)(478600001)(31686004)(54906003)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2grQ0U4emVwa2xxVXd6VU1OQmllUXJNS21Hd3dac3d3SHZGOU4zb1dhVHFX?=
 =?utf-8?B?R2crQzh1b2d1QkFSQUpmbTNyS3NWclZNYVZmZUxxSlZrOVRWcUhrdjRYaGVt?=
 =?utf-8?B?eEF6Nlo5cERSenpOaDcrUy96S3NQUWcwa21aZlVKSzZqSytxa1lKeW10ZFZr?=
 =?utf-8?B?SDJBaXBoOUJvUzdUcUtrVmdzOUdnZjkxK0tiMlZnRUxqcG1lcG5FODFYR2JK?=
 =?utf-8?B?SDZsNExiSDEzaDhHOU1Rb2ppMExoRGhzaHRFNkxnRXRlUzh1RDlyY3VLSkE4?=
 =?utf-8?B?RHNJeGxEZmFkY2ZsZDEzMTlFSkdsSnRNUlhJeFJTcW9iY2NFMHo1bkhheUJE?=
 =?utf-8?B?L0ViY29valFqZUd0MkRmVjVJeFI3QnRrTU1qckc1VThuRi9BUmFSVytNOEwr?=
 =?utf-8?B?TDVpaFc5UmVvRzBweDBpeHE3bWJJb1NZWmpURXlmOXk3ZDRBOStITWtYWkZh?=
 =?utf-8?B?djRydjkvWGFpSmRveGdLamlvT2VJb1UrMTdTdTNIRFdlaWFIV1FLMmNoQVJL?=
 =?utf-8?B?UHdTQUdFVGRnTHRiM3U1Yjk0MFN4eXhqVWxnZldrcjJvbDVxZnlwVWZESUJK?=
 =?utf-8?B?ZFBCRXAyTm5EZTBiQlE2TFdCODlwZjJ5b0xQNFMzZkZZVjFLZ2M4bHBYV3lH?=
 =?utf-8?B?KzNZWTlkRndCeTNlL1licVI3RUJzbkxYWHFNZVlLVndpci91c01TaW12bGFO?=
 =?utf-8?B?S1FrMTd1MlBtNlU0eERKM1EvTnQzOU9PRklXRGtuSXRqNnpZL1QrcFlxalRG?=
 =?utf-8?B?eXhYc1hMYVFsa0svM0tGcHljS3VpL1NZNUtKYVFQbGVnNWZvZHFGVFNoMlIw?=
 =?utf-8?B?TUQzanlkN0FvR3NRVDNJY092V3Nzc3BUdVZKaFI4dXFKVVg2a0FrWG0wNExH?=
 =?utf-8?B?eWk3Z1dFVnVEL2NXaU1iVjRBSWFhWkJlcWt0RmZ4TDBsM1VSVUtJYUdmQkZo?=
 =?utf-8?B?SWdkNW1HY1VaWnp2MTJjK1lRalA5VTZEMm5tVXVJQVBnSVJmRVphMDZiYndH?=
 =?utf-8?B?U21KSzhIZldHcm9YSUJ3a3RQZmZ2NWR0TlNmUUVNQ2ViNU5DMlZXdXcrMkJB?=
 =?utf-8?B?ay9rbVdVSnVoSUdXdmhBVWVMOENNNDhaNVNkWFViejk5VW56TlorVDFURUNE?=
 =?utf-8?B?VnQ3eXVRaDdlYko5TC85SFBFSUt5T3UzWThUM1FjTlV2Unl0WVJiYnFtY291?=
 =?utf-8?B?WDljWENSRlA0akE5RHNiL2tFZWZ2M1BRSDNrbnk1R1IzYUtkMjN5dENZNjhM?=
 =?utf-8?B?eHVranNSZjRJK1A5bVhUa0FRZTR5TW1Jdm9ZZXRjZEU3VzMxSkdUTnBFZzFr?=
 =?utf-8?B?c0p0eC90THdEL2dWZlpRb0lGZ1E1WllXNzZBOXJ6UVV2RUkxbStzUXJlWVJG?=
 =?utf-8?B?b1hJaGV1TGZ6Zm5VTk5RTE5KT280NHhWd25jQzhGSllyd2xOSXlmTmdmUnZq?=
 =?utf-8?B?VDNkNmd3VElrU2RPdTQySUNiQ2RtTzhqdmVNNlhlbHF4UUZKR0w5K0tXNmk4?=
 =?utf-8?B?bHJyM0pWSXRncHpENkI2ZWxqaWVDVEQwSHJHZ1pKZXZzNU5zUzFBUnZRUExE?=
 =?utf-8?B?V0haeXVETS9RbVJaZC9TNS81WjVSc1g4RngxTkJoYWt4c2xtRmQwbjJ2aSti?=
 =?utf-8?B?WHZybHg0eWdRYW1QY2ZGYzJtNDYrTlVkTVlRbHN2aWtZOWVtREdQVEh6NGhU?=
 =?utf-8?B?N3laaXZlb3FQZzlsODhxeHBpQ000cjA5VkFld2s3SEpFM0gxaElSUlIwZStx?=
 =?utf-8?B?VTMrejZ4VFRQZnlhRVZnTVZnQjlkWCsxN0VzK3QzeitSYnh3eFRLb3ZJaTVT?=
 =?utf-8?B?NlJGbFlTK2djMzlZMzZvQjZxZXNVQWNPUmVKQkV5ejdOYUJxVTNoM1pSU0Fr?=
 =?utf-8?B?OXRpTTk5eUc3eTFXSjhhVkFBOVp5ZlA5YWx6YTBaWkd1dklkSjZrMkIrTGhx?=
 =?utf-8?B?NXpuWXJiV2F3NVU0SmRGSjNaTCtxcVRLaFVWWWNFMnQ1cURrRXFpZkV3R2dp?=
 =?utf-8?B?b1QvWTFITUlzaXdBSlU4eXJpUk56VXRhTklpNXBrMnhncTM0RWFDc1JnZTAx?=
 =?utf-8?B?c3hRTUlyQ0d4VW5rb05ZZjY4VGRQUHVFOEg1a0E2dVFXRzBBa1JnL0tROVpS?=
 =?utf-8?B?WXFyclhzSmJ4ajM5aXh6MlRzTjhtQXRwTzlYMlR0d0ZSM081TWVDL1ZjRERK?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uGHhIa3S6k6OgNVF+TflSHiSd3Nz7DTgLHiaErd8/oGbBbc6PTrxeZh1YGz+hJ7J0AKbW6REHQTztvZvvU3eKdqgzFQ/yyAlJqFrl7vLClivmIncZ6f0fN2EPxzvhvwspqe02hJwAzy0GglHJ2YHdxsiSX+ybkk957p1fUniUWIYOv23k5AHCM4zS/2f0aKd+w1AF4TtsPYRJE+c2aSFtnawB6hbb5xrR6Aa6Nd77nePpgjAng6zyFy+hoUnrlgM4cG8bIGmoMZ+UBZ9CQv/EnXMFjQCXDuCuFF92/np202EpFodYYz/9iUKS7aDzCke05VEPfz7VLst5xWhYYuNiWEljNVprIZKYC84CZM5Whtnb84Mpa766KjA4p0/0fu4ps9lha20kVzfAx4PU+plsRM1jXPPEqSk/gDA0Q/q8kre2LPjENnb7x3UIXGq/D7zFWsz/heIHnZQtbeFV01R7qphhSyysXm5w+X9z6YU8YVi+dvB/OToBbJQ2G2LOQiNpr3Phh6EXqtKo/5eUR1RM90xSyjXreRxP2sW1Fd1TLPGOD51BUpoaNvPVsd2bbJBmZfg2pNbADI0sax9d+94BwmG2ZG08taRgoYFELbxd3BtY5nqdQP66S7xnGuIdZZDVrK17Vv0mXziHdqZgmiy8K9bA5/OlKgdcr+jkZ8u17pXBTUhAzSfPuB9zW5kURaX55JVNTHAxJcjZx4oJTnOrvOHcm9/R6gZsZRW88y5gIk1Ve+uxsE/Gx6PPDIDCJ0r7rMqYaB9uDgSF3nPQKr7iH7x9QtvptD3aUv2cGpd1D1Jv+LXI0wUyEvy/DmbKxhIAZZTbtHM+thHkKDYhrewI4gUKzdnKhdO/FRvpnWHy2A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c927a1-8fc9-44a0-c833-08db9807f003
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 12:06:46.5268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPioY9wuzq1IUGGWcBpcgxB7YQk3abW+Ri1TdoKxJ780FtQy6VHrzSbAIFAEowgCFg7z8PLwQ0KJRuDmd1SySGu5CZZ8zFTlnOfWTJHwlR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5018

On 08/08/2023 8:54 am, Jan Beulich wrote:
> On 07.08.2023 18:58, Andrew Cooper wrote:
>> ... as part of cleaning up the types used.  Minor style cleanup on some
>> altered lines.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  xen/drivers/passthrough/amd/iommu.h         |  4 ++--
>>  xen/drivers/passthrough/amd/iommu_acpi.c    |  6 +++---
>>  xen/drivers/passthrough/amd/iommu_init.c    |  6 +++---
>>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  2 +-
>>  xen/drivers/passthrough/ats.c               |  2 +-
>>  xen/drivers/passthrough/ats.h               |  2 +-
>>  xen/drivers/passthrough/device_tree.c       |  4 ++--
> This will want a DEVICE TREE ack; Cc-ing respective maintainers here
> (and therefore preserving full context).
>
>>  xen/drivers/passthrough/iommu.c             |  8 ++++----
>>  xen/drivers/passthrough/pci.c               | 16 ++++++++--------
> For these and ats.? you would also have wanted to Cc Paul.

This very much qualifies as tree-wide.

In fact, it was the only decently-sized chunk I could pull out of the
pair of patches, one for common and one for x86.

~Andrew

