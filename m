Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C345870F9C1
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 17:06:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539120.839688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1q41-0002Uo-M6; Wed, 24 May 2023 15:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539120.839688; Wed, 24 May 2023 15:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1q41-0002Sc-JI; Wed, 24 May 2023 15:06:09 +0000
Received: by outflank-mailman (input) for mailman id 539120;
 Wed, 24 May 2023 15:06:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1q3z-0002SV-QW
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 15:06:07 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8228acf1-fa44-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 17:06:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 15:06:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 15:06:04 +0000
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
X-Inumbo-ID: 8228acf1-fa44-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZoXzqdjm7HBz6DJFAeUEw1IWp5lpdYfmC+Zue3n2l7j4eMq6G5ONUALU5B1zn+I2c+sJSmn5/U73PbHllS2W5dc57TS/Xi0CxUuQJ1+CqGVeM/FMgzdB7MOtHz6aVH59RTlCou3z4wK7+euTqB0R8POS9a6Ib5/Bh/duYz80kmp6hHCLZRG5trCOz2CIkT4XwUosW0KbNIgayHZHNEAsevdrJuXKPN1T+RySgRLfr+LWwzoaJSzPDscgmVzF1TbpWojkkt5dkZMXn3eS2HkDSzLvqu0LfQwg3Vt23Gn22ae2Z0C0F79SCPm0Y/2ctj/4WeXptnwbem7ZTKp9QGADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBSHk2zYjykEsi+9PNwsLEpLmZCZWe7xTM/ThcZSASc=;
 b=h3GxkQRe8bL9Cjri+7duaPY7LA1fAfgDwDwZW8XLLLyrpBy2r3iXyosrf7oqkNf+sYt3B52ffm7FlBF/GZIUYxUACXkbJH3uS7GahrCiedErF/yz1Pm+1ywFiJ86xky5z9BL15ZEPU8C2rzuPF6K2VnroyZfhNrK1W/35gwXAGK+rrZykWzWbpPfyMVL+VyY3UJZnGopCUPSU0DbYJe6sS5uixTylwIHUgvmeORnifsD5EytsgiXv1cdHK/XANVe53LNoILbwSiSvJ5kZusmfGdFJ7XDeUwpBYjeYr+L3P8cQ0wHYXfIHTmybFz1qyitd13eosTKKDHPn9ZztJbh3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBSHk2zYjykEsi+9PNwsLEpLmZCZWe7xTM/ThcZSASc=;
 b=kTlZmiUudqLrVM+EYKXHqqV4KxQ+HUrggk2RLbTjIjMDAGFSmxMVTsg+1fd8XvPTJjLBwCjYjsMfkn/g5jZvXiWADTjnOYVOq1yoWNvnoWFPHGFj3KLEzgBDE9Ese6+BwxztHAPeIBqDo4BtFjmhFWBeu93tt/pssRLhjg3UaU6N3qkrjLlJ2zvBEzW8t2ntbbrV6vz6IV2vuiikLbDfZgT5FrUbCnpFY7PZjCc6FD14BD4EDbIzfGGXD1WK+S5NB00ST/RMQa5hvj9WdxJzTQDTRpEOKuhSP9H0hAYcJk01P38Iw86lMj8j/Z0q4ndspZwMD1Z1rzRuwVOhmIJ6Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44f4710f-4cc4-55dc-dee6-33b3f6f70f75@suse.com>
