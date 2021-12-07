Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ABF46BA01
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 12:21:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240939.417735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYWr-0000vY-Qc; Tue, 07 Dec 2021 11:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240939.417735; Tue, 07 Dec 2021 11:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muYWr-0000sq-Mk; Tue, 07 Dec 2021 11:21:01 +0000
Received: by outflank-mailman (input) for mailman id 240939;
 Tue, 07 Dec 2021 11:21:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muYWq-0000sk-9h
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 11:21:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0b19472-574f-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 12:20:59 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-IBuk0WC2PNS8NGP3_MV5HQ-1; Tue, 07 Dec 2021 12:20:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 7 Dec
 2021 11:20:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.023; Tue, 7 Dec 2021
 11:20:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0033.eurprd04.prod.outlook.com (2603:10a6:20b:92::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Tue, 7 Dec 2021 11:20:55 +0000
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
X-Inumbo-ID: c0b19472-574f-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638876058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w/YG7ewcnOsfEMnvus0ZdTDuCEDNYWF7nyZpk1MfpVc=;
	b=M1UmXQI/mP5qZHeiAlW0sm0GYH4Wc7Diem/iRmMk3DG7CXocewNjFud3jZYz5hNO5ZY0oB
	/B78YU4txERf9iRel1kTYno7zvIAOiKDkyrpyMImxHVXAhcSdLytY9I+T58SSlgX35IQPV
	vWxPRlGbN889G8oltC2Qdj0isbfSrxw=
X-MC-Unique: IBuk0WC2PNS8NGP3_MV5HQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuarTOkc5BbBxFnF5TGs0LWraclbK+4EBi0AB9homZdtJEku+oPGfS8xfVoEStqK+sYp8tt/SRgpw6tp2bwqJJys/X7hcgEukmUNllCjYMksWQC6MB1RMO1OwZ68fDK4YF25c20aPZgDOAiDYdJIUyWogSPcWy00rXi1rlCcNxCo/wit+DBz6bS3LrNYOf4fElLepkSNGXKXG31h2pFZdMKero5VjmMJx917f1j3/PD+qMcfpacMMiarFuzHMXwnLhuqj9jHDw0IMc98ufxBdXWJGy2LWQxN823tQzTC7gG9R7ut8BNb7Y6LghfsZAEFAgOxnKDGdgZ322/StbtPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/YG7ewcnOsfEMnvus0ZdTDuCEDNYWF7nyZpk1MfpVc=;
 b=gOB4ouBXTcncykwDIAwrf2Fw6m2KyBZrwj11ruIgbC4BlPmdv+00NHWd7F9er1VApHtV+1flxSGkhFIAhG5e5mdU/S5JJfw7z9Bj79DoFZq1JcUzR36rfCSyQiRmcsrIBFg3+TSr4/qKfcx4Z323C6hkir1T6QGhW0ocnSoWJB0UVCGmElFwGQhDvGw5NG9JpOVnOkoQoz1MGKZZqKRN7ToukiJoWrniUWD0747KRlZxwLC6IBpX0zzz/lXpWsMY/OyNGKhberuoN/c0q1sdHn/IPf+Yc4xdP0hAv9RQYreWfDhXEAiICF17bElwpPqEjcb8dEVaja+asg87om1ivA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5bfb40ab-b50a-2485-b1a7-8d203374b064@suse.com>
Date: Tue, 7 Dec 2021 12:20:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [XEN PATCH v8 16/47] xen/tools/kconfig: fix build with
 -Wdeclaration-after-statement
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-17-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125134006.1076646-17-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0033.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9afc120-c006-4334-617a-08d9b973a36b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6301FA9DAEE53C8B7919CF1DB36E9@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cSqN3bIsK+xC1yrBfkLPYK56fyIStNV6Td3C91Cf8ClpGaqIKDS2w/OlPWg9CfeFnK0tUgoh/KGGivDuJgWeW8LWozwrpM5LVIeDEr35tK0p0xyjlh1uoI25h8oRAd/uDHs4gIPV4yLTeFsbsaK29w2mKFCScCCsfs9L53tNEaxYMUIIs9hc3Cjl2BY/gFMz0G52uoEnzss2Ea4tuUge5sdkiqfBpvUBsSFO74gq9AqWKFJfOqPmba8sVG5STNv6CkxzgKMJmmJsHHR9DaQNIwkcHCoslcr8lS+jM/3LGBIlXpUJU03WYSSY8YN8Aa84SiJwJg/sPwKEN0cCZQWV4UOh+0ETyVayEyFN7mvzFYAfIled9JtGUuxnM7vFHJOl+DjfKNk7dtWVG8gF+ufremyxuX2jRuj5NAanBuDQdQ+2eVv2olMKbpytkRInVQ6aGZIT6ku2TeCls+qN+A+ZWoTbJBrLBInN61TTIXXwT1QDNo9l10E4VkUx3iAFt+KV2VeC0NPR0BhZKyAr9FC0lXszU8vLjVvdJRb2X1uK8ai3n6gbYt8Bn+O3ttiN31jYpLHUfQKyAGBMEt1spC9wqGTp1QLlTtbS5kSIAoSDgYiO/nFoFRNaiwjvvxHua4qTPRRvpsddWBZ4uZ5nixVaWkmr0LJmrG89lJndCEUX5bDVNSg/sQw2xwMQRa8GnBDZkZPGbYs5URvV4p6PmdG/fEZA1LlCZym2iODejq3lIoI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(2906002)(36756003)(8936002)(66476007)(86362001)(66556008)(31686004)(38100700002)(316002)(6486002)(2616005)(66946007)(16576012)(956004)(4326008)(5660300002)(8676002)(6916009)(53546011)(186003)(26005)(31696002)(558084003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cS82QmpMNHJMQWFqdU12M1Y3bS9LbER5Ly9oakRkSmcyVXNPOWZDUUFHMkMx?=
 =?utf-8?B?UUp0OEhWYTc2RVBBVFVhUSt2endDRGhreURZSUJSZ0VmRVRWSEpQWEJCazQz?=
 =?utf-8?B?WVFBWGVVUzFlbWtxMTVZeldzRGpCSmN2eTBsNmFSZnlOTnlNOGJUMEpMQ1Z1?=
 =?utf-8?B?bWlBODdGbmJRMVR5bFdlR0ZzNE1yeWE1R3lvUWpyQ1pGZDlPQVlneVIzRFA4?=
 =?utf-8?B?Z1FxemY4MzB4L1B4TVppaDFWWEtPbkFtaElPcWlNc0I1eGtROEZ0bWFsOStl?=
 =?utf-8?B?RElodEs1ckZQUCttRzVVM2IzbWV3S09wamt1VFhEZ1VET05XN05YTzh0Sit1?=
 =?utf-8?B?MjdodzIxQURRdEZRMXZYcExHK0FwMzJqQnp4SmZwb2I1Qk5qTGQwaFJnNzBV?=
 =?utf-8?B?bGtxSDNoei9UMDY4WkxBcXVrY2xFRm9hd3EzZU9zNHFZWTJQbzdyb2MrVnVL?=
 =?utf-8?B?NjVEaFpLZUVCdXU2U2lzcWpabktSblVyUjQ0bDdTUVpGemVoMVpaejVMa21P?=
 =?utf-8?B?aGVPVTBLMG4rUXpRWUZjVU1xS3E3TFB3MGx0dk9CT1VpTmVGLzc3ZWtYQ09l?=
 =?utf-8?B?Q2VrK0R1NkxPd2VmSzJ5cXI2R3M5L2w0QlhLOVBXN2xONE9CNzhQalZVMkoy?=
 =?utf-8?B?WDY3UzFNYTlIMUZZVUcrMDNCZkFjamVuMHJEQ1F1MllYKzNLdFNFTVp0OE5u?=
 =?utf-8?B?eGJtNlFJcE8wdW1pa0pxK0pLNFFoRkxtWnRWa0w0NG92VXVvaXNkV1FFejhn?=
 =?utf-8?B?cmhQNTRIRW5sYURiaGcxajhtcitxelFQSlFyRTIvRDBMQzk2Mi91aHpwa29p?=
 =?utf-8?B?VzJkMWZiTDc4UXpQcEZkZ3pYTWZHSDl2N2dGZGJaQ1BtWitnN3dBWDlTQUN1?=
 =?utf-8?B?d1grNGF4UWQ5MC8rY0pGOEJxd3RPMUtybXllaWFPcjZsOVdqQmpaSURVUTc1?=
 =?utf-8?B?eEVVUGhQNXlBZThKQUswQjFDcVlScElWTGhXd1N0QVBBUXVlVGV5Yk1lRUJQ?=
 =?utf-8?B?QWFSeE9zblQvbVNkVGl4bWRBMkpDVGRQY2R0Z1liOFd2ak92WlRheXBXVmta?=
 =?utf-8?B?TUY4amFPQlJhSFpsUEdPL1BEZGlFRHZaY3JxWGpGSWhLaGxCWXFueWt5K3JL?=
 =?utf-8?B?L1RXT1hqTGFrTkRoL3BvSk1wWWV1aE5wRHZOZUdvdVZvVXpZbDhpM3hQZzdp?=
 =?utf-8?B?SnRlL2RrbHZUT1FEcTdIMGVLRldCdS82TnJVd3hFUlR3aVpEQnRPbEdnSGth?=
 =?utf-8?B?NERvalZPWTFrU1NhTGkwZzU0M0pkaDRCd1BJT3BrYXVETTlKTTRTbS9PVncy?=
 =?utf-8?B?Sm5lU09jZlNob1g3Q2U2bEsrTGxEWlhjTGF1SHRnQmZvMkI5a0FxbVhqN1BW?=
 =?utf-8?B?N1I3Z1gzYkhHODhhRzJyYndaRDlma0NEWEJjN0xWOHFCbW1CUjBJZkJLNWR6?=
 =?utf-8?B?Yi82ckI4T2pHcjBZOTV1eStoNFhUNFZOVGZrd0Q3d2VzTC8zTjExdS9HVXNC?=
 =?utf-8?B?R3EvbTF1dEJMU1R2aVZvTXNkejgvTTdGbVd5Wjh0UVRoQjl4eXBDL2l2UUhh?=
 =?utf-8?B?NUlEdXVkNlcyaXIrWjloT1d6KzVOY1FDUEhYczJLakZwWEpvRUdObGw0dEFv?=
 =?utf-8?B?U0RabVVSQ3dycUdIbHozZHEwRGFOdklzUmRjLy9JbW9QYms2OG9HbVpnYVlL?=
 =?utf-8?B?bUs2ZFdxMk9xUnhNNkxCQVFvRDhpWllQdzJxU0R2Z3NUU3JqU0xkWVExUk9J?=
 =?utf-8?B?bHBkZHFoMTZHUGc0YVZNaVIwSmEzV2ZKYTUvQ3RvczBKcGV0MllVaWZRekdx?=
 =?utf-8?B?N3ZqUzJEZmtUYkhFaS9uOWVrNnQrV0dqQXNGTmMxTW01N0t6ZW5rYUEwZ3dx?=
 =?utf-8?B?c0kwQUVINFN2RzZIeXg1dWl1R3RTN2Z1VzFxdFMySy9iMXNEamVRcThDc2hB?=
 =?utf-8?B?UGNKQUptM0JqdWVNYWR5VTVMTVh6Nm1zUEYyYXpNOFA1ZEpDZzNTM3ZZY04v?=
 =?utf-8?B?R0hTOFNWZ1NKcTZ1SG9CdTkrNENTQVRqQWRYUEdyWU81a3RCd2hqUGJNUXVY?=
 =?utf-8?B?WEtvS0htWmxQUXR1Qm9wM21xdUtEbSsvRlE1RUpyZUFieUo5bitDclRHV2s0?=
 =?utf-8?B?UmtDbCtNdThjZjdEWkR4RUlXN1Vkc3I2NzVXRGJLTFVIZXNEaklwS3krSFBH?=
 =?utf-8?Q?12md5CiRfnYD3c9F+hLb29k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9afc120-c006-4334-617a-08d9b973a36b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 11:20:56.6305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZeDyCs3XjTebkisRsHvNZuy+TCW8o6gBDRNBqkZzT7KeVeaTG5icY7+eocKWc7zomI/xPISgHPOAuCEoZiffRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

On 25.11.2021 14:39, Anthony PERARD wrote:
> We are going to start building kconfig with HOSTCFLAGS from Config.mk,
> it has the flag "-Wdeclaration-after-statement".
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


