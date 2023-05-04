Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E650D6F6CEA
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529765.824523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZ0h-0002JP-6N; Thu, 04 May 2023 13:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529765.824523; Thu, 04 May 2023 13:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZ0h-0002G3-3U; Thu, 04 May 2023 13:28:39 +0000
Received: by outflank-mailman (input) for mailman id 529765;
 Thu, 04 May 2023 13:28:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puZ0f-0002Fx-P5
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:28:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91d4ec42-ea7f-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 15:28:36 +0200 (CEST)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2023 09:28:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY1PR03MB7192.namprd03.prod.outlook.com (2603:10b6:a03:534::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Thu, 4 May
 2023 13:28:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 13:28:28 +0000
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
X-Inumbo-ID: 91d4ec42-ea7f-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683206916;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tMhNF3tjmiLpEHIrd9aTonEoqOY14bSGzTOIv+x/trw=;
  b=KKHGK9vE0ZidBzIy4D/rsz5vvdFuXVHEc0ZRHjGO75YA5u4/SYL6xtaB
   5pp2xqpG2VyH6uROz/oDT5E47632+knJmJB65HzyaCSvx7oKkjAuLCtSw
   GEHxQ8xTBtLsqCkKprqy8RWxt+Ut3RFcXXnpJ6oNjmzM48+CaYV0craQi
   k=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 107883195
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IzEegaPgnlvW/h7vrR2HlsFynXyQoLVcMsEvi/4bfWQNrUp3gTYOx
 jQbDW+AP/nbZGr9f9hyYY7i9EIPvpHRnd9jTQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5gBmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rx4HjhFz
 fBfE2wUYxym186IxLaLTfY506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/RxvzK7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXwnOrA9tDSdVU8NZnrGOTyUsXByc2UF6gsdiot0emBdJmf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBSBRf5dDm+ds3lkiXEowlF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:qf7UOqnkZ6gdZOO83J9igm+Jz2XpDfMxiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msjKKdkrNhWotKOzOWxVdATbsSl7cKpgeNJ8SQzJ8/6U
 4NSdkaNDS0NykAsS+Y2njHLz9D+rm6GcmT7I+xrkuFDzsaE52Ihz0JdTpzeXcGIDWua6BJcq
 Z0qvA3xQZJLh8sH7iG7zQ+LqD+T5qhruOVXTc2QzocrCWehzKh77D3VzCewxclSjtKhZsy7G
 TflAT9x6O799W20AXV2WP/54lf3IKJ8KoOOOW8zuwubhn8gAehY4psH5WEoTAOuemqrHo6jd
 XWpB8kHsJrr1fcZHu8rxfB0xTplBwu93jh41mFhmaLm721eBsKT+56wa5JeBrQ7EQt+Pl6za
 Jwxmqc875aFwnJkijR78XBE0gCrDv/nVMS1cooy1BPW4oXb7Fc6aQZ4UNuCZ8FWAb38pouHu
 VCBNzVoNxWbVSZRXbEuXQH+q3mYl0DWjO9BmQSsM2c1DZb2Fh/0ksj3cQa2kwN8ZosIqM0kN
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOMl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wt9ihn3ek6hlTAfsuvDcXaI2pe1/dI4s9vTPEzYs
 zDe66/WJTYXCzT8YUg5XyLZ3AdEwhZbCQvgKdJZ7u/mLO7FmTUjJ2qTB/yHsuaLd92YBK3Pl
 IzGB7OGe5n0meHHlfFvTm5YQKZRqW4x+M+LJTn
X-Talos-CUID: 9a23:Ezu5Rm6tIC/7wRuSxdssrkELQ8sdfjrmkG7dL2roJVhtTI2SVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AjkwdDQ7eUoJwhORvXUSA3cnXxoxlz5quB2cJnq8?=
 =?us-ascii?q?mvsyfJQ1hBj6F0jSOF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="107883195"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4d5dFsC43DHD09xJGtFYg87Mx/e+ZnBeEiEzaBU8ljIxpRQOzYMt90lFtDhyIHyAewL7Z2GWMTBSvrbiLn30FHsVE6EEwPyEH+tbbxIwWFkzgGv4b/e2DWi9dW/B709Ry0Q5T0eYgZjdElssundow07gXu3DKS/bgvWO7bS/0Rz4rVm/YqzL0N0s9oU9YJ0sk9ZR+MmlYxNrQ6z4tiRX2/T7DMA9wIq0eSrAUl0ilDUiVyaDrdvVBmzWyrcHcnl7mbhctX1qZMAOxcCM2lJWBCABOz43NxNBsGn4iSaZhdO61OBurDGlhu0U+hEIC5AAzX84LggDFJ5ILXgEQRClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMmuhkZuM146KCfqk1A9ON90F2AnP2kioSb1kYH7Asw=;
 b=Gkq+N1ixduwaTugOu8n3yxlKIdcSKvbgEAAaY/Lg3akN5ub7vlxRKhfcMs1vUVwbaMvk3EYjqvW2q/AqCwVmU31Kp9FBznXOj5fkjmlAuwvYfvsOy89SP2WauVYT+p0sGK4f8Q6ELq6U1C2b5o1WF8pI/MKAFerw4F6ha4nBK/Ef5jvk/ZYqGB8ACmX5wDo4AvkDNyqXEWJ/0VUvKJqHOzSTv1XZ2dw3eHklvd9AtI9V+OmlRMiO0JeBJKH5yv2qSv3FXMVhWdoOm5weLbhTRKevRyiwJ0JmmfS/NbfQaJJUJCCYz2IyI8T8/+/NUHHRIYeZ4sfsjoe3eZ2G04xKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMmuhkZuM146KCfqk1A9ON90F2AnP2kioSb1kYH7Asw=;
 b=IavGi9YWq5B3o6x6FVqBwq+KhAGhUFCgH30X+pKmE2qDmM2XL5bHzS9jrlxHuCfg0QjXzal12UjXN8UwFfICnJOu3LBv1L7j+JJr5UmX5x+CLB/OmkM+1QUh6raS4c7MOUOSJw55ZZae2JPeYsoXCyPoyZ+KvixldenO6/O/q6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3b82513c-f726-61e3-d3c6-9ad41c5db6ac@citrix.com>
Date: Thu, 4 May 2023 14:28:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/bitops: Drop include of cpufeatureset
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504130755.3181176-1-andrew.cooper3@citrix.com>
 <12008cc4-965e-9d7d-b655-95c867b3bcb2@suse.com>
In-Reply-To: <12008cc4-965e-9d7d-b655-95c867b3bcb2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY1PR03MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c81d71-2078-43bb-a51d-08db4ca37256
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kLxRdM1qBTUcJ8Wc2FffNyCHcNJFYEl1td7RzE4ZVtYZQiCVMp9A7xcS8vuNB6mIHVX3k/kSp8+l/a7BgEp2xtZY6n5APRT4EMrROzyvty45wkzoTwqN4gF98N2ntLv+T05hRT9WSSKcwwzrBP9aiul5oAJ8GlTnnySx01tnP8oO0EjDHUbwReuKLKONA2gQofKqGcO+gqMtzTtQbfO4xgDrd7X2PbyvVGy4FSiFZvSd2rhj2TF3GfZHekTq7WzOUDzSBmXoIlx1NrLw6RQFH88qfCeagb/YMXCI/t6yURI0mMTHOEEK1rgmX+0OpafyDoY+/5KeAaI3mesh6MSCXAm2TkxuqIZb+3U7Q8AZVzNqVBqB2Pl/to3/LdeROEXq6k8EFzLCL1Lkp2tfF47EKUq4z9mVW53xwHQ3sbCIcv7sJI+0UBDFO59+8J4s7zK/i7LK1hCKfHm5L9woPSu29KpXajGdOI+Kc9Bu+22ho01pma3mnmvu8fOQN54jIbD535BvL85mXTnKX9e+2BfvfZL738Sg5F0ivxzndRQrZMYC3YJsJthSCHV4D38bp6r9JBbXqspWxQ44OF/I91XRuzOKwgtdOW59cdyy0R+/6xahif+/iEjgVI0+X6oew+/TS1UuErRWSTxXq1Xa2PvexQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(6512007)(6506007)(26005)(82960400001)(186003)(53546011)(83380400001)(38100700002)(41300700001)(8936002)(5660300002)(36756003)(31696002)(2616005)(6666004)(478600001)(2906002)(54906003)(316002)(6486002)(8676002)(4326008)(86362001)(66556008)(66476007)(6916009)(66946007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG5IMnc3RCtCS3JBbnppYk81NVBxN3pwRHU0T0JiSktpeDJWbzFudldXS3J5?=
 =?utf-8?B?QnFEQXBZZlJNbHIvOGFOSFVUME1PajBaWDhNdUtlbTJjZXl1dzN5ckI4cUV5?=
 =?utf-8?B?MklnS0FmNzBnYTBXdmpLNWJxUUVCYyt2eHZBZEN6L2pDckVkOGVOVStHKzBP?=
 =?utf-8?B?ZmQ5V1J2eFdkOUVKL050NDRVVWJVcXNtTGlxR2JIV3c3eVdiVzJMUnVVZm9w?=
 =?utf-8?B?bzM0bVYwcDgrOXJXN2hYN3BIQkRHaFVKYm15Qm1MYXk1MEFYNlR5cEpuazBF?=
 =?utf-8?B?TXRxa3RHN1NmOUN5WEN0Q1JVend4dDZFUEs0UlN0aDFTQy9qYytrSGdWaVB4?=
 =?utf-8?B?ei85azF6RzR2V2ZqQ3JtUWh4UXhDVjVwNW9SY0hSTkpPQnNrQjZQa1FoSWRa?=
 =?utf-8?B?SUQ5MlEwdUlPaXRSWFVLeC83K3pNTUhQYzVoTzJGWkpQUkJENHJmUmlKRkg1?=
 =?utf-8?B?bDdMeHY0d3RLWXJwNTZlQVRHNVpXSE9CVFhmOGJZRWVZZzhHbTRMQys0ZkFB?=
 =?utf-8?B?Y1dub0oreXZHaERLbVkvcDhUbEhTZk1ZZnU3MlFlTlk1bzNuWitYb1hQN0JE?=
 =?utf-8?B?NTZIYjNPdWZFUTM3ditmem0waHVhR1hKbjVjSm5wSFdMc1BWWEdENVNoajgy?=
 =?utf-8?B?TitFcFJOUXlBQTlDOGFSTWl5Z0sybElGYmpFVy9lUnJhV0hsSzgwUnMycHNr?=
 =?utf-8?B?b2dWek1SMFRWeEptSDNnbFlSZlNUQ0NrdkU0L3BYdTI1WE5MdWwzOEs1UTZJ?=
 =?utf-8?B?Z3MwaDUwZ1ZYRDRvNVVmaWpxbjZNellpU2U3akZOaHVMNFA0OWZNRWxiYitp?=
 =?utf-8?B?U2FpT3RyYmNzM0tvbzlzM1c4MEE5cTZFbFkvdDEyYVJMdHQxR1NVR3MzZm82?=
 =?utf-8?B?RzRQd1BPYnZPajJHMTU1c042N1lTaE5ITU8zb212VURXUlh1L1B1R0ppT1A4?=
 =?utf-8?B?RUFUZlg1RDliWkx0WkxyVHJkRlRyOHpyY2o0NjUyUmhxQzlPZmJocHVoSGFI?=
 =?utf-8?B?aHZ0THdKWmZ4ckt2MHZOV0psMThpLzdCQUxyeXZOL2NCeGVBaWZzSHVZZW96?=
 =?utf-8?B?L0xQVkVNTElwV1JWZVp6UXNveDdmMzEvQ1dyQlJZYmNSdFNYK2RFaUhnRFl6?=
 =?utf-8?B?Y0RvTUFhNXFzT2JubTFHd3VScmZWRHRBYjU2Z0NTUm9DdjN5VlR5RUF1dERn?=
 =?utf-8?B?Z1RZWnk0UVEzV1hmS0NyL0JySWRGKzRDVWJiTmJJRmxGdldVdUc3NDNSSitL?=
 =?utf-8?B?aDBEQ0VVaDAvcjg3NGJGM2Vjald3cElHeFllRWpqcllZOGhqc2IrQy9pczNx?=
 =?utf-8?B?U0NEMGxYTGJmZWJvR1lDNGQ3czlLZkNkV0lwOE92NTZCZmNkZlZtenRzVnk4?=
 =?utf-8?B?QVExQWRjMHVJVjloMXNxSlJqRStWY01oUlpKSTUyNStpc05Ic09XV2Jkd2lW?=
 =?utf-8?B?MlNIVzA0Z2pNOVNkU2V2ODZKTSs1ejN0SVZiOFNMRjZFSWM2RnVxSTdWbzk4?=
 =?utf-8?B?SElrY1lSNGZaYjZMNUZDMDZZWUxWL2xUUFJjbW95aXZhZ003ZjhCRlE0MHM1?=
 =?utf-8?B?V3BsNlpXaVMrNHowNHE1SHZET3Y0K2ZILzVQYUh3RVhyMkR5anNNdkd4UDJl?=
 =?utf-8?B?Mis1b0FOTllaMUlnaVgzSEpBZDB1Ylg0VlNxRURGMkhYdGp2OXRqRDN3SUR2?=
 =?utf-8?B?VGRzNTBIQU1Ib2Iza1piRkxxTmNpRGdaTEFpNG8vU3FkWnEra0cvQmllYW5H?=
 =?utf-8?B?Z0I1RTRTZU5qc3c4OTZYZmtxYnFodmUxZmdwSlBYZDBCOS9FS1d1bkZTUVQx?=
 =?utf-8?B?Qk1qcG1uVUw0bVJBbEtuU1BSbm55c2VQYjhZbnNYbUN6NVVZNVdUVWVxdXJq?=
 =?utf-8?B?L3ZROHpnczRRb3hmaFd0VUZIbXV0YWVUckJiSGtxNUFrbjdCVHRUNGRWWXla?=
 =?utf-8?B?WVZrRGtQSEdDZ2t2OC9uQUgzTkQ1Y0swaURhZkRhMndQeFRudUdxdWdPVUFo?=
 =?utf-8?B?a2o2NGxaVGUwejBqSG0wV0JKVDJIVmt0SnpNTzkraEdZeWNpbnJYK0J4VkVl?=
 =?utf-8?B?dmVYb3FyZHlyZktSdDZjenhleXdhZExNUllkL2Z2eU9sSGZOLzJnVVkrM0Zh?=
 =?utf-8?B?eWFoV3VPVm4wMWMvdDdwZGtrQm80T1VwWlZBQ2Q2L2dFTGVwaW5KNGRnWlR2?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dpwA8+zQ+JJcEqz1RmGsPXloTpCrfet5vjdVqNb59t4BzLTDIPRfAzZDuZt1I0rhz7dBpKl94Io+AaOep1PAdJp10vkJmxYK8oSpUd/NgoTK6yYObaq2P3zf9TuXZpO2B7AuxDgwfo7UpkIarWQ+JixXdGhvdDNdgfBSpNacEju6bkzN+HQRf7HWJI4z/NkR7SnsKZdx7cHV7z2N7TA/rbOZ1zX3PWJKPS6ZhtRyH6jwM2RJyTerQrfEh4e9MznWtAdiNSmhMTllqyeicCDDMPibrKztPUcV6oMXaVCGrqGlv8/uEJTuAh6Na3yCzn9QM0T6sgszNGBII+Rk5nrG097w/23DmpgqNFIisCdlIJ12EDSuFNlmf29U+PxR/9gEwdiFm4OBhnaVz6A/UWtUGtWTWN5C/vdIX7eKc9na2M7UFmUU3etJV7TbwRtdKsg4BHMswS/FGSB1cizA0WrD5MNi+2eSg56F85bWaov0/j0EcD0+r6MlIxy3zqw+t5cN6WVVTUtZ5VG3YekLvIYTpq1ufhmNKvjm1Lmk7ronO2EJOqmKr4Mr/R4ylT6uCQnojNY6Dj7C+tj5gycT4Byp5eJ3NcFqSusTNNR9/gNTEBycMFd0VAK7EkWUblvaWzkK/ivj2IOwMHaiHeBhqiFk6s5+fPeS+VrTTOeCUs+4b4m/dOC+1oycOuHHEdo8tiBSevgKL0n4cKNYirsKIuBpM4OG1+NNLkntl4dxnKCJqMZ93tJK5ZiIah6oitg1eFhbA6XkIRIybyrWMLjnad3R1C2K4Emp1XchZ0rO7S99D0/nRhUi2b6uye6hM9GGTMnX
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c81d71-2078-43bb-a51d-08db4ca37256
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 13:28:28.7754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+TsBeQnU1ohS5BtHtKjZAZ62Lf2gQW+PrvRJR45TEIWzMdSWnHcVBR4y+Ca2fo0ZEFKWfrQLRiZfRhGe+r+DHfl3clLcPHG+Zu6jI7i8+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7192

On 04/05/2023 2:20 pm, Jan Beulich wrote:
> On 04.05.2023 15:07, Andrew Cooper wrote:
>> Nothing in x86/bitops uses anything from x86/cpufeatureset, and it is creating
>> problems when trying to untangle other aspects of feature handling.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  xen/arch/x86/include/asm/bitops.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
>> index 5a71afbc89d5..aa8bd65b4565 100644
>> --- a/xen/arch/x86/include/asm/bitops.h
>> +++ b/xen/arch/x86/include/asm/bitops.h
>> @@ -6,7 +6,6 @@
>>   */
>>  
>>  #include <asm/alternative.h>
>> -#include <asm/cpufeatureset.h>
> Prior to your 44325775f724 ("x86/cpuid: Untangle the <asm/cpufeature.h>
> include hierachy") it was asm/cpufeature.h that was included here,
> presumably for the use of X86_FEATURE_BMI1 in __scanbit(). I guess that
> wants to be asm/cpufeatures.h now instead?

Oh.  I missed that, but nothing fails to compile, which means that
there's a prior path including cpufeatureset anyway.

I think I'll drop this and leave the header rearranging to a later
point.  I ended up having to do the untangling differently anyway.

~Andrew

