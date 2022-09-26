Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992855EA8FB
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 16:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411907.655032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpRP-0004xB-Ma; Mon, 26 Sep 2022 14:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411907.655032; Mon, 26 Sep 2022 14:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocpRP-0004uV-Ie; Mon, 26 Sep 2022 14:50:39 +0000
Received: by outflank-mailman (input) for mailman id 411907;
 Mon, 26 Sep 2022 14:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s/Db=Z5=citrix.com=prvs=261f3fdbd=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ocpRO-0004uP-2N
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 14:50:38 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92debeae-3daa-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 16:50:36 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 10:50:32 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB5990.namprd03.prod.outlook.com (2603:10b6:208:313::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 14:50:27 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Mon, 26 Sep 2022
 14:50:27 +0000
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
X-Inumbo-ID: 92debeae-3daa-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664203836;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AaylrN5BoaowwtMky8IzH77XcswefpIc26+dsCWWb9c=;
  b=VEaun/BS/k5/WkBv963ZLG4XsKWYeBgUqjyZQsAvpF2f+DDYNKLJeFnb
   qgJDsH/vCS1QF6p0gRpRgd1yIbtAb5HhQ1VitHvva/lEwIRlT7KbP+VWG
   FCW2859619URAlmCSSmOJ4Y5geFGuFeaLqZ83IqtJ5cf1i1Pl2hGiw9lj
   s=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 81346167
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OWU7OKxJ2J0bFmkramt6t+cNxyrEfRIJ4+MujC+fZmUNrF6WrkUCy
 WtMWmuObKqCYWWnKdt2YI3gpB5TsZLRy4QxSlFk+yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Ukx5K2aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1kJXw8EtIiqtpHW19rq
 MA4bxo/Xz+c0rfeLLKTEoGAh+wFBeyyZMY6hSslyjvUS/E7XZrEXqPGo8dC2ys9jdxPGvCYY
 NcFbT1ob1LLZBgn1lU/Ucpi2rv3wCSiNWQA+Dp5poJui4TX5BZ237X3dsLcZ/SBRNlPn1ber
 WXDl4j8KkFDb4DBkGTamp6qrvfmhx/rY4wpLbm59aJKmQbUxWsUDgJDADNXptH80CZSQel3K
 UYZ5y4vpqga71GwQ5/2WBjQiGGAlg4RXZxXCeJSwAOQzqvZ5S6JC25CSSROAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+EoDX3NSULIGsqYS4fURBD89TluJs0jB/EUpBkCqHdszHuMTT5w
 jTPqTdkgbwW1JYPz//ipQCBhC+wrJ/USAJz/h/QQm+u8gJ+YsiiepCs7l/Yq/1HKe51U2W8g
 ZTNoODGhMhmMH1HvHblrDkldF1x28u4DQ==
IronPort-HdrOrdr: A9a23:1rCCdK7epsAC1tSxNgPXwVOBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0l9
 gsAp4Y6o2mcfVmHJ6VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.93,346,1654574400"; 
   d="scan'208";a="81346167"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guc7J/dVB+zFPQyraEqfK/nfj5zpq++A2ajFtekzjMcmuMY8HZYqZqJpI4NSWEUF77k+A67pG0Pb5zOskRysDQu2Mk7nHpzwTAzQUFHu64/ZUW1iqNaL7Q3ALneruwuuGmBEG8jykwPZ/68+AhLtFoBEd1gQvEE5T0i++LQgeO66DHyv44Q52Bap6KbGyaFiLRFQkYZ8isRWghrmdviTYVVgnLLJPrrKvkn02QLe3kbbvah1Rj+7zUgoWXLUtW5bF1jxXVwaK140u1ftbBLcWVt/+xfDNRHC0kueR9tUt61m7BWXu0QtStjKt3RC8PwK8WWwFyWWTJQ5WiDq2fWE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXZKiHA38wFhvsgghw7D4q99CP64GtYB6wVvvv+kDVY=;
 b=ThzfVmcKCM2W5gZEeRKXfPJGG8BNFgxPl5vx+6dG2fQO5JNGa8T1PY9ojbdiTKaOtG3FXZbNJ8pWjkjifycRzfDCX1fO2+DFN79WvZ0rRwhXSouPjCsgtSm6OKJfH68LQB7jatu2XoFUNzDnigRpRLb60K5eZ7KbkH2hpibFIU8cCscuA3wXD3gqaVcwaVwBowPbOHGHcG8gwnuz0t+GJvtPvfiYQ+Z6PkT5MSu4hmc1/+uYTPMZ75uQc0XczKQjyXohSXOMVwVHWWrJc7ayz2wSUiHZiHi3K528d10785NgVuTYq5P7z1zuKyKlNkVBkqC8Ntso3y8Rm0zkXLvXqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXZKiHA38wFhvsgghw7D4q99CP64GtYB6wVvvv+kDVY=;
 b=pYjrYQ8AR9Js+BvKnGxQAbivOwzD1Bmu/rFzwWBnnW1ZLPLHcKRLhulJ9vGp8HW4zil6udTN7SoLl3X06Rt+mkpGcom4SF+S/hqu1N2nMxiDnPMQMbr6yjyavgu1N3upK9ZydMYsoxg7W+wrOV8hcmZ7ziaA+2dp77rumEnG6Cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 26 Sep 2022 16:50:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ept: limit calls to memory_type_changed()
Message-ID: <YzG8Ln2cYTuxF513@MacBook-Air-de-Roger.local>
References: <20220922160516.5929-1-roger.pau@citrix.com>
 <ddac718b-0ffd-0eb6-d784-4c35ee4b42cf@suse.com>
 <Yy1vvemAmiTdPZxA@MacBook-Air-de-Roger.local>
 <489b2308-8ab8-c1c0-1471-04aa1c4bf0dc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <489b2308-8ab8-c1c0-1471-04aa1c4bf0dc@suse.com>
X-ClientProxiedBy: LO2P265CA0408.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::36) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: fb39643d-9f01-47d9-17a4-08da9fce72f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vghvFZyglUmpxVFpvfv/OLTg0EI/2Wn6A0TQrIatbJQf6rEtVop6BVq173sHvCD/l4yO4RvG/s83Ox9xzxIkPSCz4fxMN5QX69Q3J9MqyDsXA2cogtg3HeapaVqQvVygPdvm8N3t4v2exIWJft6HC78rpzhwQnhtKgTOG/wpRdnhnn1/UwJ+4j7JMBnEBDIp7xjZ8Bz6UY13dJcgjBOtmavPlVrEIEj1yjWlyLy4WlcIVFB2EaDmb7T4od+RJaqLTbWcEJrnJSZWspJPOyjHVM9UQBIv57yI+5uQuFOJrcnc4WtCnOdu7fVw4Z6GRAEkqypiSKC+H4vpVRxT0TKyC+lsUCdLXqDjN6exY1dSEiMhWbYO0tegRctKbSrZfyOQT5f8Rdq2TIE3hgG9+NBn0lFnRMLGfUFT3M1c/x24eK/pqF0RUOGe8P/z3uBxxOoL5VVKw/+g7qdFpdJCh4X+orHpJsVeDO45r6lHlqKxALufTjMpTO+ShAoYKHI7q1RVfxzpm/bAjywOP+63B6jsWsTtnsM9+18895+A0jD0gLfjkygXdW+MNxUci19PFT1zLhiyJa6DOMXClM9QM9elBJBhGb7j70ajEknK0LP6NffPIyJGe6R6U3O1XkoqzC5C9F8VzlkLBIMkRwlu8Zy0a8E/KsRkv3jQuC8l+TFv7iA14PLMBbsJG7P1kaDCrLgS/A7Vd+8yke9yCCK5gapTDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199015)(54906003)(6916009)(6486002)(316002)(478600001)(83380400001)(66946007)(66556008)(66476007)(8676002)(4326008)(41300700001)(6666004)(6506007)(85182001)(5660300002)(53546011)(26005)(6512007)(9686003)(2906002)(8936002)(186003)(82960400001)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0VOcklJVThjdkM5blVnYzV2VjlJaUtwQmdYWlFOOG1adWZ1WkRXYjBMY2Nm?=
 =?utf-8?B?dDNtaGszM29XSGs2bElFUzU3Y1J5blQvbG9VL2kvamt6OGYxSDUraXYzM2oy?=
 =?utf-8?B?Z2ExTTZNdnJXbWVjSEZnNkIzNE83YU1Hdld1WTFZeEhMOVJnbFpyb0NJQllp?=
 =?utf-8?B?SkYvZ1JJbm80eEpSS3RxV05aWVd4eHhWK0hmc2dzMjRTKzZ4eWxFV0NvNHJr?=
 =?utf-8?B?WDN2aFpDYmlkWURQMks1ODNpNGpFcXplRDJkamV2ZXBtUG45NGl6ZGhSSFc5?=
 =?utf-8?B?MytFV0VaY28zeGRTb3FoQzlHNllEcDBEWXlta1JRWVUrVXU5NXdNWm5DWlRh?=
 =?utf-8?B?M201eVBvWVNZbDZOZVVjUkEyY29wcjhPYmhod1RjOVV1L2MxeWd6Vkpsa21p?=
 =?utf-8?B?WlJ2NnlUNmlMa01DdTJjQ2U0Qkw5L2ZiL2d1VEV0T1NLQWN0cnZ0aEVHU0xl?=
 =?utf-8?B?cTNwaVBwc1R1WC83QWZMOXJLeUxBcDBzdjJmTGhmcVlDWUV6Z250SmxPREhp?=
 =?utf-8?B?N2tEbkhnSi9aNU52MFJ5R2NiZWN0ZEc5RWNudTB6SkNneVFqUXkwNjdTcllN?=
 =?utf-8?B?ZkhiRXordS9yMjRVdkVQdDR6WGFQT1NQZTFoQjlVdW5nUXdaSW1OVXhNUmY3?=
 =?utf-8?B?RGI3azBCN0tBNDNZNDBjNk1aVGFJM2RESjFoWG9aSko3RUFTN1JtL1hlNXdY?=
 =?utf-8?B?TnFOOVhLUm44U3gra1oydmFVUWlXNmdWOEg4bno3d1YzcTNRdzFLd2pFVWV0?=
 =?utf-8?B?TWNyQk5ENUFkVlZ4Z2JLWGNRaXJoK1NSdXZDcE0wZXVJR1FaUXJMOGhhYU1V?=
 =?utf-8?B?cEFsU1Z1NG5CQkhCN0dIYWVDbmJ3dU1nUUV5YzZlVzFjTmdDdXFEQUh2Uno5?=
 =?utf-8?B?dTNuNFZVQjVKUk90WVlKSEc3SWFVL1g0VVNFeG5HN3ZSNTg5VHIxMXJJWXor?=
 =?utf-8?B?N3VNOUt1OTM2aEFRMGQyMDhnakVpbjRTSGJDeHo2YmxBUTRORFZWamhHMnE4?=
 =?utf-8?B?ZzMrK2xXdHJNTGhQWThPTC9iTmJoeEZUU1lIV0lnS0IxdG96ZnNYRGhEKzl4?=
 =?utf-8?B?a3BxT25zMjAwb1REektrN0RpMVpiMHQ3V0FPMi9CdnhKV2RCeUUrcTUwVy8w?=
 =?utf-8?B?M2UwV3Y2QUVpMHp4SkJzbFF4RVhMNUltb0lRQ3BRNWxXRXZvM3ZtLzFKOHE1?=
 =?utf-8?B?emUwSit5TXNHQ0RQSFNiOFpPYVVhNks5Y29BZWE3UU1XV1g2aXFVcGcxNUJI?=
 =?utf-8?B?TnJHenlxVVNXN2pBc1VNd1ZiUWNpa2xvSjlSZVR4S3NzNkxaTkRBVHFXS1Fy?=
 =?utf-8?B?Tnc0bHEyZ2FGL3VMZ05aMWpIQkhpeVRWU2t0amJQYTlkZVpuczB6S1NHQTda?=
 =?utf-8?B?OHpVdWcyVWN6SUdMbW9lSU1vM3NxUFFlNXFxWHV4NlZsUC9PWHNRbjdPL3lS?=
 =?utf-8?B?K2pNaUlEbGFWanF3OEg3WDg1VHoyaFNSS3JiN21ISHBUV1ZMZFJOWGRwaDky?=
 =?utf-8?B?Q3MyUEkwa08rTnpRUmpxWDFkUVhrSmN4NHYrMjJhdUtZMDAvTCtEQ3Y2d0dR?=
 =?utf-8?B?YUZPTHp1c2VKZ0YzL2Z5NkN3bnROYTFYbVdoV2IzWERkOXJEamFrcVYwSGJu?=
 =?utf-8?B?VVdPakROZ2ZIb2ZJVUdZUXNKdlk3dVdHYm53VlBYOUtNMVV1WXVSUnRTZ1A1?=
 =?utf-8?B?NHpkQTZ0YzA1Vjd5WVJIYzRYS2hKb1VQMHZxTVBjK0VyLzlXZ25GRFhKRUhl?=
 =?utf-8?B?UndyaG1uYTliSVU3OTNpVDFBNUJpZUNOVTdCZC83WHBNOFFBSFloY3BYNTRM?=
 =?utf-8?B?WWdMTTJWRHFDWXZrcjhBbFoxNUMra2htZlpiK1BkSU0vSXFzakFjYzF3MlVZ?=
 =?utf-8?B?eElkdVVVN3VraG8rc3Z6Vlh3K0ROdjhGV0RPOW9pY2VNMVcvWHRPQ0tpeDJx?=
 =?utf-8?B?ZGNLQys1akI4emZuVmM1czFWZVNVUXZ4NzgySXJVQ3FWa1NmY2RNVmxUSkQ1?=
 =?utf-8?B?TG9TNGQ1dVJIVUtOMUh2WFFuelBoK3RidDM0UWZ1T1JkWHV0NnhvZDJtelNG?=
 =?utf-8?B?NDRFQnRCT1dtZTVwY05rbUFPei9UUzd0ckxZOUI3NWtTYmQ2MmxBNlJDYTJ0?=
 =?utf-8?B?SitsUnBBODQ4T01IRWwwUFYyMGthR0dYd0ZSdkZ4Qzkzb2tvcWR0UnBGVlM3?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb39643d-9f01-47d9-17a4-08da9fce72f5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 14:50:27.0059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLILTDEWcT2+mEg1hFEOLXZc1ng0k4QEAcZt51GsHX3oBo2G+iZtGbVxKNQ/fHvHhI4nCMq1TxldCS3l/j9A8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5990

