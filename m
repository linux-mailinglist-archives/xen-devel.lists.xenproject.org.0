Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006B676C6A9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 09:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574735.900284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6BX-0004IH-Ef; Wed, 02 Aug 2023 07:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574735.900284; Wed, 02 Aug 2023 07:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6BX-0004Gd-By; Wed, 02 Aug 2023 07:22:19 +0000
Received: by outflank-mailman (input) for mailman id 574735;
 Wed, 02 Aug 2023 07:22:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qR6BV-0004GH-Al
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 07:22:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e03c6a5-3105-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 09:22:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8106.eurprd04.prod.outlook.com (2603:10a6:10:24b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 07:22:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 07:22:12 +0000
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
X-Inumbo-ID: 4e03c6a5-3105-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Du1ULJ7lrsl5Z356G7qKKoAohXkUltzit5Es1uNAtdI8csayD5qZHQofQSCvg6u6ej4Sw5JvtGda1uFf/Hjxxg+UcpDv2MGFiddI3Y5tA7kFjhVHH/MgFWNKxLC+al+e5qeE490OglMF2vjuBq34JBEWtd5+9tccKZuLQL9YeRAlEu6iHP/NmOFmWQl1zZBfz17fiRy7VOYywnUG5maffGEnrLuzO2ELsmUsWAXSerMuQ9KtmNr3T2XHcFpVEX2B9uQe/4XF7YO5X27ppCZg1j+NvgKTPrMwV3cOAHsNe+GsimcatgIdCHUi3mKJmk56YjXJRFGxMVZMLIZAEWFf6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+DUHtIaXyD72TldqUTpHnQTaJ8xCIyWshquJfI0BDg=;
 b=W32Mc3e8J5MMcbgPRpSdnupQJcPoz5/koavFDqNN0nobwchkQDZqVvhDyeYsC65F34e8KePMQjsFKPPFKEMpbZtDLlZV8JZcVv0JOOz9S4tLVL+NMXJ+ZHnOFLtmYeUJz/e9BOd3lBDPaDdiFZqOOF0mSb49xmdHUOslPVpKSPutHKEk+oGzkznqX2ke8CojvO/TKmLBLA0G0sw/cI7QlmmCzu0aBdCBA4r0UrCPpkVMiiG/FDRrcedWr96reIE6B3gmQQu79kVxqq0JU8+2jUvYNK9dO21sBvoF1UkLaEsvzBHcugdY3T2Uq1QmdhXfUZe7H5KcKCZ++baarL6gvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+DUHtIaXyD72TldqUTpHnQTaJ8xCIyWshquJfI0BDg=;
 b=Y23jqz1GXfec4Ul4ZF9VvJlCE8VnTqBCdBaZv3CDzF0k06Qbhc0Hy2iApYKNzgoAT21omcMLZsD2y2NhRdvYD3lvTpN4J+Gdn+2qrHH/eeSNKi0W/y1kdZeksjlcJOH3FVX/ITaSF33B8ItCCk11PIz2DX5nrgGv+5S/9H6kRnF+OabBH6W2FPkyOZt0FQr1JIf5PM+awA0qPo6gdcKSMFS1DE5Xw+Fz1zExCvw8TQYsNEQNeK4HMX7QSi67bO4VnZzmONvAQ4WR3p/LJ3U1zFyLLz50faz3lGj7TSg2pYcXD62PO6wNfE+eDc1gClQyC49AkMqbDn+1rnwA+yfrUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f7501e7b-2064-38dd-af32-738e01a830c5@suse.com>
Date: Wed, 2 Aug 2023 09:22:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2] arm32: Avoid using solaris syntax for .section
 directive
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Khem Raj <raj.khem@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20230801174930.2995947-1-raj.khem@gmail.com>
 <18d3b823-22b2-85fc-18d2-09cf102b4506@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <18d3b823-22b2-85fc-18d2-09cf102b4506@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 65fa041a-8034-49ae-6506-08db932930bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TnnhvaBTQ6pg7xhQ2d9VAp3u5HOrDGNSFVjo/XLKF+7K4G+zphwK0xSWy/g2JqdaqV/6Z5APXk2ZtIX+Dw1M3BzHMGZKhnPFFNcwFoPQpd1x1qmM++SM56Zuiyo9ef6wyV6omm/R+FwnLFsZd0fHs+kx2VSSMI+iRPHX++h/gxk7ZCVVTMdLIiR5vB9fdVbLIyum12NqL6oFs6zmySr5FjhLQO3rH8Z5RrPqVY2EwGbi4LVduNZSg8xW+Ud4S5armkwQqByNyh6F6SQXnEcNlkrHm6ZVFf4uKgYo/QZF65jlFTm5EvqQuIomU2oilEsogs+1+SZWKWOqdA4RmVrTh6Ob9+pg28om0WXJGG7ZXtc4yIOMTgWsNNROmlBMyZH7idXUFtHhCvaxu9p81QV4M9uoHBqyzTbdzKVGFSN5V3G+Mwg7ysKWkz43jh+ZU44ig61h1eL/vP+R6P2FjIuElJb8++iyZjmVKrDc3Q+QI15N3fvt/L1NvAorqTInabcuWUt7gobxOvzVM+nwnBOQYt1g5KHwGSNtg4BZ0OBW44tbIIcCHu5+ZFFOibNxJzXimRABMzk6s9NYTo0O6tTRQHJn3o5W6h7ZJtX1cEYs62FSNjPxq9dFAqxZFpvcnXWX3UUHyNtRreRnDSidkvTxM1VvhjuBPECMOESc3iGIMS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(2616005)(186003)(966005)(6512007)(316002)(86362001)(478600001)(54906003)(110136005)(38100700002)(66946007)(66556008)(66476007)(6486002)(4326008)(31696002)(6506007)(53546011)(36756003)(41300700001)(26005)(8676002)(5660300002)(8936002)(2906002)(83380400001)(31686004)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm9NTkZTcEFUNGt1YS85L3cvSkovS0ppdUhaN2VDRlVKS1AxdTR5RDduMFVY?=
 =?utf-8?B?MG91RlBTbjFiNmsxelExQlAxWW8zQW9RSmQ0RzZlQ3gyU0tmekcrdzZhL2Za?=
 =?utf-8?B?RGdhVEpzQkF1QjVFWWN0dGdHSTVyUllVclNzTEU4Y2l5VitpWmdwVWdHMTkr?=
 =?utf-8?B?WEFVTXYyTmV6S2ZpR3RBbGZkM0ZDVmJhcCsvdUJ6dnd3dFczNHVzQkpFTGxq?=
 =?utf-8?B?M0RPazEwTHdLSnVEUWhRR3V2UklBdEI3eDdDMiszSHlieFYzbVlIRm1MbElh?=
 =?utf-8?B?N1RsdFFDZ0JxTDcyMmdndmRFa0dsbDFFRWlneGJOQmxwSlYwMU4vZjlNNnNa?=
 =?utf-8?B?ZmxlYVhzdDUzRFROcXBKeXdPdE5lbXk5NmZuK0NMbFZtUzgvMUdTdFpTbUtM?=
 =?utf-8?B?NTlMREdabW9DaGVMMVI2ZnlsbUIwb2tzbjJMdVJSUWJGYUR5QXRWQ0J1MlBW?=
 =?utf-8?B?cnhLdEFlQ2prVStmUlVxWGV0NTM0MzA5cGpkdFJZdzhvMFR3UXRjSG5qK1pP?=
 =?utf-8?B?RG1FdHpiZDFBY0VoNXlxTVB2SVBZRGZFRk9yb00rMVlQenZkRlV0SUlzVHBP?=
 =?utf-8?B?dnViTGZjcWJMaW5iR2tTYTZNOXg4Qmdob2QzeU45b3hsTGJnQjVTMm13RlJD?=
 =?utf-8?B?MlAwd0ZkT0ZHR1NmeWp4bmo1alRIUWtOSkwyaGVPWk9XYzZueWU0bVBZMjFw?=
 =?utf-8?B?bTRTbFd3WS8vOFRrY09PR0wyYjlnbWk0QVJMVE94OExwT3UzcHVBUldtQVNB?=
 =?utf-8?B?QnhBRkdaaGxGOUViMGQ4WElhcmk4eE16OVc1aTg4bkZJSUVSczJSUnhtbGpI?=
 =?utf-8?B?eUlzWDA3aTRMcjc2K01jbCtoR0k4VG1hNk15RlVnNkVGSng4aVZNNDRTdVhX?=
 =?utf-8?B?ai81RjBlUG1vSGN2d0laNkdnYWRLYlk2Y3JDV3l2NEg4YXBKSUhtdC96bm1I?=
 =?utf-8?B?aVJWZEJTQ2FURXlkMVJsdDV4OVRYbk91NlJhN2cyWVMvWEprSnA1SGpHSjdH?=
 =?utf-8?B?ZTZaR3RrYnB1ODdneFJ3U05ZOVdZWDFQc2pnVityVGI1OXQ5MlAyV3p2emVj?=
 =?utf-8?B?QXpBZGo2eGRxaTIyTE9WbUMyRlBTUDFQQlVqc3FVOXN6VXVoNWxDMndOOVQ4?=
 =?utf-8?B?L1A1KytuQkZvcEgvRlN4MlZvMGc2L1JnZk5GKzhsQ1krbVJIUEQxVUJkSklX?=
 =?utf-8?B?Z0ZBOHIyRFUzR0VYbnFHRnJ5Y3NIdnFTQWY1NDZvRlAydFZSbk1ZcVMza05E?=
 =?utf-8?B?VGV0RG54aGt2c0w4UEVBYlZrOC9BRUk1d2hWbStnOHRIT2Y0RllzQTZIYzY4?=
 =?utf-8?B?U3ZrMzY2MGdLeDB3ekg1cW9jeHd6RXRJZXVDamVaUytvckdnY0FhQjd2bHJL?=
 =?utf-8?B?U2pQdDc4bVVzVjJpMnRvaStyWUtlVHo5R3BxU09EQm9PNDFSTmx2L3NuM2h4?=
 =?utf-8?B?aE43aVBWaG1Mekl1TTU1Rnl4aE4zclRtNi9jbWEyWEVuNm9tcVNGNStvbS92?=
 =?utf-8?B?NVg3d2Q4Y0x0UStVUjFlTmgyZDRzeXQvVlNmTFNveTZObldKSGdmVTYyenRk?=
 =?utf-8?B?Rjhtd0JaRkxmZ29MNnl0MDZ1aldmcmw5VjVQSjltYU1UdEEyVnRPYXpMYTFt?=
 =?utf-8?B?L2lLLzNxUGUveXNnUGNDKzJpZk4vYnBnaWM1N2wxaVVuQnJWNnc5c1RGOWxh?=
 =?utf-8?B?alNxZ3hZRDJmL2xyM1pBM216ZlB4QzY1Zyt5N3IraVlIdUdVMHYxdXJJNDJE?=
 =?utf-8?B?eC9BN3JhMWw4QVQ5NXIvMVZZQ1Z1anRjbVRSN281MUI1WWRla3FFK3dnYmor?=
 =?utf-8?B?NTh5ejQ5Y05IeldxZ01mUGZJaTFGODNwazFIcnV5Y3o2NFpkeFZUVC9SRkhL?=
 =?utf-8?B?QWE4cDIvRk5YUjRNNk5VYWlBWFNEOWV3ZHpldWx0NktWMmZtSVJ1dHg4ejNW?=
 =?utf-8?B?RjNkNkFpUmFZWjBNNXRxL0lkMVJmQUxNenFlVzlzc3FWbks5SVZpNWxQUEN5?=
 =?utf-8?B?OUxGVmthWnNOMFNUNjVrVDF1Tm5TZ3o5cmZmQmU3VXhnZkszN3JZdGovT0or?=
 =?utf-8?B?V0ZhajFjNGFRdTFVTGJYakVsQVJjemcydE81MmFRWDlrNlMxbUNEQ2Yxd3pJ?=
 =?utf-8?Q?lLERUv99xjjoNOtD2j7MVHME1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fa041a-8034-49ae-6506-08db932930bf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 07:22:12.5402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXsqwY9wDgQREcj4L41vvOyV0qDv38/tn7FZ6yvQqmWL/YQqn9r/5lx+Rw8QoEA2c1iB8SkECQsH4b9wJMd4Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8106

