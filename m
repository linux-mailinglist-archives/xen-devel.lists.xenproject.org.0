Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F107727A5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578553.906109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1BH-0006vr-Au; Mon, 07 Aug 2023 14:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578553.906109; Mon, 07 Aug 2023 14:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT1BH-0006tH-7D; Mon, 07 Aug 2023 14:25:59 +0000
Received: by outflank-mailman (input) for mailman id 578553;
 Mon, 07 Aug 2023 14:25:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT1BF-0006tB-Ds
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:25:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51bd8641-352e-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 16:25:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8539.eurprd04.prod.outlook.com (2603:10a6:20b:436::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 14:25:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 14:25:54 +0000
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
X-Inumbo-ID: 51bd8641-352e-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gP9+joZXbrzJgAqEuKf0Xo9g4QttSoErOds4xs8vgx5MKlDhBHaQutnZqZy7C3jXyXXdEUuclfjFqvXfLxAQMcdLpgwhEbvLrSrBOHEkHF492ytM8a1r1P3mPnyVu+QvdwwQ9CyZ1g9J7Vllyag4Y5ymJYqaYJlme7wLNti0wyfw6uaECOmsiXNFqDB5JSabFnbFd8NtJjZKEuS8DqCgGGrcXbftwwRaN6sz7WvexQHXgd2uw90lzlVWDPN3QBAAw5YxIAn12QljG80AWp+vjtrQHfUlWesGiEqqB7Gw5rcd9SFksBcLN7KoKDlK+FSKvVG33rix0bhWwgvVLKjCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viu3A6uCd+gRMrLoACs3r11I80PqDQpbRn+Gb84+NIk=;
 b=KcZH/0R69JDNO70PvFZBN2C9qSJIyK/cJlOcQffNA6tUXdOwodv0/YuGLszsvDUf8QVD101TfOqHe9T60HKsj16ryLB+Bgg1CzybZJryvFFSbqXMxJPwgMOH15XsL95+fIxkHur9V43V3TkUriBC9ffkZ0543Ut87oSqYnOTWOsSwgKefF0mMw6uOBTBFvp/P9pXz3DuIOiluvm+NMsOiNiGfZ/uBlDsOgAMz/aEREtZOQe4uIpwKJVswkFRZG5wIMq2OGMbcFjnlWgCjp/YX7tZbG56aFyYsv/otSb+D0n6+0Z7H/oEPtpxjJOvh/XEdl1XXtbgcNs8z/l9DsX3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viu3A6uCd+gRMrLoACs3r11I80PqDQpbRn+Gb84+NIk=;
 b=i/yps21496ru9TcmLWD+aDjSiPZpJ137VPAq66zVdMldkTHQx2To9mEtDD1RgZYhv8gt3xi6M1jz9GhhBLMhOZjwwes8PX/sWyRGbInb1m8da6UVAqnSLvoFzbFvkaWTa0ioGiZaqUgiy45yHKvumewkmsyUIWx7jbEaThmreXyolIjE4oBfV7/QzHBHT7VqDTUnifxEC+8e19XML/lF6V9dsBSoPPiRhDot7m8vXB62VGBGzmWlfYenAhmwWdlIHXpwRbQrjb1HkKnC+8fwGwnWaQyiwWLHDuwFmDRanHvyiNcd4MiXayodftWd8SE+zyNVhOyc45s9o/dQwpNNbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <074a567d-5c34-83d9-2832-d9161d6b6254@suse.com>
Date: Mon, 7 Aug 2023 16:25:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 08/13] xen/hvm: address violations of MISRA C:2012
 Rule 7.3
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <d1be6a0bad7e5cd6277a7b258a1fa70e58a68140.1691053438.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308031749170.2127516@ubuntu-linux-20-04-desktop>
 <f1d6b1c5-bd01-cfc0-e507-30ea6e07f307@suse.com>
