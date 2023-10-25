Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B36FE7D64C4
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 10:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622677.969710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZ6G-0008Ub-OV; Wed, 25 Oct 2023 08:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622677.969710; Wed, 25 Oct 2023 08:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZ6G-0008RT-Lf; Wed, 25 Oct 2023 08:18:48 +0000
Received: by outflank-mailman (input) for mailman id 622677;
 Wed, 25 Oct 2023 08:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvZ6F-0008RN-A9
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 08:18:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e04200e-730f-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 10:18:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8457.eurprd04.prod.outlook.com (2603:10a6:102:1d8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 08:18:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 08:18:16 +0000
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
X-Inumbo-ID: 1e04200e-730f-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmU5hm5eHhZjflXxOh/p3MZ2gVxIZyb+/pRQoHKT5WaxO15B88Hg25H/DL73RIOFxFIO5+1HY5zlU42T28QX6yxZtIWBnkfr8Jf1w5F1wV9kbrn+PE4hF4D2FqKaby5qKVfzj77cwiMIXOe0EsGUWgRNTCypLtQ1t1vfmyZbabd8fNLQdeIr3hML9uuQJRx8OpnitVo2vZtscUQAZnUxc7QhSylTGfA7zxrxrjCcmDypGWz+Aa0umhbrFMXdCQgMHvm1NSkD7jz+VqNohPexoKBygSKl4OfpDomi27X3oqeXfGeVoeSDYHFce5Qx0l410VTKZGX3Hfcqv78GxWO/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfe9SUBkQjC3NVIKgSgfgo08Sk/dCBtM8YEv6cZMioA=;
 b=M7ysaQ1q6KHUNxLVvNfJwMsF+mb0/FvktGLgVBOAqG0AzzmPvVmzoRzfB9d4x6wScD2pBUotYpxrGGQbSB4QESdYuCoX1XThxS3YWkg08KGgxnDZw9/+uOwr5uV8zlLITlQl6y1z21lfCUdNTGKk+5Z7mohfEpnyZm8Z/IQvo3xaolbc2xujrP5juVFgP2kQ+T4aLfGNfIaad+OTCOi+POy+dHhl70cvfKUlyOS3Fv+wRlu7RvORHBhLo1DQK4f4c5BzC55GXgozKGNimoZuNcMnX4dzR5psNuKRbIEA8nuBFkGcbFkxKZm6Od9CSxjCp+AzmZ0smieRX7QIQuAbWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfe9SUBkQjC3NVIKgSgfgo08Sk/dCBtM8YEv6cZMioA=;
 b=z7fcezFzR+VQ1sZaR42zhbbZQQjOCVrR7HJe9egqkrxj8j+HeOogYP1hBUE0oewpqFq34S4bcr2HH8b8WkHnDmQIxW8RepumCpVKj+U7Gr6uT3rKs+4tsbQPo9f8SbSMVDqGTzg7/RsjA8zDjGsFhzdEcpLykZYo6BDpBl8yEOTJt/eTAC8Zm7hT+ORC50CdGTvWa4ccUmhpmO+eftOVsle5ykJHmpD6NUOauF0DmBQjhiWMIbV2HiecyTGRdE6Qum9aoESy2O2aWQdTeL4NrRrpJCdOIdd1+eXTSwaoXAbuZqXGVtLR4xP5Un3hA21dRpcTaO/Qlh+tPMSbL4NqNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f546b8dc-baa8-c178-12be-70f7c1a8fec8@suse.com>
Date: Wed, 25 Oct 2023 10:18:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
 <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com>
 <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop>
 <725f5193-c8d3-1bc8-cd62-2a2b1b5ecc01@suse.com>
 <alpine.DEB.2.22.394.2310171709310.965337@ubuntu-linux-20-04-desktop>
 <ead797ed-84cc-fb70-5259-7e11211d049e@suse.com>
 <alpine.DEB.2.22.394.2310181739270.965337@ubuntu-linux-20-04-desktop>
 <e642bc2a-cefa-4ee4-6394-3c10102e8164@suse.com>
 <alpine.DEB.2.22.394.2310190915590.1945130@ubuntu-linux-20-04-desktop>
 <6374f0f4-d58f-83ca-6eb3-d5a9fcbac525@suse.com>
 <alpine.DEB.2.22.394.2310201622160.2356865@ubuntu-linux-20-04-desktop>
 <36e6dd08-918c-9791-0dab-ca75d4b98d7e@suse.com>
 <alpine.DEB.2.22.394.2310231346370.3516@ubuntu-linux-20-04-desktop>
 <af4a86bc-40d3-4363-adc8-30981652cd2b@xen.org>
 <c1fa350f-6f49-e2b1-0cda-dec99df415ae@suse.com>
 <alpine.DEB.2.22.394.2310241254480.271731@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310241254480.271731@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0332.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: 887de8c3-9692-4e7f-c276-08dbd532f09f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	URUNyZhYqRt3b/5J/fs2Khxjs/bpYrlVusAztpVH0rt+0jgXfZ4melFWyLOAjK7kqT7iUavB42vBnZil8Ar6G+7n/B5cm2a5rTFOjAWVlceSCzG7mVSL2wzasofiw96gie+1WaA0eap6OmyRHNHjSxuXiNqAmeYG7nZ2S5kDmdmKLRRQqhG7vbPmwdqFc7+lH4IWGygtJaRfLRditgPOcSS0QSgD8XOWWw3s/p0WX3As4T9x48Lj0igAAW6cEjaPwFaqr2Ze+S1hJHLjWe3BMKFrenzubaIJ/lpoN9WBKU7+TQf7MF166V+vLRlbmrovC3wgPsIoHfKpEsl/WVuIRipjp1Df4pPin/x2Yn1633Fr/QdYFaLuM+HNXQPxieTDHX94mXYihFLImxnFniYYUOytY2Ny6A0vmP9V8F67N2WfyPewfPwlK6FGTdaKUcoJkXGe11FJR3859Xmzc/seKNeR3MHekO+UdHUZthmQPvFAhsGgpmGEI31d34yPbzsIgdhmBhCTuL+n5lgs95Xmki/OdXjAwgBQsG/YTf8482ci4G9aj1mBqE/50LZvVHg7e+v2wQi2MECithSOnLow72+Cof695ztqVjO65yx5lh/zMOor2AIh0shKoSoFJhGIokMDTjUBkJqoJ3xzBemJQQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(41300700001)(6506007)(53546011)(478600001)(2616005)(6512007)(66556008)(66476007)(66946007)(54906003)(36756003)(6916009)(316002)(31696002)(6486002)(86362001)(26005)(38100700002)(8676002)(8936002)(4326008)(7416002)(5660300002)(31686004)(2906002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHh5eXo4TkZTVzVObHgvbmhJbjVaWU1vZDF3VkhuY0VycUR2a1pZbS90Q0NJ?=
 =?utf-8?B?RjErVFhDOWs2K29aYmZFb29US1NNSUdLb0YyTmkrOFlqMHFLUW1DSm1XRXFp?=
 =?utf-8?B?d1I3dUFzYUdJQTZudERkWGJBSTVJc0o5MXFVNUJWOWpoOHVqV1FPVGJoMHRR?=
 =?utf-8?B?bDh3MU9Ddkp3TWRNUG14TXplQzJtazBsSGVCcmdrbm1QSW92cUpXRmF2akVi?=
 =?utf-8?B?M25BUXk4K3U4bWpxZEdkc0hFUEZ6V3dsVjVuZUdRak04M0xCZnhPMFZsb1la?=
 =?utf-8?B?UVdNaWxob3pVOFo2ZzRva3ZOdy9sc2dWOEI2TWYvSVIwREkyVEtxRFYwQm1D?=
 =?utf-8?B?YmN2L1VNMFFIMDhUTkpEKzFXWEZsbStpMTJOMGFSZ2p3RzJKQ3ZheXFqMm11?=
 =?utf-8?B?ZjlSempFVzd3M1ljRWErNFM1MTBZU0NHNVNOK2phSDlUZEc0UkJwRmVSMWlF?=
 =?utf-8?B?RWpPU1plbVEzSWJ1V08zbE80NDJBc3VGZW9xYS81ekhrRlFSYW9lc3FQeGVj?=
 =?utf-8?B?d3RzTU1vbmd3M2l6N0pXZ3NBRytoSVBGaTgxdTJQT3g0ZE9JTEJQN1JZZENG?=
 =?utf-8?B?eEVpYTRjMXVMam83RTJEQ1lJU0xQejdYZUxna3B3NW4zcEM5Z0pqK2VwVTN6?=
 =?utf-8?B?blQ0c1RnNUZ3elRLd1JvdEcrN3h1TFFhcC9ka00wcnJNaE0reG9wdDVuU2Yz?=
 =?utf-8?B?UXlqc3RRNjBoUHJ5NEQ2cThRT0JIQTdkUDViK1MwZ3UzRlFocVVUb3pDQXd1?=
 =?utf-8?B?Y0VPNXdVeUovR2JJdndDVlZRc1QwZFNneUYvMW9qeElGaVZnQzVzSHdOdTJw?=
 =?utf-8?B?Y3FiUDR0QytEM1VtRnF4UUVtbzJXMU95cjJUeGorZURyYUdSNFl4bmZwWmZt?=
 =?utf-8?B?MWVXdDFseWRqRkZrVTZhUkxITEJ3aG5ScXp4T0xQUkFsUTBFaGthbFB2NXh2?=
 =?utf-8?B?a01LMVp4V3lmbUNVcXF4Q3F0Wjd5ajQ5bGlmOUNDOWMxL2pBTHZmaGppRWRo?=
 =?utf-8?B?eEwxRHZzSHVvVUhjamp5bEhtNlN1VlhwSWo3ZEJUZDJXbzY1SHRXcEZtempL?=
 =?utf-8?B?VjVxZFA4aW1RUXlndWpoWDB0Y0cvdlE3VzdycjR6VWpiaWF0blRiYWJTTi91?=
 =?utf-8?B?dEZHUEl1SUZvMlVaRjRDWGNKck5MRXZoVnBlaVdwOFFLSUx6S1BlNDBXaTNz?=
 =?utf-8?B?N3F0a3IzbDQxeEdYbGJRcS9rOG82dCtwS0hwWWppY0d3T25JNE9PblFGOGJR?=
 =?utf-8?B?V0ExdmNtMnFvQzBvVEhtOXN3cTRuRG5VZlpZU1FQcjhPd2RIMFJYWldwQ1dx?=
 =?utf-8?B?WmhCNDRVUGhPdnJnVjYyRk5OOWZPc0pDbk56SGpETWcvcmJWdFJtbjAxVUFZ?=
 =?utf-8?B?Mk5wWnJySURjcnpGTFFia29ZdUtOTFRrakxDb29MVEVkZmpuZUxmZkhUeWI3?=
 =?utf-8?B?SllYSENRZ05HZzlwNFplTHFRdjN3QkNjTkoyOVJFaW93Q05EYkJwTnMzRENP?=
 =?utf-8?B?cmJVbGk5Zk5NbU1veGZCbmJvcGtEY0R4L2swUGp5bndTK052dHBUMTUvN1ZK?=
 =?utf-8?B?czJjRkY1YkJoeUt4UW9xMWxEYVRtRmVqTU5wanlaRnJ3TXRCMmF0NHpoemJt?=
 =?utf-8?B?dzFXS1Q0RmgzTzBZVlVzQytKdURhV0Z4ajFDQ0c2R2FjQm9tYit6bTlHbE5w?=
 =?utf-8?B?VjhYblVnRERsTFFmTUozTUlVaTRoamlhRXRUOFZsU1Rkc0lObzFHaGRhckNV?=
 =?utf-8?B?M1hDV3RQY0lTS0hMVHExNUQ2Z2lMTlhrbEpnZVJjNTBEYjc4dHJaVjBQU1JV?=
 =?utf-8?B?RnV4Wktxd1BLWDRyTlJzQktlNnJEdWpxYUU4eWM4bkZVbm84QTZSa2JjakpG?=
 =?utf-8?B?ZDMyR1NwNXM0aG9YZXd6ZUhKWncrYTFqZ3h6d2VWeHpMeWJqckMwVk1CUTZs?=
 =?utf-8?B?Qmg2WDhEcm5LUWltczduVXFaZXd1QkUvR3RpVThuMVAyWW4zWERGWU1pUnR0?=
 =?utf-8?B?Z1R6Ym5xeWtrUjhrak1mNVNCdHNXQ21HS0pkNFRoYTRWdGxwbTRsTGFaQmdo?=
 =?utf-8?B?WVhqSmdYZHZWd3hVWE0zN1NDakJQSkZYRGpVN0EwYnA1bUE4ZGl0aFlSZ0Nm?=
 =?utf-8?Q?yZg3EiW2DPH7PU/i4hr8RGIXS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 887de8c3-9692-4e7f-c276-08dbd532f09f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 08:18:16.6460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ho9PlZfjRmoXvF4NtdnqRlMK0FWUFMJ+uP709wzMnrYGfTIHUJSj6prwVlJujzfSscF3bcH7IJWg8BoDQQRzOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8457

On 24.10.2023 21:59, Stefano Stabellini wrote:
> If I understood correctly I am fine with that. To make sure we are all
> on the same page, can you provide a couple of samples?

Taking the earlier example, instead of DRIVERS_PASSTHROUGH_VTD_DMAR_H it
would then be VTD_DMAR_H. arch/x86/pv/mm.h would use PV_MM_H, but then
you can already see that a hypothetical arch/x86/mm.h would use X86_MM_H,
thus colliding with what your proposal would also yield for
arch/x86/include/asm/mm.h. So maybe private header guards should come
with e.g. a trailing underscore? Or double underscores as component
separators, where .../include/... use only single underscores? Or
headers in arch/*/include/asm/ use ASM_<name>_H (i.e. not making the
architecture explicit in the guard name, on the grounds that headers
from multiple architectures shouldn't be included at the same time)?

Jan

