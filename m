Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B016595647
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 11:30:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388127.624701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNstx-0006q3-KY; Tue, 16 Aug 2022 09:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388127.624701; Tue, 16 Aug 2022 09:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNstx-0006ml-Gw; Tue, 16 Aug 2022 09:30:21 +0000
Received: by outflank-mailman (input) for mailman id 388127;
 Tue, 16 Aug 2022 09:30:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNstv-0006mf-M4
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 09:30:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ade7c2d-1d46-11ed-924f-1f966e50362f;
 Tue, 16 Aug 2022 11:30:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7353.eurprd04.prod.outlook.com (2603:10a6:102:82::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Tue, 16 Aug
 2022 09:30:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Tue, 16 Aug 2022
 09:30:16 +0000
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
X-Inumbo-ID: 0ade7c2d-1d46-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAySe206zxPx91vDok8knYyvc3sjZLlX4fZHoFSTFPxZsLCjp8yH2fGiXdNUxVWIPHk907LMOjrMU8D5txiG8FdSqifwtZ/jJI112qYwCkd3MG7Omxxk663sXL7ckaPZMB5mtu1VQpsm+kCGonLSxKHV1UAGzrirOkbzITx1aVfdGSjQ+RxSGcIE/bcH+WNgjLMAiVCY2rUW0ypueA2QRK1eKbcFgfVFFpPPm88GBxADRJStsYoYFm4UJZkNFNfxBKzUClhZzoyyDXJ+7oN8FVggbfb5Ewg9z31clcGnpKpvkvxH83rIw6goH2cnkP1VFtt1ER8PXz1Sii5SxE5V0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y98z7rAaUWg0HlOYwOTfEznHhZZSM0HUcaPFQX2s5Cc=;
 b=MOmLNcE0xkx34oLO2xz3pwP3wEUnYsr7fEtThr+0jX2+W2IaHtUWALFnvqUEyueiWRDRzJHINy48vf0qrFm9f/k8USILCDE63ywiqFUoHdMn18KVq2lUT9ad69oXvvyz278DtleR7NA2aenUC7kE3fFnsQBUB+PBre+unssXrYaf8TuQ7leFWxOVCt392eEqPv2DH0GC82X73C/dnrMsy7XR6ff1n0kO3S07Zy1YpWmanvuQCN9Qupvr0L35OUMJdJ+14TGH2r7S4ORPTEBc+iORTVwl6DUjoZP8ubJOUjTOhQHomDee8UkdI7CALsXyuU/WsPefrdL8NTkYN8FeaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y98z7rAaUWg0HlOYwOTfEznHhZZSM0HUcaPFQX2s5Cc=;
 b=eav95EDglTcwe3L0hSZ6kY05cQIfXMfgf0foUrvRTVFWpv2iG/AyzwhWiHkHVQwCn5JlduAkJNHXyl0QlFkM9auOnFHvYslMC87Zyhv70r39XrtINrZymik0hPZghOQqXGIRMwzAdOAJl+DJyrNsDg0PfG8MeSZTJP/PFz94U7OHO6NBc09rvAyi+cekyShjH3BJQcXs4eErj3LaeZZa8L1tyP5jkxlKLCnJk+rQvY3VKEI0GAyDEJJ2Xphojcy1T3jEM7+iZt6NCAoERSW+Jguo2VjZYsgwQ83lV0GgX+6LuNFk7HO77TE9VVF07n4BQb/d4M8Yjxtq267llXKWaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d2bb3006-c074-b977-d221-7c87d1f60098@suse.com>
Date: Tue, 16 Aug 2022 11:30:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Ryzen 6000 (Mobile)
Content-Language: en-US
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com>
 <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com>
 <c24c469a-e0e9-6162-b8d3-07c1707fc2d8@citrix.com>
 <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com>
 <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com>
 <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com>
 <2d844e18-c1f0-ddf3-6e6c-28b3ba09b427@suse.com>
 <2Z9txJ9x0dRfAKKDGhv-bzsLzhaGr2eIXMpUtMOqXCaXVobm_mL_fjQ87VfcB3pSc4bOntsOG_aYCmL4CBgJFqwOI23OFyZ67KiKnK-MIP4=@protonmail.com>
 <94c4df02-37db-f722-3644-bf26a278107b@suse.com>
 <IPozz4PvDN7DUKwCoo1sy0mRF_rX13XangOkbctWxQRJ2TddFQUMRIWpzUcD7QjOFVeGQTKXmmmKacy4WPwond1xQ6Stpu6M3Y_Xx_cJ4S8=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <IPozz4PvDN7DUKwCoo1sy0mRF_rX13XangOkbctWxQRJ2TddFQUMRIWpzUcD7QjOFVeGQTKXmmmKacy4WPwond1xQ6Stpu6M3Y_Xx_cJ4S8=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04adb362-239a-4ebe-ff21-08da7f69edba
X-MS-TrafficTypeDiagnostic: PR3PR04MB7353:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RX+UaRlx0+KW19wlVYNPe//SsGHC6fdDCAdPP3LLgXAalrwUdTStIKvNswHEMfzrCx3NZJy/rhQsssa0fKOnKypmMHoOA/N43gRCycC3J+rQrHc3fMUxabMJy3kwn4HI8jIjIrNrksum05x3OkygKqahqTYQqZ/ZzIjyjcr+yxopIUnUt8cI5+SlvFRjZIBeO1RQD9TunU33lwPiwHQk/7WWhRCGzmmdrLuUt1peJWVLQZFMes0WQztxpswgdkdJBbTJErRUjRSI+Gl7wFOZfOT3qo4J1GGv9K8PrA5EPPlCw271CDbWjRdPk8t6B7PeroXgdDOhxKzjH83Na20mXOuhjodZRozN6Uil38nCxi1lF1LKkVoMcm4sXTGdvfmrikUt+eob812zlmC2CiCuCi0JX3SwUmSReCA+L09jXmuWPCyLKrlbv3Bwuj3Fg2pS9SnkZujc1O6RWV6PwyaPIW7jPWvU7H5kAg9yDHORTXRkpjlZ52ddk9lzIyg2y4hcN6QrhJPWPeaacT7nNnA4K/oe4d4BvZZfhXY2Ea/Ie1TYTdlQYyebhC30FKrZQWndd8z2l3wbG3V+j2uNck8R00LdA/DJs9WgwFXC8OMq/30hvvU/WJs6KWZApr+a8I0xfbBdEeQeBlt/OOHy2XL/lbFfOjrvQC8A92+sf3pfb+hP5oKT2wkAzku1euYTBXkEZvhzMGpNvTGsEY4ksIQjXLhxXV5c4J4v2tSxIYocC0ReslEAf7QWlsUfMEhUEh8J4oUk9G2rcHXd2l2rO9DaLUi9s2Gy4mxp3mmtWUyu+pSfb6NIatpN6+XqI3EynLftp84OxwZflU9zQCsarYP1OQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(346002)(136003)(376002)(366004)(86362001)(38100700002)(31696002)(4326008)(66556008)(66476007)(8676002)(66946007)(316002)(6916009)(2906002)(8936002)(5660300002)(6666004)(6512007)(26005)(6506007)(2616005)(41300700001)(4744005)(53546011)(186003)(6486002)(478600001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anpoR1ltY1dwYVMwUjJ0eXg2WkVBVzhERTNKdy9adzFBQ0VGd2l4Y29xSXZ1?=
 =?utf-8?B?K29BeWE3QUhZNEtRSmhlZkNsMHY4c1FOTGg2K2RvYngzazNJMVJDSExBZVB6?=
 =?utf-8?B?M0NzRXcwWU5FaTlpSE9RUlBJSWlMdkdrNlU1YjJ3SGN1c0E2RDd2NytYMUZS?=
 =?utf-8?B?cThkQUhQSFJZNWJ5alFEeEtsb3diMVo3ZC8rbVI0WHY2UkN1TDFpTktvNEY2?=
 =?utf-8?B?Z1BUekV1bVlPaFFOK1hTZkdRNnhKbldoa3dQUVIwYkpleHQ3MURvR0xFS3gr?=
 =?utf-8?B?N2RUUW9ELytrdk9iUmVKRCtBK2QyTkg5VTBKUzdvNXZWcnFlVllEQWRPYUpJ?=
 =?utf-8?B?N2hVbFY4dll1VVVsL2h6NXZWWWVnbys5SHJnZ01Kc1BIc1dRaUU4NGNSZlRJ?=
 =?utf-8?B?aGQ2YXVtejB0K2JNNnJXbWs1dnRYcmlRRzRPUVFwZmcxZUcyRER0WExpMjVJ?=
 =?utf-8?B?YTBtdll2UDU5SlZkbG05NytKUmVId1ZhQm5uZnZlbng4QitxdlNYVTRHWWhk?=
 =?utf-8?B?NUJJbXVRQ3c3a29NU3dsbE1TTHJheEZvRkNWQWVHTFpCWUpXSm9wR2Erc0Ns?=
 =?utf-8?B?L1R6Zzd0cFhRaEhsZ2tmMWVnWU1qRUw2RlNWK2VWZ2EycmdFbjRESW93ajlt?=
 =?utf-8?B?VDRRVWIrNGZvaWIzNkVPZ1NKRVZ6YkRkS2hQQ2RYZmY2SGdlSTdLMHB0NjU2?=
 =?utf-8?B?d3hPNWFMcDM3K3QwUTdOWXVtYWlXZ2YzWGN5LzhWK2xHL2dQdmZsZ3Azakl2?=
 =?utf-8?B?VXQ1SDRxdjJ6UURqR0UrZk4zaFlaNG9WcXlLbmo5a2huRENUYjdQOEJHdSsx?=
 =?utf-8?B?MzViTG9wK29zOUNmb2wvT1c1TTBMd0ZMRGJHck5Kc1h1OXA0NzJaOUNWbTY4?=
 =?utf-8?B?K2NmNUQwUGhlckNpNlA2Ri8vdTlQd3J1a2JNaTVDTVQxR1hrcDBCVStta2ZE?=
 =?utf-8?B?Y25aZmF4ckpJdHliS2JkbmFjZmlqeWZHTVp5RloveGpmb1pYTnJhVGNWL1RQ?=
 =?utf-8?B?ZVZPWWZ1U2hFa1JacEk3cURaRFpSbEgzT1QyT21NajhKR3BlL2xPOWpBVEts?=
 =?utf-8?B?eFdjVUlSOGljajBLYm5RVEM0VDhPalhqSjJiZTFSYW52a1ZkRnRScUJvR2hF?=
 =?utf-8?B?MW1mVnVSSEk1NzdRaThpTWc4YmQ3WHk2SlNyOWc2Z1JUdnRiZHRIUTZCckV4?=
 =?utf-8?B?K1g5aTVsNFdyTmZ1U3dHUStwOWFuUzV0UDV5WVFXbWM5SEZWV09IazA4Ylk0?=
 =?utf-8?B?eHdGYlh0dG9uTFB5cStUUGlBb0tDK1dqbjBHUEt5alNDd2dKWFp6UlRJTG9i?=
 =?utf-8?B?YVY3L1oydFZHa0NybGVpbFVRRWt5bTlkblljTDU2MGF0RTRBblBWK3VsbGJT?=
 =?utf-8?B?d1Q5Q29ReG05ckJCU29NYTJoRDVjTDFjK1E4RG1kZk1TZkpkT1lMVERWZnhj?=
 =?utf-8?B?bWdONlZVUUp1bDIwN1Q4aWNnYWlnQlNkNXBnTUFVdGhwN2ZyQ0RGYXBIVTFu?=
 =?utf-8?B?THBvU2xtQ0ZtQzlvVHpLUkN4c25nL21oZk9iWUJJbG1HOGprazBQK2ZkWUh0?=
 =?utf-8?B?YjRtelpNWU9yZEVnR0p6dU9odUF2dnBDakxVaHpQckg3YlUyY3VRMmpXZEs4?=
 =?utf-8?B?UUFkVGtYVEVxY0N2cnJYd0ZFMnJ3NnNxWHY3MmxuOERoTHFvM3V2aTVDNnRF?=
 =?utf-8?B?STVPQ1JGUHZZYmpBa2tkaTl4QytqcHBjTnhLYnFtcVU4M3F6aDBzREhvb2sr?=
 =?utf-8?B?TzNZeUFoSVR1czFIYVJpL04vc09iQTdQY2w0MnNNaURPTEZ6UDQwbjBGMlN4?=
 =?utf-8?B?SkpvZlVkaHhuczJKdDJ3VVVUb0JtcXZOcnBudTNwWTFVNVBFVHN1SEd1a29j?=
 =?utf-8?B?eVF1UmJLT2pDaHUxRTBaSGJsZnliVnUyWU1vUmlUalZLQTlYaVdLSVRCOG9l?=
 =?utf-8?B?elFKU05KTGpHVTBrVXB1Mi9xWGN1ZXZHRlRHMk9OUk1kaUpuMkYvUkEwU1Zs?=
 =?utf-8?B?OWJqb3NrNVRpQnVDNlltYVJHRjhNMW5JcVlEcW5OTExLMDVCRjUwTGVyd3V6?=
 =?utf-8?B?NUxZN3NCMXJjQ1JVL0JvcnVKSS9wUEg4L3J1emI5bWtjeHY0MW9wajkxcUQ0?=
 =?utf-8?Q?71lvvRW3wosDJgOVl7JREyXHx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04adb362-239a-4ebe-ff21-08da7f69edba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 09:30:16.4345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sjiUyWO+I9s4ejZ1n0DjCrh4IycVIgAtDT3wwK6WZ6sS58HjRXTT9JiiSQZkymBee85HSeqjgkvoKFra4zqkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7353

On 16.08.2022 11:19, Dylanger Daly wrote:
> Opening sound settings in dom0 and setting the HD Audio Controller to "Off" allowed the VM to boot! 🎉

"The HD Audio Controller" is somewhat ambiguous - according to lspci
apparently you've got three of them, one named as "multimedia controller"
(and hence likely having functions beyond just sound).

In any event we still need to figure out what ACPI is trying to do when
the controller is being "opened" and why that doesn't work under Xen.

Jan

