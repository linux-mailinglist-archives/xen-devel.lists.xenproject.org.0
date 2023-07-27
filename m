Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22B47657C1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571201.894495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP30a-00082D-Hl; Thu, 27 Jul 2023 15:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571201.894495; Thu, 27 Jul 2023 15:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP30a-00080Y-Ey; Thu, 27 Jul 2023 15:34:32 +0000
Received: by outflank-mailman (input) for mailman id 571201;
 Thu, 27 Jul 2023 15:34:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP30Y-00080E-JK
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:34:30 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13c108b4-2c93-11ee-b248-6b7b168915f2;
 Thu, 27 Jul 2023 17:34:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8629.eurprd04.prod.outlook.com (2603:10a6:10:2dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Thu, 27 Jul
 2023 15:34:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 15:34:27 +0000
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
X-Inumbo-ID: 13c108b4-2c93-11ee-b248-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ca0HOO+pi0E2NpBixc8vErSV3SUEc8UVjruD2GP3yVXOwl9Ry5UQtAdjZjKzeSwaQaHp+y3xByha/6m7TWInjZX+7M4KgQNUKpYm6P/lVnJG79vmQQ1bpzuuTUuWeK3p0R/U/nn8StJsfznQRgIhN/51/HxDRiUyxZSZthj3z57yy9Z6AVjYTT5gvvmHv71g52KXtsSJO00xP8Jpyx79FjvTXMljTqYy7Cc9xDUPdAJ3DCnDRoUeDYY6oJ41zZInlwJXQJX2Dsr+dF2uRLQZc4FAnzs4MqgjrBV2u7+x873V77371JQSbGlIl9kqv/+7cUaSPnfXkLRJ5TSWjeP8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3BUIXDKbZGMdrwCQWh/VnR8gpfhh3HNbYZgfIl6PV8=;
 b=lCty4YEBaROnrmoPlNJBCGQkCSIpOX8GtSkBInHA6CyVgfDasOWcu8L25BQn5SIdJehWdj8EaSgoDt9ywDyi7pwYT1hadkhUhtTjBQo/+20RYJIwz3sDp7uMU8D9T6XgJDntIQl40uCxGPNsDbbck2IGakrDrzrHovcUf65EFiLcreJrBCKCzUTrdNvNKZbYOKmtBdekiqqfEF8sjX7g/DUNzoBjZ+dB1GncbANg4MRQ296PslerZzzXDZvkDdT38Kw1Jns3cyOClWOhr7JorgSFEFyc7USUs/YbJ7CgPMDfGrTxwI+WAqpZySrmzzamg5Dwrya+VeqLVu7cydhqMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3BUIXDKbZGMdrwCQWh/VnR8gpfhh3HNbYZgfIl6PV8=;
 b=eTfMyOuNf1s1pViHKH8anfh+4Up/YUUtBFHAhJJwTcNUVG9R8xQujcjywDH7PVN3eiWNrV2Gw1zf4FG1DdHQYbpAlyI1iraL8ZFrg6km1rYsdSFSVmXXaxs+zaee6V/oc0aJNt96zwGX/Mnm11Ya4pz3j7k+r1BfJpYDc06LU4mhcsTgGzK7qeUQXeoOJQ4kLTsqhRIfrbtwSPMCC/ilN+EFXs3hm5bnL8dXOs6gTeJAslHx3WXy04caSyeSMtI4JhxLBY7LelsjbZJL1BMSpW35Pqu0mRBrrYp5fouOP0xQ9PDW+FPEjHHJ+mYv/VclyzNov2XyskjBRzG/as+/BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae83664b-8e8a-acf2-d045-5ed6742b9e93@suse.com>
Date: Thu, 27 Jul 2023 17:34:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 3/4] x86/mm: mechanically rename variable to avoid
 shadowing
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
 <62f4a9e7a19b37c970e52f138a6eeb8f7363b7bc.1690449587.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <62f4a9e7a19b37c970e52f138a6eeb8f7363b7bc.1690449587.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: e01a5109-e365-4912-b2e0-08db8eb6f656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7n2bmmlHwvZIamJ2UbMCJ2MFMQTRlzYmGc69NooL1MR94uQqbiDw7k2XTu6uclga/Ad3XbfS+2+6dxXEybBjGMQiKzG37xERJnNnzXzrKekx5lJpB5xtx3jADOz+i7DimQDl78R50CyS31z+m/w/6hHtSWG0M8UPT9f4HR/AnvikALVfQgAiF8UhCa8su6HxEHj1/nhYPwAbGZsAkjy33uGoz2+oHTanGs90dChn+PNVLypcn8msyG6tNLpAFd9L7iZpvqoAbbK3my1nqA9VAAs+ztooM8RkdDnxOL4GVsFEciHDgjf/WlzETKzOlNRYvkg3eoN3Uq+/f1DZmBUuk/LyR5NgqsnxEeYpquqnG2Kokm4zlYbaos2U4Svd9haNlCB3hm7RTZYy2o3PE2jHCMvCVsb0tSyyuzJqIbeR9R/Z18eueJl+hcSyl94mAonLGQxQ9jwVBhgl/5MvKup72dJvHl+HDcO3Q16wa5jWcX77fZQtKYa5gPDLXEg135kNrpi849pysfb15r5OAwg6/QSHjEz/Wj6mWcyepicYJwWzZCVb02VcaA7cdoc/uvAVrImQKId0cMxKV1MkjJuRMdfQs6QeGwZQYiamZDinCOF1qSRkypagn3x+CDIZoQSbYnlE1ZA/xQCXvZD2m+NujQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(31686004)(186003)(6666004)(6486002)(6512007)(54906003)(478600001)(86362001)(31696002)(36756003)(26005)(4744005)(41300700001)(6916009)(2906002)(6506007)(2616005)(53546011)(66556008)(66476007)(38100700002)(316002)(5660300002)(8936002)(4326008)(66946007)(8676002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2Q0N3M2bEtXd0hkbkxEQndIa2NkRW51U0IwaVJBODVLMXdtd2xBbm1JKzBh?=
 =?utf-8?B?UHV0TjBNaURaQUEyQmNOWS9hbWxvNVpSQmFPTVNTYkJPVXFTaUpZOGR4Mk96?=
 =?utf-8?B?V0cxVXpKUXNGc3RkU2VucFIvSGYzK0xOQVpULzhxQnhZVjBpNnBndEtzMFNR?=
 =?utf-8?B?L1NoRlF0TkYyaU9JYjlWQlpXS0I1cWdaTHMyb3dUcnYxTnZHT1BJenpXRzBD?=
 =?utf-8?B?azVEYmRaQ1RCR216TVY2eldWeUdjRzhNNENzbkRrdWFPSjd0NENubWw3dC9l?=
 =?utf-8?B?RVdXcnlHQ2pzemJOS0xYNXNPQVdjdDhqVkxPeTU0UU5aNmNNTGJ4RTZGNit3?=
 =?utf-8?B?QWNJSERtajZrZVovMGtkM3BHU21RaC9VS1pEcWtXNVZtR3FQbWx3OTlNWHZv?=
 =?utf-8?B?VEpWN1dtUFNSQjNoODN1VTM1MGZMVnBPVis3RkJpd1VHNi9iYldpWkNhbEpB?=
 =?utf-8?B?SFRSQXpqc1NzMkdpMjcreGdoLzc2YS9ickNTbnBaS250aXFUWkdsZ1FpV0Jp?=
 =?utf-8?B?YkJLcWU0NFBCQnlTNFMxOGY1cGNSSVBtTTlwakp3ZDFzOUx3SUs1VGRELytm?=
 =?utf-8?B?TEZFdk11bjJFcFZyZUFOMzNkVFJYVVJmSmRCRTlZcmtmbCtBY0NRVDFxa0E2?=
 =?utf-8?B?MjBPZTZYdEpnRW5ob1dKcGRsSTVWL1ZGQWsrQkRFRjFKRzVCYVJpMmJsVFp0?=
 =?utf-8?B?QXd3YTV3M1cxVm1NUWRROUZnbkJoVDl2eUtmbSt2RUplN3QwUnpXQkEwWjg2?=
 =?utf-8?B?UnBTVzVyQi91N0RIYTdzcFJIMU5QYytLRkxiWlZad3NBc3l2TWE1dExGN1VM?=
 =?utf-8?B?dVV4VDdJTWdBUFV1WTE2bnQ2ckZhWHhPSkh1elFMRDBUNkhwUDlPNHVpeWND?=
 =?utf-8?B?anQ5cmdYeXBucHFqVlgvOGFzdVVBSWhlZHNZTGF6QWdNZ2JEN3N1VU9Rc1lx?=
 =?utf-8?B?dlNDd0hjempQU0xGZEkwaXBvRm4xc1RtTUFNS0ltL3NpVFdkWkRiV1NDRDFC?=
 =?utf-8?B?WmJSbDhSZjdpS3ViU3Y3NzlTajhUanpJYnNHbFl4a1c4SHNuQ2hRbFNNS280?=
 =?utf-8?B?SGtZeDdPMU4wMjFuRUxGUkNETlgvdHltdG8xRm5EUEd3bTVnUFRLRGtZRkt6?=
 =?utf-8?B?R0w3TEcxZmxNUVcxemRtWGJ5d3cxdUhMaEFUMjIraHlidzE2azNydVNlRUJr?=
 =?utf-8?B?cFM1Tlc5MWM0TUpid25XcDNEbE5aSlNwWi9KWngyL2ZqQ1JXTHh2cXhlSFp0?=
 =?utf-8?B?b1BqRXcrTVFWcTQyem1mS21ad0UvZFI4VXNJZVY5SThiWlBvOFBUNjFlcEQv?=
 =?utf-8?B?bmNWaDVwamllN1VNMFZvbk56eW4vOVJSQXQrYjVkS2p6enN4ZXdlRG5ZOHg1?=
 =?utf-8?B?aVZLSk52RVBnV1FkZzRFL21ndW5xeDV5eGhRcnJXOVlHYXA2TEc4b3dYNFpr?=
 =?utf-8?B?VktIeGhFdUZJMTQvM2tWQ1hpem5WSDB3YTkwaHVmdklRSTkvVlByTlFmYzkw?=
 =?utf-8?B?MXdIOGduL3l1N2VwQ1A5RFFuVHg4Q2V1bURiUk9ldnpySDZ3RmRXOFhTdExk?=
 =?utf-8?B?NzJteCt3cHFXOFRvSElzU2Fha01DTU9KZXo5eVIrOHpyaHVOcE0zTTJBQnNw?=
 =?utf-8?B?eUd4V3Z0T0hGZmtPclVEN2VYZU1ickxUNEk2YWs0K04vS0djVG51S0grTlBL?=
 =?utf-8?B?bFhHUU9aQXhOMUlueDU1eEVVSndGaVZVV041VktteGJjcUxNTzR2UzZJVTJO?=
 =?utf-8?B?VjZzdG9ienpPbTROREJhUS9Ea0U2TDI3RTZheVlrRSt5a1lidzh2cG01K2dl?=
 =?utf-8?B?VFFiVEJudzY1WGJMck1RamJiMVhKMXh5VlhSaUt4TTloNGFQdFp6L1Z0aGNE?=
 =?utf-8?B?eU5rekc2M2F3WWYyYXdmeTFzNzFuTEp5SVBwRmFxY1ZaRnZzRHBLTDZGd3VM?=
 =?utf-8?B?UEVrRVUzQmxTanNVcjZ1RDBzRjRXVjczNFFKd2k0azhJSzdTNmFNaUh3ZTJz?=
 =?utf-8?B?ZWdKamhFSVF5OWdiOVJ6YWpTdG1NaFc3L1ZBNlQyeTFuL1cySDB2M2xzempU?=
 =?utf-8?B?REl1S1dUSGtRWkNqSWd1R2lrS1VVenBnM2VoNm9PeHVoNVMwWXhweTBqVEo4?=
 =?utf-8?Q?9OdeYXdB1hyAdO2bF71gI8jhJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01a5109-e365-4912-b2e0-08db8eb6f656
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 15:34:27.2915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gs+4MgeeGAWI/zminBWB9zGUgIR8qyO9YwBZN7geNGaCnGbTUaNDD0NIPgrTbm77+/lYjNau5woVG1T4XqX1Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8629

On 27.07.2023 12:48, Nicola Vetrini wrote:
> The rename s/p2mt/t/ is done to avoid shadowing the same declaration
> in the enclosing scope.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Is the semantics of the function altered if the inner declaration
> is removed entirely?

No, that's what should be done. It's an output only for get_gfn().

Jan

