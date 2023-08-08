Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF047739D2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 12:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579625.907688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKQo-0003fl-Gh; Tue, 08 Aug 2023 10:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579625.907688; Tue, 08 Aug 2023 10:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKQo-0003e5-D4; Tue, 08 Aug 2023 10:59:18 +0000
Received: by outflank-mailman (input) for mailman id 579625;
 Tue, 08 Aug 2023 10:59:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dCDA=DZ=citrix.com=prvs=577c1445c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTKQn-0003dx-OA
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 10:59:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c853bac-35da-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 12:59:15 +0200 (CEST)
Received: from mail-dm3nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Aug 2023 06:59:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW5PR03MB6931.namprd03.prod.outlook.com (2603:10b6:303:1cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 10:59:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 10:59:10 +0000
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
X-Inumbo-ID: 9c853bac-35da-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691492355;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=240ItFNQDfsYGdaD7F771Y48LREjkKdZjnYUTIJFswY=;
  b=QCQ7th9GbXnjTWr+420uvptgtXXw7sqyGbqdx+9X/YoNQgIu78wKjWK6
   b5VpCyFPUIs/Jn8eomhNzddoiWkA1BkMKDl1HyWvF2f/GhQbzz5tOq/vW
   2GC3CvUffotsuDec/kg6XlLl2C5B7/a8o76DpqAWWbmX7xlqaE1Tk1pUi
   A=;
X-IronPort-RemoteIP: 104.47.56.49
X-IronPort-MID: 119269582
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zpJNfaicoMIThOIkqL7+g6bvX161whEKZh0ujC45NGQN5FlHY01je
 htvUDqGOvmPNGP8Kt5wa4S0/UlTu5/RndBlHAE9ri5jEn4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AeBzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQXMjJOZ068ldnv/5aFdtNq2Z44NZTkadZ3VnFIlVk1DN4AaLWbGeDmwIQd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEvluS8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeziqK830Af7Kmo7FxoTXmaKnMmC1RS0R/FaC
 G0M9wV0ov1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+WsDezNC49PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiisywWl7gVy8kR2M2T913dnyiloJSPSwcv/xjWRUqs9AY/b4mgD6S27lzc4edFPZyuRFCLt
 3gZmOCT9OkLS5qKkUSlW+wLFaq17u2ENxXGiEZzGIMs8Tus/XOuZ4FW73d1I0IBDyofUTrgY
 UuWtQYK4pZWZCGudfUvP9P3DNk2x6/9E9ijTurTctdFfpl2ckmA4T1qYkmTmWvqlSDAjJ0CB
 HtSSu70ZV5yNEit5GPeqzs1uVPz+h0D+A==
IronPort-HdrOrdr: A9a23:6MRrKasSUcIGsOZ6vBNbLyhk7skDVtV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslYssR0b+OxoEpPwI080lqQb3WBuB8bGYOCOggLBRuxfBODZrQEIdReOkNJ15O
 NNdLV/Fc21LXUSt7eC3OBgKadF/DBQytHOuc7ui01gShxwe+VY9AF7BgyHe3cGJzV7OQ==
X-Talos-CUID: 9a23:SjoXKmG+sB6t19GpqmJo7kxXE54aYEaE81PuH3W+VjxyUeCaHAo=
X-Talos-MUID: 9a23:jQalJQgHc1kqYuFqviRovMMpK8Bt6JmfNXA2zs8Mp+qBFg1oNhjHg2Hi
X-IronPort-AV: E=Sophos;i="6.01,263,1684814400"; 
   d="scan'208";a="119269582"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIW0PeUib6h3xgKSHp/L3/4Awl9DPFw0aygqG/LOyRNu26GOW3dW1g5g8mcDVyHCalWQVZ9JpIyHigAe7SALfu1RMVule30TDb+2twWRCNksJJowItFRNr/hjv79rmO98vU1TuaqZDthjaeqcV/zQRDxP1lVNpwCOghdnF4wBXauPFEKe0OVjOv720TrvKA3mdOIChLehPS6vNFBbr03I3d2WRknBqB2U71Jca7qUDS09eqeQUBQ14+I4y9nK1OgoF/R7lbNcZDEFdKt3AJA5i6vGBUOEruPN4ZaXY0ZmbqlZjvnmPwi+Kst/iIxecpgqMhRk+qDHSkVbWtY8xXGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=240ItFNQDfsYGdaD7F771Y48LREjkKdZjnYUTIJFswY=;
 b=oG06pq7a+pwP+q0LWx3wXIDT/BhHMuHWBXO6HcXnbhIgL4D4OGOEslYUhlHeMx4uVuutET35kgoZzAfvmNpu1cIZxTRg6FiL/GYa2oboJRGq0IPTpyRfuYBAsdzqu+m6v2SlJxiPh0Nx/dKBERv6/lC7PbXZNKQHMAnYxQNLalS/h2BIO9BZlo5DE7hJQe5WLzin4XcpZvkBx8iPpgG/bCw2Or8uhHrDO4rv0tWUTzLmF6ZBVps2WWwuBBo1iILcjSL+LUVgZxNhDiFrK+DB6P0uwR//JHpSOyFa7uneDfAONjhgblGNsrnXkN6e2xGCqPg/Xtsi53n+eWoIVWE/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=240ItFNQDfsYGdaD7F771Y48LREjkKdZjnYUTIJFswY=;
 b=Mu4qUisjfLKgKFy9ccflV2xsKsC0lMQMfW23tTIC6dd23kEUCGrO2PtL1kZeEnmteCv1k7IwbXscsJgjUbWJo68f7a19CiPAsniuJTsg9Rb9lYhkNeSHIdj6uqo9rmTG0jmNE2NB+UB+zDLdk9AiAwrhWSCbQqhWiBhljcbdSvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3ab0e8b5-05a8-6157-28df-d40cceafef06@citrix.com>
Date: Tue, 8 Aug 2023 11:59:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] move max_page and total_pages to common code
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <f1653f8f-a2e3-5c91-0401-b5ab14415c86@suse.com>
In-Reply-To: <f1653f8f-a2e3-5c91-0401-b5ab14415c86@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0131.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW5PR03MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e18d40f-ca3b-4fd6-d414-08db97fe7e5c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FnhVsF80jaoBENjx9TSzEL8jE8nqQogUalJlBigHYVi8scvjlvhJND0vOyLjlCfdDM5kpln7KXnve8rMe3GmthgWiTvqmsaZCoso+6dVHe5psdeSrQAVUvOzs4icKv+DQw4EZ7Pu7U8DL3VIxu6ctkVLtu6TimrEVxop2sQLSeuAmZZlBUdi3fIKe652pD99qhF08twY+MSoE6L9OfIiqP6EuuufsEj1S1BH18CO5H16UnpmIJk4LEuw9WjQWNRNASYV5GekHpF/WqPx1a1QTEkDVYXFCIuaCNCywKKoQRkkKDOTfxCZPWtlz/h0pVGA9ypoUccLxQPXobc3WDHXxiSwmwfXxalwSFCsJ7c2g6i/6K198ffwn/LWSoZvjy/d1mxvux6EBwD4DNuyrXxg5rqEzLALYsiDggKhPHSblP0p85St/Jc/p0uP7nysIE6Qht+j8iavhx7sVy+DMjbq/dLBlu1IIJ19izxYvWz2KtIEMa+tQZNzF8MnC1suCbp+28iiHC37Sk8bI0BmERyAWn6v7hW+Hy1B197yVOndwYGUrUUihXIOrUNdKId4Mlvu5kQOvxHC9VDJWTZ5KH8McV3x5aOqAJRNyNQdKcJ0vtXlzhNc8cgCqb5uMtYYA0R49qRKjQ6FaTSmWRB8lnwW8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(1800799003)(186006)(2616005)(6666004)(6486002)(82960400001)(478600001)(86362001)(31696002)(6512007)(26005)(36756003)(6506007)(53546011)(110136005)(7416002)(316002)(4744005)(5660300002)(8936002)(4326008)(38100700002)(2906002)(8676002)(41300700001)(66556008)(54906003)(66476007)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vzd1STVVU3NoZzBzRWxKWkNsZysxdlhseG1jclBGL3B6c2xYL0NnOC9MQytS?=
 =?utf-8?B?Q2F3RkwzVHJXdk4vb0hScDU4L09IQU9GOTdoQ2R1cHA1dUFnWmJ3cjFqUGJo?=
 =?utf-8?B?c1JsL0RiaGFSa1NyMDRnZmdUYWRSRHM2ZC9sSHp4S2RHQkZwbm95bi9HdHN6?=
 =?utf-8?B?WEZCOUtYeUNYM1FBaGpMaFYwUEdZZGRQVFkzZWRLOVhCTlhkRW1xdXVvaVdX?=
 =?utf-8?B?dTFtUnBzWFFNaFBWNXVzV1oxeE1ZUFV6dG9HRTgwVGJEYTdYWnlGaVJYMFlk?=
 =?utf-8?B?eWxzT1dvZVFERkhrWDNFNFMwOUVob0puclZzZGdmcjBzbHljaUVFTFdTbW9G?=
 =?utf-8?B?c3RybWVVdFQ4K21va1RwMzRJWWkzeGo2U0Zoc0dKbHYzeERzR0ZvV01xTlhi?=
 =?utf-8?B?ZEJMQXBGZm5pbVFJTkN2UlN6Wkd2bVVtTmhYTUY2d1NvcGxYYmtxSmp4NzF5?=
 =?utf-8?B?bk16VEVrbVd6OHZDYmJkUmY4T2FyWUlVUHdYemZxZlNLN3VEcEJJaytqVi9x?=
 =?utf-8?B?MkJiTmFMbDRFRi9RZzFYZkV5MXQrN3hISTdNNlZEdXhKeHFvMDF3L2RBeURQ?=
 =?utf-8?B?VjhwYzFCZko1RGpVRlJKUkFxcTBoc0F0dDJ4cXFkcnBGcGlSd29ZUkV3cjZa?=
 =?utf-8?B?bEdiVXNEOFRkMUw1eEJSOUY0em0zRFM2enBnU2x4aHJGRHZYY3pHSm5jaDZs?=
 =?utf-8?B?clNxL3B6MjU1RS9INFdEc2JPWmpFRlhnd1huWHA3ZDJ1KzE1TTdnQzQvVjZB?=
 =?utf-8?B?bmF5TUJ4cTIvNlFZU2FaeFI1QUhrc2ZSWGhWeUlDa2VxRVJ6clNCOURKYzZh?=
 =?utf-8?B?UDZnUW5VMkU1eDRJOXQ3eTdQUzdBTHNyY0lGQ2F2OEpnUitxVGxtdkw2a0hy?=
 =?utf-8?B?MXl4ZWYyMEx0TUpidFExTnJ1WXJjeEppTGlzRlRNZWE2VEV3bU9BZjVaQk13?=
 =?utf-8?B?bkk4bDBhaHo0WnVKS3BIYlFpTjhVRk1ZU3JIeUlpQ2V3QjlvaExFclZOVXpI?=
 =?utf-8?B?VkpWMUJxOHZWSXo4YXh2MFRNV2p2VEg2bVVDdjdDMnNXVUVtTkJIb0ljRDFn?=
 =?utf-8?B?U2xyL25PUThIanJvcTBINUs4UjdLMnVjTTJjdnFnQmVGQlpGa092WU9LL2R3?=
 =?utf-8?B?eHE1bG5GZy9GYTBoejg2MGwrZUprYWd0TVFyM0FoOENQbWszVzB3Z0JEei9h?=
 =?utf-8?B?Y3FqaUtSNWo5d25VUWJpcjRtQXFjNVZQYno4S2VjMFhhQVdtamJNMlFhMFhn?=
 =?utf-8?B?eTIvdm50R3JMdG51cjJEU1hLRGNwSUFJMkVCbUlScmk2eEtDTTNYUFRZQWF1?=
 =?utf-8?B?Q0c0MDNPZXRyZnBEYTg1a213L0tvSHlpTVhEYktsSTd5VGR2WW5aSGxESlhl?=
 =?utf-8?B?WG1GRERDckxkSlE4Q2FSenk0MHJSMkVzakpiZzFMb1p0SXgvcVJJcDdWeFpi?=
 =?utf-8?B?Nkdqdlk5dk56eVFPNG4vdmt6Um9QekR1dXAxcWhmeWZrQmNiWmxJS29ZOXpX?=
 =?utf-8?B?NmNBcmlTYmFQN1dIeUpObkNvbG01b21vSTJsc2ZKQ3pnaGhEQnkxbVoyend5?=
 =?utf-8?B?ckw2QzdRMzFicEZsV3dmZUpZNkNPWE4zUkxWMHF0OGxWQmpYai9WTkRkcENo?=
 =?utf-8?B?NGlKWVZMT0p6dGJTWk16b1BrODhSS0c2eVljWXdDbk9ISVRvMlhkTWg2SW9P?=
 =?utf-8?B?cXRrTjI3dGVMSmdhZ1pvN2RNTk5HSm54ZCthdkZQSGxKNlU4RjBSMUFWUzlD?=
 =?utf-8?B?Z0FQRWt5WlJBY3dwRHEyWldSWUViL1pVbGVuYVhTb2VKZ0FDalZwZEJtMnlm?=
 =?utf-8?B?NE4yMGxRb0M3TlVrcnRHTnNhcGh3TDEveTVtcXdza3FMSjJneWwzL3h1OWkv?=
 =?utf-8?B?UnBkZEtTcTlOZzlSbDJLMHU4Rlcya084Tzd6WVRtL2F0UUo2NFZjdUVXKzla?=
 =?utf-8?B?cUExTlF5cU9QY0FZclR1dy9wS0R3ZkF3L1ljUmtqU0QzVlZkZGFzd0ZqWXRa?=
 =?utf-8?B?L2dSNWRySC9sQ2VVOWJVejJPMUVKeFlnTkFWSWJYVklneTVRWnRpMnZMVkox?=
 =?utf-8?B?NFkwaGdWdk5IVG5lcFVWMG1FaS83Ym9UQkJvS3RZRE5USFd1bUM4eFlpQlNB?=
 =?utf-8?B?bXUraWxMbjJybmdKaWh2WGtVSlBFZS9DUE5PK1NxT3Jsc3NwTTRsTGliOUds?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?UnhwZDh5TTBKWnhKTTNNRHFnVm1uRkpQbWRnWjA1QnhLaEc0RU9xeHZ2eUs3?=
 =?utf-8?B?bTJmNDRxbmloZVNhaTUyOVpVSjBxV1JIY1pwOXlWNWt5Q1lvaVVHbms1dTBp?=
 =?utf-8?B?Q0JCSHd0U0U0QjN2RHFwZ0N5RitTYlByZGhySWJ2UnNFbk5GV2E2RmZBM242?=
 =?utf-8?B?K0tUellZV01aWjQzY0lsV24xZlJXQ3ZOZFZLenFtVzBsNmtvOGNNN2tjZzlY?=
 =?utf-8?B?RTdla1dNcXMvUHdpc29idmw4Vmx1YzNwTXgvKzEzOC9GdnpVQ0hsWWpCdWZR?=
 =?utf-8?B?K2FRRWhVdVFOVllaRlNRTzZDVDBEWFNsaG45T1RRdW9LMm42RU1rZVFYaU92?=
 =?utf-8?B?Rm5seG92VXhjMDEzQWhCU2g4cFFDcmdHVStTYzBkWDhIWjN0RFZSRVJLaEUy?=
 =?utf-8?B?cCtIWFovYkNSeXJmNStyZjNIQTl1K0d4RmhzZ3BkTndDeU84Uy9keUdRQ2pi?=
 =?utf-8?B?TmlZVEt4WXhNdW84MlZSUDd6Nkt5MkdJY29uVE1ydnNiT0o0MGNDR3hxTlN3?=
 =?utf-8?B?dm85WmkwRHYyVTlaZXN0YUdVS1FHR3p3QWF0UnNjYjEzbHBMOXpRTk1BK0N2?=
 =?utf-8?B?TlowbHJPbVBGZC9UNDdMbnB5VndoM0hoN1hoNkFxZk5EQU82NmJFUHZncVZI?=
 =?utf-8?B?UVRmbHpHeGtBZHdnYytFZU9iM1RZaXJsMXBFNzc0eXh6cTRkVHAxUHBlUGRB?=
 =?utf-8?B?NzJ0VS8zNUJsSXErdlFEck1vOWJ0Unp1d0VFM0RycGV2QjU4SWVNME1mcW43?=
 =?utf-8?B?Yk9RaGJGOHFXWlU2aGhxelJIVkNHUmZQQ1ZSeUZySW1DMmRrcUhZaEJ0Y1dh?=
 =?utf-8?B?SnN4QXBERkRBSnJ4b0Y3TTlrMmU1Z0lzNFlCZkxTcC83a3BUTWZWbXEwY0R2?=
 =?utf-8?B?bXg5Y25GOTVtSllka2VGSWlyRW1XaU1ZNXIzWGIzQ3RJa0ExT1JZbnhDS1J4?=
 =?utf-8?B?UW8zWFBpWmFvS2p6OXVFOUxuVnFSY2tORmx3WTk3SVlqUmlGY21qMHJwNERa?=
 =?utf-8?B?aFpCdTdkdmR6UWVGSzhPaWdGb1FVTUVVY2c0SXorYzRObXpWMHFPYmRtbDJF?=
 =?utf-8?B?V1VqRUhsM1VZdHV3QUROeXBNck10MDB1QnJLbEdMS2luL2t2U3FYcStqVXJj?=
 =?utf-8?B?cklvMnVDVUxWYUZWOTZpYU96MUp0Z3h0TGxuUit6aCs3NGtDQU9LZ0dPT2JP?=
 =?utf-8?B?N1R2OTRnRVpHRjlYZko5L2tTRjhGUjZRcEg5YXlxUkpTSThzSDhsV0dFVFJv?=
 =?utf-8?B?Q0svYkZCeGZ1aDZIUUxhRUsrU1Rnb2tlZ2FXa2RjK2RkZnYydz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e18d40f-ca3b-4fd6-d414-08db97fe7e5c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 10:59:10.3232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7HwleFaBZ8RRKwJcsQtTlpUl0dyCyyfxrZechgwqaAGfdwk4/4h6++4HBeR0p/xPHYf4jwvW6Jeo9NASLi2i6ClnCk5JeNM7oiz3ZoE5gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6931

On 08/08/2023 11:47 am, Jan Beulich wrote:
> Common code references both, so the variables shouldn't need declaring
> and defining by every arch. While moving the definitions, add
> __read_mostly (__ro_after_init would only be appropriate when
> !mem_hotplug).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