On Mon, Sep 26, 2022 at 09:33:10AM +0200, Jan Beulich wrote:
> On 23.09.2022 10:35, Roger Pau Monné wrote:
> > On Thu, Sep 22, 2022 at 09:21:59PM +0200, Jan Beulich wrote:
> >> On 22.09.2022 18:05, Roger Pau Monne wrote:
> >>> memory_type_changed() is currently only implemented for Intel EPT, and
> >>> results in the invalidation of EMT attributes on all the entries in
> >>> the EPT page tables.  Such invalidation causes EPT_MISCONFIG vmexits
> >>> when the guest tries to access any gfns for the first time, which
> >>> results in the recalculation of the EMT for the accessed page.  The
> >>> vmexit and the recalculations are expensive, and as such should be
> >>> avoided when possible.
> >>>
> >>> Remove the call to memory_type_changed() from
> >>> XEN_DOMCTL_memory_mapping: there are no modifications of the
> >>> iomem_caps ranges anymore that could alter the return of
> >>> cache_flush_permitted() from that domctl.
> >>
> >> I certainly agree - this was an oversight when the two aspects were
> >> split. One might argue this is a (performance) fix to the earlier
> >> commit, and hence might want to go on its own with a Fixes: tag.
> > 
> > Was wondering myself, didn't add the 'Fixes:' tag because of the extra
> > content.
> > 
> >>> Calls to memory_type_changed() resulting from changes to the domain
> >>> iomem_caps or ioport_caps ranges are only relevant for EMT
> >>> calculations if the IOMMU is not enabled, and the call has resulted in
> >>> a change to the return value of cache_flush_permitted().
> >>
> >> I'm less certain here: These shouldn't be frequent operations, so
> >> their impact on the guest should be limited?
> > 
> > Citrix has an use case for vGPU where IOMMU regions are added and
> > removed during guest runtime.  Such functionality makes uses of both
> > XEN_DOMCTL_iomem_permission and XEN_DOMCTL_memory_mapping.
> 
> I see. Maybe this would want saying in the description, to express
> that there's little expected benefit for upstream.