On 01.08.2023 23:02, Julien Grall wrote:
> Hi,
> 
> Title: This patch is not arm32 specific anymore. So I would replace 
> 'arm32' with 'arm'. This can be done on commit.
> 
> On 01/08/2023 18:49, Khem Raj wrote:
>> Assembler from binutils 2.41 rejects [1] this syntax
>>
>> .section "name"[, flags...]
>>
>> where flags could be #alloc, #write, #execinstr, #exclude, and #tls [2]
>>
>> It is almost like a regression compared to 2.40 or older release,
> 
> The next word after ',' start with an uppercase. Did you intend to use 
> '.' rather than ','?
> 
> That said, the documentation has the following:
> 
> For SPARC ELF targets, the assembler supports another type of .section 
> directive for compatibility with the Solaris assembler:"

But note that "SPARC" was added there only by the commit introducing the
perceived regression.

Jan

> This leads me to think this is not a regression and instead an intended 
> behavior (even though it breaks older build) even it breaks build.
> 
> I would suggest to reword the commit message to:
> 
> "
> Assembler from binutiles 2.41 will rejects ([1], [2]) the following syntax
> 
> .section "name", #alloc
> 
> for any other any target other than ELF SPARC. This means we can't use 
> it in the Arm code.
> 
> So switch to the GNU syntax
> 
> .section name [, "flags"[, @type]]
> 
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=11601
> [2] https://sourceware.org/binutils/docs-2.41/as.html#Section
> 
> If you agree with the commit message, I can update it while committing.
> 
> We should also consider to backport.
> 
> Cheers,
> 


