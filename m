Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443AC7671FA
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 18:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571518.895560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPQSI-0007bB-Ei; Fri, 28 Jul 2023 16:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571518.895560; Fri, 28 Jul 2023 16:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPQSI-0007YZ-Bt; Fri, 28 Jul 2023 16:36:42 +0000
Received: by outflank-mailman (input) for mailman id 571518;
 Fri, 28 Jul 2023 16:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hHC=DO=citrix.com=prvs=56653927b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qPQSH-0007YT-8i
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 16:36:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb9f6277-2d64-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 18:36:38 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jul 2023 12:36:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6366.namprd03.prod.outlook.com (2603:10b6:510:ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 16:36:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5%4]) with mapi id 15.20.6609.032; Fri, 28 Jul 2023
 16:36:29 +0000
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
X-Inumbo-ID: eb9f6277-2d64-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690562198;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+4+ME/+CfYSB0RxXMcWR7td4MQyMH7Tl2mMrxfvKXJ8=;
  b=ThaNIKMkoLu1ErZfcg5SYTXUpuWpCtuyMl7N23uMTH0rPblYbZ5FKuE9
   wWoVk4UgA8Gz7AvYT2Ei6D+DoX7rIDC/ZEmwoxolI4Sb3Cqme1q4NLm/x
   /hfL8OYpCowiyRn3l0b/EqUpk9OwTqyOCOn0IfDzzSvf5NrPttakTm23M
   Y=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 117677145
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nQ2MManvott6oAeKoW4r+hXo5gwnJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJCDzSM6qNajOhe90lb97k8U0EupLRy9NrG1FlqHpkESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5g+GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ecDGA8mdCvbvMy756zgSMlKieo/Kca+aevzulk4pd3YJdAPZMmbBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3ieC8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeLmqaEz3AD7Kmo7JBg9VH3qr9uAsE+PSdFta
 HE7wywxov1nnKCsZpynN/Gim1aNuhMeUtxcCep89giJzqfW5C6SAm8ZQnhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdGyz0w
 j2MhDgzgfMUl8Fj/6+250zdijSg4J3AVBco5x7/V3igqAh+YeaNWYus7lTK6OdaG6yQRFKBo
 XssltCX6aYFCpTlvC6HTfgJHbqpz+2YKzCaillqd7E+8xy99njleppfiAySP29sO8cAPDPsP
 knavFoJ4IcJZSP7K6hqf4i2FsImi7D6EsjoXezVadwIZYVtcAiA/2dlYkv4M33RrXXAWJoXY
 f+zGftAx15AYUi75FJan9sg7II=
IronPort-HdrOrdr: A9a23:J+VIkqvrz5+nfWI5TBNJbKqT7skCM4Mji2hC6mlwRA09TyX4rb
 HaoB1/73SbtN9/YhEdcK+7SdW9qB/nlKKdgrNhTotKIjOW2ldARbsKheHfKlbbak7DH4BmpM
 Jdm6MXMqyOMbAT5/yX3OHSeexO/DFJmprEuc7ui05ICSVWQ+VY6QF9YzzrYHGfhmN9dOQE/F
 733Ls2m9JkE05nH/hTfUN1O9TrlpnwjZf7ZhxDLwc/gTP+9A+A2frBCh2F2RVbeC9OxLpKyx
 m5ryXJop+7tu29yFv632vehq4m/+fJ+594HcmRjcpQDCvqhh3AXvUGZ5Sy+Aotpf2p6hIRsP
 SkmWZZA+1Dr0nJe32zo1/W1xL+3C0I43vvoGXo+kfLkIjCXTcnDMgEuo5DaBve7CMbzatB7J
 4=