Date: Wed, 24 May 2023 17:06:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 10/10] x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS
 check
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
 <20230524112526.3475200-11-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230524112526.3475200-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: edcc1309-4b77-4132-94fe-08db5c6864d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IRTNzOXiaDoNCqAW3dwVk50YWl1CnCfciiu/LDTNIuwovBwVmqWrrbFushcdnv/h7EE/TX3le9A0oYatjVhP2jxkQcIFUTCK5dz9zjI0YjiJbfOguctXH8JhG1kJ4V/BqvCeqA/QndWb2SX4Ae5aupOcMoAqhFTSwaNd0AgfQDwTOQUJj060K9+h2LwX2AklnOdRWBKfp9tbGnP29ndKWRWCUeTtQ0DbgrhmOzLyqeRLkvuVCoCtXOXzid3F2pHm2m4jVQGkP3Kcsp3DEhM1w5HYXp8jjOLi1eRemjVR+aixzKLGcExCtgN343Y60I+WwhZmwmGt6r+bBtY8UeLTMyJ1iZplXzft/jrnpgU3WTsPHL6F+5pwe1mbjUESSunbyTyJEihozpGvWCQU/uBx8hWDTODVDvPPdg8luSipIvaqnrH7QdnBaA+uGjXaABgdnhTV/+P960HYsAKSFBIouiUzQHMMPlxyu6d5yoc8NucKLTkRnaZIBmTN0NuA9bIKTuXK33WKCoDNVfNMPHFPlGqEWrHCxOkb5Aj8peGRCvNBm9VnQEIQ7Pu2E5GXVnjV0ZKjWvJROaL8M2etMyTb4gMak/8+L7AOquMopGPNzEhxT7Yv4qYzRLfpYR1dXsHtgh7DPsdERYB2PJFrqCZt2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199021)(478600001)(558084003)(2616005)(86362001)(38100700002)(31696002)(6506007)(26005)(6512007)(36756003)(186003)(53546011)(41300700001)(8936002)(316002)(31686004)(6486002)(8676002)(5660300002)(2906002)(54906003)(66946007)(4326008)(66556008)(66476007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1ZEYzFQd2JCdUIweEhMUVorSzVDMUxWRVdEUG1zVGpPL0RaTUdwSi9hWG1C?=
 =?utf-8?B?ZGdWRDA3U1JFeUR1S3pxaGlFSVpMbnFMWEJSMFRjcHFZMlZCQTloamdvTmlC?=
 =?utf-8?B?bmRoSzB2bkh2amIvTC8vRk5xcHJmeDJxVUdlcklsSXhvZzIxMzlkbG9ZTDRx?=
 =?utf-8?B?MTRxYnZHc2xhM0EzUEIyQWF5UGIzTXI0cFRFZkprN2ZVSGNTMnlmTWJZU0VB?=
 =?utf-8?B?YnVJSU1XVGNPRUl0N1Bsejd4MkYxMnBvQW5LRmFpQTdwUjdtZFB2enBnSU9t?=
 =?utf-8?B?cVFSVXJFRW1FNDdzZ0x0TW5SNk1UUGEvZi84bVlveWFXMXZFclJQSU12T3dT?=
 =?utf-8?B?b2Q1RTVtZUhCd0ZhaFdLSXZtOFBWbzJnejF1MnRrL0JpNWRwbXd6RG9Xd1NF?=
 =?utf-8?B?eVQxL1llQlViR0ZOOXd0SE9SV2NoOXpvTGthc3dmYUxHWE0vSFNXRHdtdU94?=
 =?utf-8?B?MDZWZk9UYW9CMm95RCtxMTdxOWh0QXg1THRrRCtnMEhaZ1l3dlJid2pPcFh1?=
 =?utf-8?B?eS9lTVhrWnRrZEZCY3dDemFhK0gydnpNRTJCV0VOdWtqU0FxMm1vVkpIaUpK?=
 =?utf-8?B?dDZnWEdCMW9kRFg1MFNDZzE1dnNhaGJhajFaR2VsMXNWdWZrdHZQY2hWVUZ0?=
 =?utf-8?B?ZjNWRmpQZkhyZ1lyUC8rU29qQXRHTW5CTUlHRmhvbFB0dG9pSlhVM2IrR3FN?=
 =?utf-8?B?cU1OVVNvMVRSanpHMmkwdnZFdkZ2MVNDV3BITmdpNnNwVUVsaXkwTHJiYjA2?=
 =?utf-8?B?UUZubEwzcnpzcWgvcnF1TnZ6cFJCcXdvd0JvdmwvMkxLMWo0UkpBV2tOd0Rl?=
 =?utf-8?B?Z21VZEtPYlhhRi9LcURLYWpzYlZaVVYxREZaWCttRFdMcW5paitUOEozdmVK?=
 =?utf-8?B?MjBWWGViVFJGeUM3OXQ3YStjeTVQMWlUNjcyK1c5a3JFa3ZScnU0Q1JhNm5M?=
 =?utf-8?B?djBuYWNLeXJvaHU1NEd1Vng1MmVqSnB5YS9QV1RxNXBPVzZXZlM1ZG11QVV3?=
 =?utf-8?B?ZFh4Vm0vMm1LZjkwSnZhQUlnZWR3R2R3V2JlR1ViVlBQSWt6VXBEdzR6eWwr?=
 =?utf-8?B?aEtSekxReWhWNWR5bFRMVnl3Mjhnd3NIMkN6T1ZGYXNVSVArTTJNVXRwTVBM?=
 =?utf-8?B?cDBJSHpqMS9wczM3YjQ3cTg0U2lWcFpVN2xZeUF2c2pibkYrVUlXTEVDbFJt?=
 =?utf-8?B?OE1HUTlnRDB3bSt3SFV1azBpOE5oL2xPMjA0blNreHFnTldaMHJaV2RzNGVk?=
 =?utf-8?B?NnFrVUVLLy8xT3ByaDh5VXp2OG14alJYSGFzWFk5d3BIVXJIZjFnRzFDZ0ZR?=
 =?utf-8?B?OXptTDAxS3Y4eEdOTVdCV3NEN2VxNmtTdTlxRUtzclhQbUpuWmR6NXJhb2or?=
 =?utf-8?B?aC92RXRVN2RqQ1NiRk04U0NpS3dLZzFYZmRoQXBLczM3VURCQVNhcm1ZSEU0?=
 =?utf-8?B?M0R4OUo0cGttdFNwNSsyV0FaemJtTnllTkh5ZmkxNFM4YWhpendXZHpCQUNJ?=
 =?utf-8?B?NlpHVnlnMjNZRmJiMk5BOHgyQ3RKdTh3dHVweUJSZThTRGhhOGlrdjZMZk04?=
 =?utf-8?B?eUxGSW0rS0htN0RVdEh0RVdwZVpxTmVOaHlTbjJyaDRjblR0L0ZqQWdOeFU2?=
 =?utf-8?B?WU9kNE51dVhmRkNscHE3bXkrbXVHZUpKMCtiZk5ZRXVaT1NSMXBPK3ZwV0RO?=
 =?utf-8?B?Q0lHMUUxNEdtVHVmNm1vSkcyNngyczFua2YwYmZCblVoMFJ0QndPRnEwSkZB?=
 =?utf-8?B?VHZWWXZibTJ2Q0RlL3dpS2F3ck44WkhCazVyK0FKMld2RmlvaUo3ZTdsLzhE?=
 =?utf-8?B?V214NXQvdmJZNXpkdUdCc2wyZHNWalVwZmZYWjNWR3JGOU83Vk9wNUl1dC9n?=
 =?utf-8?B?bkcyMUdGdTZGZXArdm5yY0FkUzUvRXhNWmE4RjQ4V1VzSnQ2MEdzbWR0NWth?=
 =?utf-8?B?TlBQbWlOU2dJVHdkajJSbHYvMlhxME9BQ0g0K2VLVGRUN1Rja2N1S1Jsc0lH?=
 =?utf-8?B?TVVid3pvUlExOXlEbTFvQmFIQlBoTU8wcCszSHVUT3BJZ3RFYVhRWWFRVVRj?=
 =?utf-8?B?V3dNdHFRaEJJZW95NEh4UGZPRVcwV3lMZ2xRRFgzWnU5UkZ3ZTQwdHlVbkpz?=
 =?utf-8?Q?J4rSbBk4rYh2lkXPy5nRPYAUD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edcc1309-4b77-4132-94fe-08db5c6864d6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:06:04.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oGwnKHMn7edX55eXvW26cNWDGnvMj7RrtYphINZAyaQ2t3EcvDOEhBXi6mFsAXGtmLZqM7FoIh+1jWrNqsmclw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9424

On 24.05.2023 13:25, Andrew Cooper wrote:
> MSR_ARCH_CAPS data is now included in featureset information.  Replace
> opencoded checks with regular feature ones.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



