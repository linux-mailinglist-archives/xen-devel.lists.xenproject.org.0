Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC766FC36F
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 12:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532061.828054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwKEB-0001CN-L1; Tue, 09 May 2023 10:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532061.828054; Tue, 09 May 2023 10:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwKEB-00019i-HH; Tue, 09 May 2023 10:05:51 +0000
Received: by outflank-mailman (input) for mailman id 532061;
 Tue, 09 May 2023 10:05:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vSxc=A6=citrix.com=prvs=486b9cf0a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pwKE9-0000uX-H3
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 10:05:49 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10c7f51e-ee51-11ed-b227-6b7b168915f2;
 Tue, 09 May 2023 12:05:47 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2023 06:05:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5893.namprd03.prod.outlook.com (2603:10b6:510:32::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 10:05:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 10:05:39 +0000
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
X-Inumbo-ID: 10c7f51e-ee51-11ed-b227-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683626747;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JWvIBREWyZzKb0kfTWlXYxd6FpkTz2KcRJ+zN6VGspA=;
  b=UV5miD8pCGIzP+dsClSsCpyA/ApliMTagDwmyiP6jwhK0wtwK2QRC+CU
   voyBupJhDBH0hyic8zqNuKIsK4esQBwnC+Mv8+bVvyw2Lfhcgo0UQQSGv
   SVKzizYyri7aYM8HSnz21h69nwyNtr+p4kiKD2cHnpn8cR6QlUVB4GYQP
   A=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 108385412
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vUG01aBzWTIHORVW/+niw5YqxClBgxIJ4kV8jS/XYbTApGsk0jMDz
 DBOWDyDMqqKYGfwL9h0YI+08UgE7MLQx4VlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A7wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw48EmAGNUr
 PskOG4dMC6P2POQ/Y/mVbw57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDK7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXzXirBd5LTtVU8NYpi16R/TcLNycXdkCCu8e0gVSdS+1mf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmEzqfW6gCVHG9CUDdFbNEks+c9QTs32
 hmCmNaBLSNrmK2YTzSa7Lj8hSO/P20ZIHEPYQcATBAZ+J/zrYcrlBXNQ91/VqmvgbXI9SrYx
 jmLqG00geUVhMtSjaGjpwmY2XSru4TDSRMz6kPPRGW54whlZYmjIYu19Vzc6vUGJ4GcJrWcg
 EU5dwGlxLhmJfmweOalGo3hwJnBCy65DQDh
IronPort-HdrOrdr: A9a23:3+HpcqyLPGCGSgX3dZLSKrPwT71zdoMgy1knxilNoH1uEvBw8v
 rEoB1173LJYVoqMk3I+urgBED/exzhHPdOiOEs1NyZMDUO1lHHEL1f
X-Talos-CUID: 9a23:M/l80W5cnQwcOxpw6dss7WlFG8I/K3rh3CnAfXG0VndPdYDIVgrF
X-Talos-MUID: 9a23:ziHhrwXgid59bSjq/HznhzNZb99X2aWNE3kXr5gNoeqUChUlbg==
X-IronPort-AV: E=Sophos;i="5.99,261,1677560400"; 
   d="scan'208";a="108385412"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJm5WPOVZ/co4GakWWtgHILjhIA3dZZqqfQu5GJkJHRNV8AjOERFjL2eapsODmRjWrG6oo6GwWvtCiLsZot389iSFc8uSgodycF9U+nqhXXo0GYOcsyHtxQq9ktT2q6/K6d3LWKbVolJK1gfH0J5a7NonnDhGcbp8R+2Pr0xxvhQqkGkYYNHs/Fd3wHhffwIFeB8sFwZXhnIq0qSzjvQb53CvUXVgjc5LAYg3sXt8hBKfiBg5XKFxKXK4b6b4qtQdP8mV/egdJCzkiXM+uBq495OoKH3zf6CZOMIL+weapwyvNo2Mfyj/NEwstPrlvqvYz2zzxXDWIS8nNynbEp7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbnVfteE5M1tOHc/qDAEDGwPiaan2F6G/eKjEWPY47Y=;
 b=li/eccHX51rNtCJoAzt3EIy5oYcpeEacA4YiQ0Aq49wLB1F4lT39NpBd9xTg5vBzWAs3nfoLmuNKSQkYZd/lHKA5lEIou9FcpIMaamwMmuibGMXbjKcetdULNLiSA/OMTJ5LW7CtlJxcavoKZk9kR1efaVPE2JJxZl04InLj1ID6vE25p+nc75KEbzF7cRlMKMwAWK/LcqXRUWFpDVVrxEoI0IKCBlxcsoXptDkKD5oRA9a3XSHZFvebOdhbrhNVChl7xrr1awf5l2nwRNDQRF88BxKFG1aeaZf8woMS/DQGe/ia14Hh6Gx5xfROS8v0TAtt5KrPA0Eqk4DaHVzZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbnVfteE5M1tOHc/qDAEDGwPiaan2F6G/eKjEWPY47Y=;
 b=OzkVVIVRvN2fOSAIm8N7tdrZT7KST6lHN1+24fCQP36CWtzC4wLJWu9JN5vxls/AAo4jKdo/g5dSLg1aPsxnUBUMErMD7hKcNRl8Yu0WNkxJkAg8bdaejZkdJdcZhQZ60dQB4eNprn+cQXFloilbf2hZm0KmgErbSnPziVrhG3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d0794e7d-604e-044f-000e-3a0bde126425@citrix.com>
Date: Tue, 9 May 2023 11:05:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86: Use CpuidUserDis if an AMD HVM guest toggles
 CPUID faulting
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230505175705.18098-1-alejandro.vallejo@cloud.com>
 <20230505175705.18098-4-alejandro.vallejo@cloud.com>
 <d8c9728b-b615-7229-2e76-106d81802a20@suse.com>
In-Reply-To: <d8c9728b-b615-7229-2e76-106d81802a20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ca883c-f072-4c91-88f9-08db5074f0f2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y50xSCv/yKLIFYttO4h1KUwBSwoTplckc/iio9FWQXtq7ctlIRV/ZODeg0jHPtH5qAIR4GWsAvICu7rJEATDC8qWHDifH+YOyVjQO768WGfiZhopWEzS9f6iYznTdaxuVTdYwuYecrZXlkQT4qOYIGPQuTQaoe8mfrF39Apd8boQwnsGTdryk8ryT1Wul1NiQpzVlREkQ/TrCaXQ+bxka3mDkxgJ/X4bGQpw87/6MuM+wmTiuaMBAnPtNeRvHfaemXf+A8Z3vxxomJ7id7G8S0XVfFf2A1MSgJBzN1T7ymtIlNin8xA2eCYG/inXfe3Q06EJvVWtTNpxhtKPBKbh9tELDA7B+U1oRtSivnsCzwv84Vmt6Se4IWX78FHwqTIVEF8kTeJSFHzK/8Hk/6ve74LfYoymUHskFWrp8evcLqKXL8McV9nh0S/n0YhPGwbBqD3soxMygaU16Q6Bjm3sa1J0ESTY+UoCNl6Y9GXY4eDcQtOIohmWAa0UF9wsd20CmGeWSahItNp3VrdBGoOxAW+EV9IZyeMZMGSIqW1U7W+l1U6QUHrg+7qXoadmqrHdSLWUkdpu4nik/SNSk6QNyMjIb9OhS/KzCvwAvxPJs7neHKdT/sRexM4i7BsjWhrbT9fHTE4Ub2I0+5JUjxS7wQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199021)(6666004)(31686004)(6486002)(110136005)(54906003)(38100700002)(4326008)(83380400001)(66946007)(66556008)(66476007)(2616005)(31696002)(316002)(41300700001)(86362001)(8676002)(186003)(8936002)(6506007)(478600001)(6512007)(5660300002)(26005)(82960400001)(53546011)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akduQUpXQWJYeUFMQmVxSVNNK0dWWFJuOVNMbTU4bEVCb1o1Y2lTdkxaOXVr?=
 =?utf-8?B?L0N2NHpNY2MyZ2dCNjVTN0cwMEZjQnJDQkJHTFNyNjgxYklnejVWSTRFdlUw?=
 =?utf-8?B?NENDVzdTeCtjY1hqNHVENFNyMnFlejY1ZDAxeFJpWDN2TC8rZUpPV1NqVDN6?=
 =?utf-8?B?K3JjRDdnaGN3QWRSTDAxV25vbDA2TjlTWlFUZjVEQ2x6UExGYWN5Q0dpR3dT?=
 =?utf-8?B?QmJqZlNEbkJ0bUMvQkVsajUwRFZZYWtlOE5YWEtocWp0S3dsUE1NMVl5VEE1?=
 =?utf-8?B?SHJNMmRTUUtwSGdJR3lwa2JSUWpHMDNpdjFUbVREdlQveVFoOHhwZWtER2ZM?=
 =?utf-8?B?UTY3U2hGRHUrZGtYTXBqY056eGZocCsvbXZnMDhycEFqYnZ1NTFyZlFFbWlN?=
 =?utf-8?B?TVUxZk1aeDd5ckhkbGJJQ1BHVzQ2Q1U5TmQ0Z2VZSldEL3R0WXR4MlhIUnR0?=
 =?utf-8?B?TmdBL2hqSVltWUhOeEl0cTBIeWppcVBISDlRemRkU3dxbnhOU0JERk9aZzd0?=
 =?utf-8?B?TTl3ajFRQzcyWUdqdDd0enFTL1ZwZnA5bDZCZDZqSG9saC9pNHc5TEY3MW9a?=
 =?utf-8?B?dmdZajloUXFmcG03TlljRHlnTGhONGVsM0Npc1lpY3gzMW1zMlRqYWoyeUJN?=
 =?utf-8?B?NytHVXFjTmZoWG81dkZsVk9IVHVRTE5tUkdCVUFyYlZnZHRzRm0rbFQwTGRq?=
 =?utf-8?B?V0R6NHlvRkZSSGx4QTVQa1AxdTZGUVZrQUdJK3NuRjJXRmtqOW14Qng2dkdC?=
 =?utf-8?B?OENpRGUxU0ROQytSS3IxbWtTcUNtRGpiZ1FrTlN1Zk5TZW9kSGlZc3ZMaVFj?=
 =?utf-8?B?OHNjalFoR3pDUytlY3ZxaWhSdWhvQ01TT3Q3QzJMWVlaV2M5YWNiQ0l6OSsv?=
 =?utf-8?B?ZXNlU29YT0ZBZ2RCNmRkK1FaV2ZlY3JaSk5LUzNNZ2VRU3dJL1Btc2VGQ2hu?=
 =?utf-8?B?RzJqbjhEMjByTkZwWXBjRzFNZWllTVBITFFjRG1NcWgvL0dSK09kR1Z5OWdS?=
 =?utf-8?B?YjNlTjk1QWRPRG9jVTZ1czBoMDl6ZHc5MzhjdDFtZ0JhVTVRRjMyMUxXNVFh?=
 =?utf-8?B?WjVjMEp6Z05NdXpJUlFMUFZXOUlpUU1FYlRoSlBTSi9BcXlxZGxVSmNSVita?=
 =?utf-8?B?dGMvWWVCd2VVSG9TS21GZndCbEJNeUkyQndOK2lXVEhtaTl1MUxVWmFBSXR1?=
 =?utf-8?B?eTlZdS9GLzRINTRIbDFUaEM0SzBka3Z1N002VlJKWHc1N1lma2FjYSt1eG9m?=
 =?utf-8?B?L2NaMFhnbVRrNU1EWW1DZWZYUGdSRDl1TDFjQjByMnlkaG1VaG0zNnIvd3dT?=
 =?utf-8?B?M2hnNE1XWGJjcHFQQXQvVXVmT2g0RDduRWswTnFTSDlBTG9kVlFoUjNPcDZB?=
 =?utf-8?B?bktKWVY4NHArcnJiRWtHbmdXQVUxc2xOMjhDMkRPRHYxaDhJOTl4TVlBQkhn?=
 =?utf-8?B?b1lCZUZkWUdaa05Cd0szWmVFaUJCRVAzeHhiamhyc2t6V0RkUTlWbk9vVEhO?=
 =?utf-8?B?d09TeThJdDVBcEQvWUtBNEVCWEFjWm5wWEZKNG5kOHBYdjZSNEFaQm96TjBa?=
 =?utf-8?B?dXlRMEJBbGhtcWlGV040RWtmQlgrVmZLUTlmbTk3elNUeDBuMERNNGJ3N1RY?=
 =?utf-8?B?akJRZFM0L0hhRldWZkQ4SjE1TnkwUHZ1eEFraGY5eEtGbEd5SmJBTERQem9W?=
 =?utf-8?B?R1ZmUm45SjErQmlxTW1jeHliYjlYa3VKRkN3TTl4K0gvWm1jYks5U1NPdkRG?=
 =?utf-8?B?dGxMdDdiSi9oQ0xxQ29hQjNGbVQ0emVMWmRMcnhaakhnRngzR1hWcE1RZlli?=
 =?utf-8?B?a0hpSlAzM0hUUFZ2SkNPZ1VHZGpvYmd3WUlRNUswMTE2aTltbmtBWUJnM2lX?=
 =?utf-8?B?eGM1eWtRVVNaNXFyQlhDL3ZMUysrT1NjVEErbDBQN0tLUmRzREJsb2FzTzZJ?=
 =?utf-8?B?d25vRFBEYk1GNHdqZDQ3TUEvakl1UDJnbU1NV1drSVdQN1pkcUlKZWx4VzBy?=
 =?utf-8?B?M1hQUGJMbWlFL0NXazJzUlh4RDFuRjdCTGZ2eTJXOFV5VG5qT0lBZmlGdWw3?=
 =?utf-8?B?cnppNldaVWhUQWlhWmZwa1F4RmdhaUV6MC9XR2NCanRyeTBoU2V5dW9sRVBF?=
 =?utf-8?B?dHlpWWh5WkluL3RtelNRbGVTYkU0ZVFEVm9ES1V0TlpSZzkrSGxVMXlua1lL?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cl04r7woIPGXU5UJGsCca5jcUN3QYq6VFZkU676heM+Himj289S4n7sJOgc+LSpLBMGcRUYu2xY+cGToOkLccgSoAvJHg11muPKr1oc+BIH81V4hVooH6OI3EyuexCwqovwxWwi9rwgy2s+UQ4sH9d0TX5ZRJre2eJe+h1ZhABhHOV9jdnoG2t0ALjBV7E/O48hxEH3otLY0S2QqUMOeEYUOUEojJLLS7Y1EsszBxDr6Hu3xKCIGrobnTc0XVL/EPN2fem3CyVsj1AtwlPmp0ZZTi7+Jcdbmlt6PU6ST6q6/hPxqnHwWWZYRkLv16LZNkLzF5PJ+Ez4HaemXEvoh3Xgmr9BXVroVX+2X2sK2CShBNeCdf+pRHlgtUF1E6Iy7Alu+tLNQsgptl0XxYvxw7525XTp/tSV0r15dOc7niJ+6Ngdp5f2zRyTM9RDAav7TEyHZPEPZ5U5i+5ROyL7lrOQpfS+e0dv2DiIofEEK2NuOyOArneI84JE1m6koY/krX6JXf3QQKzoFp5NYo1VD+k3DQedUcDpHAnfu5j1nfv0ybNs6YSjZo8MSGuhBjxMfjbL68U1Hee9L35NERYE82zj4DeJxAcbzploPCqWfWwhEADfUyzB3C7JEsEbMpv9u/Z8gZ+X0vy80GNZLpnMTQS8ycUDzU5LIMRRlM5xTdva+iRCtE6rzTRSIiy7EHdEhkMwQTgOCBkfaOfqagIosyea+KIz5h9Jn50iPwJltjlof7pk2r/nYI8sORHBWN04emwHhy1f2UKaLi8kEu5k676BqSMVJAZSCaYNJLCXztqqXYEGVOi5KliqD6IwK1toJKsmXXoIuE2WoxugexaX0I+z9SKLB2FLBwwNxV4RdwwM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ca883c-f072-4c91-88f9-08db5074f0f2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 10:05:39.5024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmXucxG5JARxy2oyy+LSIJdAaWNay+AfYMctxoCQM5nrqhHn9wCqDFGHHcXhHAgvcdEhsmQUQkk34GCqbCxZ604rkLSygH8yl7erhxRfyFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5893

On 08/05/2023 2:18 pm, Jan Beulich wrote:
> On 05.05.2023 19:57, Alejandro Vallejo wrote:
>> This is in order to aid guests of AMD hardware that we have exposed
>> CPUID faulting to. If they try to modify the Intel MSR that enables
>> the feature, trigger levelling so AMD's version of it (CpuidUserDis)
>> is used instead.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>>  xen/arch/x86/msr.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
> Don't you also need to update cpu-policy.c:calculate_host_policy()
> for the guest to actually know it can use the functionality? Which
> in turn would appear to require some form of adjustment to
> lib/x86/policy.c:x86_cpu_policies_are_compatible().

I asked Alejandro to do it like this.

Advertising this to guests requires plumbing another MSR into the
infrastructure which isn't quite set up properly let, and is in flux
from my work.

For now, this just lets Xen enforce the policy over PV guests, which is
an improvement in and of itself.

~Andrew