X-Talos-CUID: 9a23:QgyFoG2Yl/nYy0HxfZfNb7xfAdsVTVbH9y/rDUKfFz1raJuaZ0OV9/Yx
X-Talos-MUID: 9a23:ooXXSAol7cKnK4VFLzcezx1nH8ZOsqqMMXoMoIcFiYq5GhV2JDjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,238,1684814400"; 
   d="scan'208";a="117677145"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRrtsSnmkGg8xt6l6LhnH6dBvLxjq/JG0i2zqjzl9CewDhshMmwl3y29PCn+uW9oo3k4B8MLhDFHpeef9JiOS1quuYxqjiBwKqhxXI1J5/dgIB+AMAv7g4hMhG09K/x4rypgZN+CVwGL4483rmWx06+S065abC6w5fv50ndYhAzRFgo+KObkLJljXfOGwteWqlkAgaM/hUAzYl9Yuw1KFyxW2iPKuGdnz2gSdnDAo+JIoqJIkkFsm6UHYaHOhL3t7IMji0Jjh3q8QBeMwZakKhiDblLZOshDEI7+QTFPuyMnt2gBujv1UXGI3aWbvRH8n9wppAaca3cdy4YTG7njpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0zzenPVbxs7TV04LIa7VSnq8RdNL+ZTFwqIy8IIH6k=;
 b=OGwYBc6uifpCN9LnzmIc5NXBpQYkETVBqANetYCKAj/8APZV+9pBqLYyUvbafxfP63nd+cz7tSEEHACKX/kwlAY8JDEX2iEryLp8QoLKgRDiwUS5eYqQ2ZebY63uC3eJKLYHBetG2mzfhGMyHF+IuCEqk9ZknPxq1gSxAhnpMKxc043SNjaVyMHlv4n/dOwL5T33VpXeh1z0Ef8O0oeh6VVFmLKduyxx+cs0Hbqkb1BhkM3uNuzgpRUNleIpdFqz7C7ii9hnLjxlG19moUDqe94zQwwuM8TfOfjMKrlRqd3iw2qay741ooiaAxp8HZnbtJSNJTu9O60E+Z5Z0EtkpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0zzenPVbxs7TV04LIa7VSnq8RdNL+ZTFwqIy8IIH6k=;
 b=bcvutulc2KA6PzrAgT6lhX2PAEHKpkPHPArn1bgL9MT6HHaFUkkTXo9TXOtwsssIklYHCXJDntOF5+u4PedOOZe0NbybAtDoKY7aZ3fnLdmRQoI4dudjOSJ814x+cNORdI+QPmuAGwDiyuzBDrpqUBDME+nahyIhLwMukyrhp7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9f0b7ab4-090f-21ea-2cf8-6ecdc7c02225@citrix.com>