In-Reply-To: <f1d6b1c5-bd01-cfc0-e507-30ea6e07f307@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0224.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a94581-f7a9-47d5-a3fd-08db9752352d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TILx1vTVnPCZ3Twol2d598Pc6IRev+RByZllQGDOWdSC1cZDDg0jv3xmMSfnZjyGj/slBgWyTFIuzid3qtoRvI2k+M3esIWCMWNwq7/uG/dRz1vwGu9iyHjNu65iQdUmf6baGlQwaQvFcpwT5agiP0n1vtpbb3Z14F5Ko37ev7p2ZcHYEza64oD0bv6WERNYI/B1seZULXJJuYlYB6vaGmLG+oqZXEvHIQrrdEdQd8c3KAdAn4Gi5l/djME3d7AOfl2Ikzw3YesbSteG00CRCHqesq47bqbVpx1sXpqJ3U1cJxjuJOrojzOA8BfD64itLq9hCPzStFA0lWXLtGSG5sdNL/3SGiyr7yaGcenDSrah/AbTNI8ygTTBQ5tNMB/DU0dtyOf4LyLW80JoGRYdO+Vjg/6Q/gdYBJSPuau+GD/OEQQJyZ5SPmXEU/FY8244UmT73+unzjMREs6A1SXgFzXNl4Mhs05EMfdD6GVs2+shc4v8FmHw5y/OxdcID1Ho37w2KMdk0iASVYml+j1rds35UblunWcqPYkke8IeIJHiAEGx2HJqbALSqmxyLCfqXzg23SHIj9tSnd+vI/lDxrw8cOp4KhEICBusiM/B/PtI5rWtCUTJcH9JhKhxvgpngIqiqn/Mbdtd0St4oLYlZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(1800799003)(186006)(6512007)(26005)(6506007)(53546011)(36756003)(54906003)(38100700002)(5660300002)(86362001)(31696002)(4744005)(4326008)(2906002)(6916009)(66556008)(66476007)(41300700001)(66946007)(8676002)(316002)(8936002)(6666004)(478600001)(2616005)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGFNMUlkdFVEbDdrWEVEZHNCL3orL1NzcER6MjlmN1IrNGMvSmNIWmZyekFN?=
 =?utf-8?B?UHhwRW9TazFrWWgvYTIwUVJGMlVGWnJGeHRZcytWdkhwRWJRamJWbzVGQWhk?=
 =?utf-8?B?ZU1xZ3NWS1IxL0FuZ1FlbXhwazZHajkvQUE4ZDh5NUZrTlhWN2NoSW1CV1Zs?=
 =?utf-8?B?YXl1TzV4aDNwTzU2RXp5dWhLWDJqL0pmN2pURDAyNEdSMkdDTndFaW5CUS9E?=
 =?utf-8?B?bndROWxKZnlHVnJuWXZ6N0VyRC9UWkM0V3pmd2JCYzFtUmMvTWlQcXRLSlFW?=
 =?utf-8?B?U0x4WUpyMHVBQis2WTJNdXZoU1hyZXc1Q3BHbUNWWjRqMGRVSmU2VnVyaWhT?=
 =?utf-8?B?a21RT1FHNml3MHljMmFjSnR2NjRmcUF2c0lqb0JqVjJYOFZBK3lLS2wvOGFV?=
 =?utf-8?B?R3AzRndlckdnUFVYdldTWEw4YUdnZjRyS3MxSEhSNmx4Um5ES2psZ2toSEpN?=
 =?utf-8?B?cXIzdDg2VFowMEJJYTU2Y1puOHkrOEl5NkRmMUl1cnp4dmR5TXh4cmNjWGZq?=
 =?utf-8?B?Q29Lb3NycFRzbmgxRys1eDFyaGNaUnY4a2FIazNucDY2Zis1OG1hTWVvUUNL?=
 =?utf-8?B?TENHOHVoWlFzdlEySGRkMWJ6MllGSW1NQUtqdkwvMyt1azFwclJWeHpkb3FB?=
 =?utf-8?B?bjlNSTEwdnhhdzJqbzZBMXRXTmFvQXo3a1lKb3VhYlJZekJxamVqaDNmZzVC?=
 =?utf-8?B?MmxUSFlmUlRuUnJ6Q0xmcmNjbGdQc1JGZFIxUUhYek54TVZPekwzWkRWTkpu?=
 =?utf-8?B?VUxSQzZXR2pxUlBSVzgyUDc2MkRhN0hkSFY1TVBzbFo1c3hMMEEyRytEbDBp?=
 =?utf-8?B?L2V0VEUzY2I0bFdBekdVeGw1bFI0YU15ZXVzR2x2THNmQTd6N0MyK3V2V3dn?=
 =?utf-8?B?SEt5SUpnRGsxUE1meTQ1YXI0RHFtb2dLc1R5bEY4cHJnb2wwWlV1QTNBNC8y?=
 =?utf-8?B?NjNsS1l1MS9qa2RsYVoyUE5uZFNWSzlrb09HQ2RCcGE4a2lmRGlzMWV1cEk2?=
 =?utf-8?B?MGJkRWN6bHQvRkx5TE13a2UzczVoTTNhemk3a09hYTN4bDJDSUpGVGdSQVMw?=
 =?utf-8?B?Z1kxSnhuczAxdlp6MG14RG1XVUtJcTZxckxGZkRFVzRycFVPVGdmUWd6NG9x?=
 =?utf-8?B?YklubDJiWVR2V1pMUmJBdGpGd1o0Nmt2UE05M3JmZm8wZ1d0L2s3NmZ2dWlT?=
 =?utf-8?B?SGltZDJZbHJMREs0NFBSbllqeHMvK0dqSG5ybmZzSys3Z0V4TjlNOUtPWjBV?=
 =?utf-8?B?aS9jdXllaGJ0QkxMRGQ4UFNPN0tnMitSVWVSTXFVRDdFTXdIVTBNbjZ2bldD?=
 =?utf-8?B?dVVtZlhIZmJQY2VGMWF1UXdnbnV5Rjg2WngrM1NEOGIrVU1PcERpaE1DblhT?=
 =?utf-8?B?Yk81dHB2QU8zRVo4ZUwxSlMvMnZOVThIUzZLbWRlRHFGSmh3L1NzSC8vSlBi?=
 =?utf-8?B?SGt6SEdZZ1lTQ0tjT3hNZUI3b3ZxTFJZeDhlWmh4Y3k5eHR4VU5UbjBmSUQ0?=
 =?utf-8?B?WTIzOFoyV2xrNWNPRm1LMC92L2I0T2RyVVk2eWIwMjBNUWg0WVVYK2RrSVZX?=
 =?utf-8?B?WUgvVFhqZ3BsNzNrQTBzcW13Zk1wQzVZMGRqZHkwZTFaLzhmcmUxRE5nNm5r?=
 =?utf-8?B?TGh3MU5sZzFlRnhuWU91WHNwS291bzdEcFh0djZXTWppeVM1d0p2eXdzV2cz?=
 =?utf-8?B?K3BjdWg5amJOd2FUYUliS2Y3Y1I2RFY0KzZZYTU4bURKMCtQOHZsMTNKc1d6?=
 =?utf-8?B?R0R3VDZPOWpCbWtTUStaays2QmNnZnFHTG9sT25Iby9pVWxiYXFyN1Iydjh2?=
 =?utf-8?B?L25CS0xqY1FxMVdibE5GTWRZMno1Qm1pbDhVYnluaXQ0RFhEUTIvTVNlTVJD?=
 =?utf-8?B?bWRNVTQ5bUZ0a1lWdVA2Ums3Vk1zTkVWbVpsTVF6Zjhpa2VabnlVTDdRZTNZ?=
 =?utf-8?B?NitLZUJHQllKeEtRQW91Rm0vS204eVRlRHRNMjlFTmgrVy9VaGFOM3pxNGNq?=
 =?utf-8?B?NnMzUEkvem16bzdjaE5abjBXSGs0emlYMmN0THFHYWFqNGRmNGxoYTVsU3Nl?=
 =?utf-8?B?Q1BSbURXcS9TcWkyR0tYWFA4TzY2N0x6VXVzdFFtM2NJQU9GRUdqaE1waDQ5?=
 =?utf-8?Q?PxfB9UlW8/Svvm9mbf9E356Tf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a94581-f7a9-47d5-a3fd-08db9752352d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 14:25:53.9680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoFBSI5Mg+jjdMzLBybHf8tVxlJ0XUAAi+Pl+cPnA+dBCsykUx0ozcvYkvldXVSgEK2sxbJfnEcO9qLJLFDnZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8539

On 07.08.2023 16:24, Jan Beulich wrote:
> On 04.08.2023 02:50, Stefano Stabellini wrote:
>> On Thu, 3 Aug 2023, Simone Ballarin wrote:
>>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>>
>>> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
>>> states:
>>> "The lowercase character 'l' shall not be used in a literal suffix".
>>>
>>> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
>>> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
>>>
>>> The changes in this patch are mechanical.
>>>
>>> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Actually - I'm sorry. I can't ack this. This needs an ack from Paul instead.

Jan