I guess any OS that moves BARs around will also trigger such code
paths, but that might not be very common.  I can add something to the
description.

> > While the memory_type_changed() call in XEN_DOMCTL_memory_mapping
> > seems to be the most problematic performance wise, I though it was
> > nice to try to avoid memory_type_changed() as much as possible, as
> > those tax the guest quite heavily with EPT_MISCONFIG faults and the
> > recalculation logic.
> 
> Trying to avoid this is certainly desirable, I agree. But we need
> to make sure that it's not "easy" to break things by touching one
> place but leaving others alone which really would need keeping in
> sync. Therefore I'd see such added logic as acceptable only if the
> risk towards future changes is sufficiently low.
> 
> >> And if we were to restrict the calls, I think we need to clearly
> >> tie together the various places which need updating together in
> >> case e.g. the condition in epte_get_entry_emt() is changed.
> >> Minimally by way of comments, but maybe by way of a small helper
> >> function (for which I can't seem to be able to think of a good
> >> name) sitting next to epte_get_entry_emt().
> > 
> > Such helper function is also kind of problematic, as it would have to
> > live in p2m-ept.c but be used in domctl.c and x86/domctl.c?  It would
> > have to go through the p2m_domain indirection structure.
> 
> It would need abstraction at the arch level as well as for !HVM configs
> on x86. I'm not sure the indirection layer would actually be needed, as
> the contents of the function - despite wanting placing in p2m-ept.c -
> isn't really vendor dependent. (If AMD/SVM gained a need for a similar
> helper, things would nee re-evaluating.)

Maybe it would be better to add the calls to memory_type_changed()
directly in iomem_{permit,deny}_access() and
ioports_{permit,deny}_access itself?

That would also allow to remove the noop Arm memory_type_changed()
halper.

Thanks, Roger.