Date: Fri, 28 Jul 2023 17:36:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-6-alejandro.vallejo@cloud.com>
In-Reply-To: <20230728075903.7838-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0671.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aac4ad6-c4f0-45ba-4987-08db8f88cb40
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vPGcBSDfTipP1N7eICjBQ2nqHGTpTd9FNf4d1wDnvKmyV0F42lY8vCBuiQgXuZ8fjLJDxS274wHeWde+Co6hWvwZA5ndAFIrKs3K37kpwHgwoTDcJmW8ZbZmCI6K52QsGCcJIf5nCMyIcn3qtLjiQxkDlS01YZ3wAXh2qFFZ9l43wbB8Fa9UligYQ7opuxGy8ObVqAYrW3w5vrViXUX8EpVFJef3ceCPh0A4+/jq9jIM7PBgLQu2u9HDwGVp37NmFgZUCAf68IBgSueC31ZCz4UvzPyHtV/KDnCx2iwprvRFlwjovjmswJ4VGEGKjmlorUftZ0E4MbbQ8qVD82b7n1DVs5Zoahq5mu4RM9gg9hxTLPbXCjDakFxCjlkYNZ736Wa84syB/Oei4CMnAKYshdiuwx8/0QXWqmahfL5enzbFHDzt/RZqBzz8Yrp6/LtaV6erX37k+AoCbxmvZRuqSStEN0vQWCBqT4dj9DdN2OGHbPbisdvlQS9Qw9T25dKqrg8BDzMtMsMOCap+XH2bI3YtII0brKDJAGaUnpRNOFjP/YekQob2cijIr3wIMZFTJAg7ugSGW4PbphrPs/PomMMPtLMc7L+8VehE0heE/oy1LfJvV0aiCpMraRXqZwM3uPagQFCA0XlOEasBvQAelA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199021)(316002)(6506007)(8936002)(53546011)(26005)(41300700001)(8676002)(107886003)(54906003)(110136005)(82960400001)(6512007)(66556008)(478600001)(66476007)(4326008)(66946007)(6666004)(6486002)(36756003)(38100700002)(2616005)(2906002)(86362001)(31686004)(31696002)(186003)(7416002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHdRTy9mZ0lJL1FHY2tYQlRoY2VoR0hCVE9DY1RtTDNvSDRrZ3hsblVsMU01?=
 =?utf-8?B?amRNTjVDU3daRUNsbDdXa09vbDZwaUpmdnBMUVJvS2hUMDh4YzJWS05WZzEz?=
 =?utf-8?B?L2RrLzNtRlp1c3FmWmUwa2pORVdUVzhDcStlQlVUYXNRUjM0RE5MT2hodDJO?=
 =?utf-8?B?YmZqbTdVWVNrR3JKeW5CS0lKNUJmTDdJMCtybXVFWG13YTNLTi84aUdsMDhS?=
 =?utf-8?B?SUdOdW5vWEc3WUpGZS96cC9vMFpnOEtJdWsxdEpiZUJDY0pEd1M4ZG9EbDE4?=
 =?utf-8?B?cFRxWjVuWW5PUkx1cEFpcUZoV3NweFhnd0FDaXhqN3psY05QbDlENEVvQkNT?=
 =?utf-8?B?N1EwK01vU0NjdDNybDEwU1RXZVlRU0ZmVUVmS3VEbmJGVTI0YkhjN1dDRnNr?=
 =?utf-8?B?b1dnUWpTT0NXNlQvYXpWUGhySEtrS0JLaUYxSC9yQ0pOeUN6UWtvdHpDa1VF?=
 =?utf-8?B?Y04rNFNJL0lEUkdEcitnV24wUzkxNzlxZkhxbS9JMk44NTBvcW1HSjgrSXBy?=
 =?utf-8?B?ZlFqeDVQMWd2YnNvVlNhNXdXT2FwcGtkNlJ2RExzNGJXbnFkc0p5S1NJNC8z?=
 =?utf-8?B?bUJHZTJxKzlubjk4ck5TU0xkOHBic3ZLeFhER1lwbGtLZUxmM3FHS2dxdFR1?=
 =?utf-8?B?Q3RoK0RhNXRaejZaNzRib0VJb2RONlc3RVdmYmhvUEF5RzNPTk1zRlJUcnVF?=
 =?utf-8?B?WVBHU0llU2d0eldrcFJldEViQzNweGlLenBBT0ozMzlyS0N5Y2JQR1hsTXNI?=
 =?utf-8?B?ZnNBOFVicFVwcFhmSlc5SVNUT1RjUk14b0dxNUJWQVU0d01aWGxWMk5lTEF6?=
 =?utf-8?B?TFl2R29tbUMwd1FBbnA3LytBTm8wUEhiOXZKMzJOeGw1b2ZpT2xvYk9aUW5X?=
 =?utf-8?B?Y214ejAvR25yMWpVdHIrTjV3S1RXNUZ4K2xhTjluVDJuRFBRNS9PWnNMMlZN?=
 =?utf-8?B?VTZ3eHcwazUyOVR4TFNpT3AwSHpjU0Mzc1poaHlhTmRON3cvRDMvbThaTTVS?=
 =?utf-8?B?a1drU1lXQnpCKzB3bHBDTDMwYThtbExCTE5kVmNHbkJHS0pjYTNKZEpMcXAx?=
 =?utf-8?B?bFZFakZYbWRuamhjdVhkczlKWE9uWWhHSjloU0FJejFHalI1ZFJkYkh6M1FK?=
 =?utf-8?B?SUNwVUxpOFRFa1lpSVc0cHY2dTduemU1UjdyVENicUxuL3V5bDluVlJocmlz?=
 =?utf-8?B?VW5UNUgvT0FxUVZsMllVbWxDRWY4S0N3d1BKdXBMTkxZQzBtbTRUZUlwaHBk?=
 =?utf-8?B?b3BoUUg3cE1GRitaalRQZzlpb3gxTmg3WVp4L1BGU3Z6V3kvdTFWS2daYVo5?=
 =?utf-8?B?U3Y2ajF5QkdwdFczaTFEZnBBdHJVMlZ5d1FZcjgxUHdpSjFERjZQT3l4Zkhh?=
 =?utf-8?B?ZlZmeVdDS2hRU043RFkyNG1kWkFPdzdGaHluWG5ocXhzK3o2UmVrU2g0VHRn?=
 =?utf-8?B?azZMZjJmc054MFkrMmhZL3lVais5TDhGY1V4ZnZHN3NZU0t5T0w4eU5NTlM5?=
 =?utf-8?B?QjNiZHJkUzFOZW5PampKQVFLT3czeWlMVUUvT2lyRUx0REsvdDVjSXdVTCtI?=
 =?utf-8?B?N1ZSQktSZzZPTkpDeVc0Z3VIMm5LNzFmYkZ0KzBJRVh3TFpLU3FSMlErVndU?=
 =?utf-8?B?bzdPL2lmQmxMNnBYbExxMndTTG1RN2w4ZVhkbnlUNE9OUDFKZk9XdTJrcEdu?=
 =?utf-8?B?Y0J3VTVlWUpoQlFsUk5XV2RWLzZpQnJPcWxINWRaRjZEblI4Tkh5NGt5Q3pE?=
 =?utf-8?B?QzE3bm5xbFdRR1RuSzFjWXgxd21wRGNFT0xtN3FUaWROTVFpYWtOUDBTS2RU?=
 =?utf-8?B?MTU4ZUdxSk0rY0ZkS1Z3TjRUVTZsY1pTcjZwZXZwWXlFelhMcWpGUTVrYVA4?=
 =?utf-8?B?Ymozd0Rqam43dzVLT2ttN1NKMlZWME1scTQ0OWFxVmQ4cC81bGtoOEhWdW9y?=
 =?utf-8?B?am5vQWZvaWRvMXQ2RldzY2tFakFqMnRDd3Jyb0wzaHZwek1qNGZwUElyMU9X?=
 =?utf-8?B?N0VoMlBIS3ZGTHFvVElCc2laOVhTMXJnUzV6QnYvL2NxQndkck5ZYmxaVFlW?=
 =?utf-8?B?TTB1bXNiOU9JUkp5MWZ5bjdmUFBzMkljSW9XcVBVeUJFVTgzQ3FlVlg5WTIx?=
 =?utf-8?B?TzZtT2pscytHUWZieTg5UjI5dFJ2Ykd3eVUrWHNQbWIzRzZQdVBtZlA1TFBz?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bhRqmJMkvHUAnWBCwEkqn66f6Utkku/jBUMzlokqZcWPmCtMVWEjfy95xDquZIPU9R3uG9ngRRpOYBK91INls/Cy/mTUyfLiYufL+kAqcgAp3xDeUYaFdHptNsZKk9t9ekly8DCb81xDxLWZDWGxdO4KIsPHFzhMg/PPoZLnGHtEm51j4axkW2SUO/vm+aJ7nX/swiBlLYlplTYcDj8uOo3J1vE/+cOIYIRoYn8bGfkgUKrqvWucuVhs/2Hug3wOUVUxsq5zmTJoEy/d8hjIiCe0B9b+EKR+H8um0ix70VVbGO7bdpKUd0VOl0UqbggX7w5dZ9V5rh5kkh7qMiD4ctbPlDBXNDndYfDVvdDvpDet3QYgf8YyvOY2+43mW09z7FKfRQsJUIMlq82cSlv2zCzSs9MiSEohnu97ADzNrRSe6FYvwVQLk/CLVs3Cp1EzBOEmCuFMl3iU7ib1fr9yJVfni0sXPM7tnumrBp36ayl6TT0brUTewY2OQivASCgN+u+cvVquN26rA1tmR/8ViUtX8jBWeWesVUALC8d52OCmU+wbzd1Z6nW8mnTeBkdhIkEziuacYBb7BmPltQJTjUiG3hQjoZTHAetcJhNJV129sakc1ae6KnNoxgLLvcujB5L/tTU0X3jbc+CtFEKKBa3A2Aq/AmEJsuS3NYJUx88oQQKwTT+R4JzLFMDnwe9N9ui1/12TcSEa0zmkup/j9ufG0EHygeFj2o50sBpcHVMpbCbG7VBmgLOku35QSkLBKTQVyF9WYt6hcCUKQf8WTgA+xfHQ1knUQZWIjOVIPkYHwxU/xUhTHry8s9uWsXCCDljUo+c7/lkH3d+7WrJzs41fIxVQxj1+FNmqKGVEJbeUK9tNYS6JrirpWITs/DFB/smpwDcZX5NI+JYkSCtnM9fZkcdnTgRKKCxN5EZ9upA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aac4ad6-c4f0-45ba-4987-08db8f88cb40
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 16:36:29.4097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2cCElc81B1XV38+77IQtLU0AN60yUyUv+IZQy3RW4P93bKJauInzqY/aR8FEyX3L0X8tTqGvJ5mYF0KfbjIQE3qckvzzp/I0PScbN/sxMfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6366

On 28/07/2023 8:59 am, Alejandro Vallejo wrote:
> Adds a new compile-time flag to allow disabling pdx compression and
> compiles out compression-related code/data. It also shorts the pdx<->pfn
> conversion macros and creates stubs for masking fucntions.
>
> While at it, removes the old arch-defined CONFIG_HAS_PDX flag, as it was
> not removable in practice.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>   * Merged v1/patch2: Removal of CONFIG_HAS_PDX here (Jan)

This series is now looking fine, except for the Kconfig aspect.

This is not something any user or developer should ever be queried
about.  The feedback on the documentation patches alone show that it's
not understood well by the maintainers, even if the principle is accepted.

There is never any reason to have this active on x86.  Indeed, Julien's
quick metric shows how much performance we waste by having it enabled.

This patch ought to just rename HAS_PDX to PDX, and keep it selected by
the subset of architectures that still want it.

~Andrew

