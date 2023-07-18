Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F3D7577BD
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565014.882812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgsH-0007UN-BO; Tue, 18 Jul 2023 09:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565014.882812; Tue, 18 Jul 2023 09:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLgsH-0007Ry-85; Tue, 18 Jul 2023 09:20:05 +0000
Received: by outflank-mailman (input) for mailman id 565014;
 Tue, 18 Jul 2023 09:20:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLgsG-0007CJ-0o
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:20:04 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe13::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 464a5a9c-254c-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 11:20:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8791.eurprd04.prod.outlook.com (2603:10a6:10:2e2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 09:19:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:19:59 +0000
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
X-Inumbo-ID: 464a5a9c-254c-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKFDXSBufWa4z5msnKa0EuiFrFJuHkTUQPs5dYoubd7Ut87Sd0DrRD15uNB4nL4BEmGJDh05PceAy/wgDZ7zk2uHl0CPLzu3ez1OdHQgiw6WufW6LKiuBN2Yhn5cQFrXpC+rK5SYyrMDy8e0ED0WBbAscZeAVFgb7YV7CVmFVLBut+q/ZdCqvnDQFSmZRuY+bw1NEQDzj3vp7v0SWtDKowIfpDTH3h2uaofyMvHnIv511oYT/2XsV9wnBTvRVi8PZYRD1aGY0hZDgGCb2Rwb0dGTwJrIwRWXucex+Dh3k/iu/y0jrRSGg3s4+chTSxrvpqMmCGjqXMbu5UaI1Xdf2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQCE1f9ksBOKVEgge7qIuKKq9qO4QWavw3NBoBaHnME=;
 b=LovbGuOmNL4rozw5Mp1+ZWmjtAWVCuG7hmR78gIx58onqZxmKgtI+MUUSgBaNo6+RxOfrFHS0w2hv4AYwZ34JHX1DJ8nwAH1LYwRINcOKPqZLOB/x/EMWANlDCuU7q97cZ9z//PUjiCv51W2u5rs4DCNRofB9M4AF3I0DojiZxGde58guz70sGMOe4ruvpCTByoMxUeDO+bOcAc1rrHpIRb6n8gV41dQ/jT6+ur66Gq37ZLRsoJd8Z4kH6Qxi0/jlu/jSG3/TJS+7REbTlztrI21/OfD+vh6vIXI4fVs7TF0faD4l7cobLS40GKrQf5GudC35TE6Jff+s/6uVkbp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQCE1f9ksBOKVEgge7qIuKKq9qO4QWavw3NBoBaHnME=;
 b=bb4aGRG2LA9Ercbkduva/DLD3n2fAXT8I5xwJoMUll1PtOxVQWIzSlpFtFqN6X5dqU91r8Ko3fDptPqUIX0Q6Mzd9xwTcHrisXlbqIA//zIxJlGL8h5CqnvY4gIp1IWoX3ai84JArEWIC4mOuokTc8QEd1oNhGRqnN4bVurnaIahhMNVEcJ4YDYnpLXwknWmIJgrUrgqmqV9YqYDB69eZxM1wP2ZSp+giYJ0A6bKm1NN9NQPnqP5TDWSma0+R4hQi71YKvpz4v2nWZb5225tq1Ni33IvkMgtBvNxijYZE8Z7LgCpnrUBIYrNOZuzJMM8StuQUSUW26vEZTeRnfM9Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e5bd2a4-d810-cc48-cf43-3ad64e501d55@suse.com>
Date: Tue, 18 Jul 2023 11:19:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/8] build: Remove CONFIG_HAS_PDX
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-5-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230717160318.2113-5-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf77b40-e3ed-48f6-3cb8-08db877028fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zv8il2pYX53MIw+Frhk7VGJqGYpnk1eDpsw3e0GwPpn3ci3URcNZSkL0TCVWyrMMPPJiIEJ8xlejTQ/lsTueLm4X+ynIY00CuQO304NPHvuL5C33IGNKYZC8Ui28aWJfTQz/d/RMhIEFpTbqysuQ5WRSNBd59qrLbNGTWZeJNCdgaavl/i2oLCr0omM0JysAoTWmrnAfY5ZYs0+EwLeOPlLsToD3op2Q2bIm3k7P6iW+rnf4nJKSfvesfgr2Q5K8p0DyP9A5o3e2kdaRBQFZ4+dW52Wvxm8FGijkD0ZuJdTgn7JjT4wrYjTnY5YT9Sx8+gUcau5omJfpfIaPqUWx8p9lqfmBj08XmzdnTtQ0L9rQua/CPYwJMNmmRVUaFI88dLVTy0q3JoWklBPkZJp7JdyVOCnJLcqaNeNAgdK+MdPcAT/vKeZO+/3DKCQ3TyrYjdiR9ycUW6bV//djWQe93LXjTtpQ2ArNvUco23od3vr0y5N9I2yMIMJHESuCVBGh+6CCh+ZfUvuyYIT6zy+MuSpBtYhNVHEehR/2o0NnebAleqowu9wD3mjUhAxDJ8ySB7+bvIXmg750kg77RZVPotcCtFb5IFMXvZsSXOjSq2u6OvpHOfGS4fnUzJ2fcTzqZeB5TueHeh1SFFsBs45DKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(31686004)(66899021)(6916009)(66556008)(83380400001)(2616005)(41300700001)(5660300002)(36756003)(86362001)(31696002)(7416002)(8676002)(8936002)(38100700002)(6512007)(316002)(6486002)(54906003)(66476007)(66946007)(4326008)(2906002)(4744005)(478600001)(186003)(53546011)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1phTkJ2ckp5N05RV0Y3MDJpUjJENTNBVDZEZ2dKKy9QUXI0NjhtUThCWVQv?=
 =?utf-8?B?bzJOc1FTTTFtUnd2SnNvR3dLZjJSZ3AwMUVMUjI5a04xRjBXbEV5NGtabi9V?=
 =?utf-8?B?SlpINjBnSEMvOGhwM1hMVFR5cTFOK1JIdkNXYjNoLzI3TjE0MzB1NDAvUW4w?=
 =?utf-8?B?VnlURnJzbDM2cmFxR2NxMkdsNGorbkRzYUxkcTdpeTM4dXFzaVNmSVpHZlUz?=
 =?utf-8?B?NldFaEZUMytiVHpOYndvbWlHV2JLc09zZnluNzlYR2xkRy9qL29HOVJ6YS9D?=
 =?utf-8?B?b2ZScW9TVUFESXV5MVo3SjM5aGVIeFZoMi9XV096T00zQlRZdStPTFgxZmFV?=
 =?utf-8?B?TE5mK2luc1JHdjJkZThVYlRGV3VhWHR6RnVrVVRZUzZzY3RiRGJWVjNqNkFj?=
 =?utf-8?B?S3hGUEhIaFZGcFFSMTVJN01OeU0vTVFmTmZMSnNNUk9TaElHNWZNN0FXY3ov?=
 =?utf-8?B?TmNUakVWekZCZVRmMlUvTUtOUDJvRUc3eU1rTTRNZFBuTGxuWE4vUVV0N1JY?=
 =?utf-8?B?Y2ptalNsdklUWEd3eHhxUDMyeVFxT0MzNDBIOVA4bjFZdUdEaU9aRll5Q3Zi?=
 =?utf-8?B?c0ZiZXBJd2lLVGs5b014WlpvSG1jenlRbjMyUjh1S2NBcGE2NHRiazg1QnVq?=
 =?utf-8?B?MFNTeTQ0cVNyOVNoTGk0N25QS1Nnb1piUkYvWXhRRVRuY2dyTlVOMWFTRFFC?=
 =?utf-8?B?MmtmKzFxV3phS1paNmJxaWRZYkNJMERRYjdvRHRjUDBtWFdaZVE5K2tFVCtn?=
 =?utf-8?B?bjd2OVFZWHg3UkNRcks0ejR6YkZlRWdjRmlVbVI2K0YrcXdENzZFMU9rS0xt?=
 =?utf-8?B?eElzdGVwU2VnWUo2ZGdhc2ZHUHBLeXRHck4wVFN6UzNoSnNkT1gwV1ZJMW5C?=
 =?utf-8?B?R2FHTDh6K2ZsQlM5eGx6cFd5NHJBZzZIVDhTWU1IOG9vd1dzSDIwSHd2SjBV?=
 =?utf-8?B?RUlWS2tJWjJOMEFlK2JjWm9CSHRLRENFVkhvRHVMRU9RQ0RYS0VhSDRpdDAw?=
 =?utf-8?B?YzFUbzhLZFVJdWwwUzBtdDNyTXNqQXNEV1ZhRjJJY01OMTVOQVdBVmFsWFYz?=
 =?utf-8?B?SFZrZjk1ZzhsNW5kdXg2T25aaVNSOVNhRkFrSWN6YnREU3poZDlPQnBiQUdq?=
 =?utf-8?B?SStIVmFwTm5yYkw3a3JoNmsyRVhCdGdaUGZ6RFpEa1dCSTZJc2k3dGFkQTZk?=
 =?utf-8?B?MjlNVitzWTVWMWZXc1ZRY0t3dUdCK3p1TGtQa0phNk1YSmxFMkxlcXh2ek5J?=
 =?utf-8?B?MXVicngvSGtsVHdvWmNRTVdQRUpwTnVQcjUwZThEK283QXRUcWhZTC9kWE5x?=
 =?utf-8?B?ekdWekM0c2tnRWxhQ3pyeVQ1MDBUc3VUa3hCcTV1dExIWVpQRFF1TEllQ2Rr?=
 =?utf-8?B?d3ZoREVtWm1Lb2Rwdi9BbElUbTNiOHoyVURHd0dlVW9JbVVqdE15NnlUWVBw?=
 =?utf-8?B?UlM1Q0lGS3ZsM2FYczVyaDIxTTBVSVRGaHNQSGV4ZlRGSVZINVRzbkxQbm9s?=
 =?utf-8?B?NUZISk40YnFjUWJpZ1F5Z2RPWDBjZXFtWjQ5UXJ4aytlMllXRlpmNUhDeUMy?=
 =?utf-8?B?c2xrYmNiN2g3WG5VMEt2ejRqNUpQd251d25yWXFLREJSWS8ya0xzQU1jWnVU?=
 =?utf-8?B?cmYwWmZmYXlCdjZNSCthajI5dXJmblE5WXZURFg0RVlxVkNiVlZFdXpuc1A0?=
 =?utf-8?B?UVZqZzFOQURrWmpaVm82Z0pPZXdMekZrWllnMVhGVTlHQS9LU3NhWVpBL1pH?=
 =?utf-8?B?dnFBcGtqSVFzenQyV01QTDFiR0RQRDJIQlFWSzZWbDh5M0tZOXpIaGdhbW5B?=
 =?utf-8?B?NkZsMUljUWVya0tpLzFMVzR6aWZ6N2pzbkNCNGU4UFJ3MzFCaTJDbDFjU0U3?=
 =?utf-8?B?blE1VlZEYkM1UmRBbmVKNDRpQUZKOUR3ZmVNWnVjWWFEMENZQ25wL0RjaHl2?=
 =?utf-8?B?YitjcEdwZjlKdGJSTWh6VXZZMHQzS1Eza29BdFhJd3ZQV1NiYUt6ZGNYZXBB?=
 =?utf-8?B?VG9lVFoyZUc3bDZWQi9QR3VvWU41bElRYVVsQVRHUWNFSmg0ZjBzZEdaUTNW?=
 =?utf-8?B?c2xBaytsVm9aMHdSMHh6Q2o4VUk4SGNTa2FHNUIrRVJtZDFOcFRySXZLN1Zw?=
 =?utf-8?Q?vugfB2qCulZprhKHqVw2Br9BG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf77b40-e3ed-48f6-3cb8-08db877028fc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:19:59.8129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uf11eJ4tYXvxLzGH2weXR6GjG6xn+rRlrlrcT8wK/lMwq5/+07LT+R7Pn8bEDX9Fi7phdpBuwRPeAbFmiLlSXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8791

On 17.07.2023 18:03, Alejandro Vallejo wrote:
> It's set everywhere and can't be turned off because it's presence is
> assumed in several parts of the codebase. This is an initial patch towards
> adding a more fine-grained CONFIG_HAS_PDX_COMPRESSION that can actually be
> disabled on systems that don't typically benefit from it.
> 
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

On its own I don't think this is okay, as it's unclear whether it would
affect RISC-V or PPC in a negative way. If at all, it should only go in
together with the later re-introduction of a CONFIG_*. Still I question
whether that new CONFIG_HAS_PDX_COMPRESSION (which imo ought to be
CONFIG_PDX_COMPRESSION) then wouldn't better depend on the arch-selected
HAS_PDX, such that it wouldn't wrongly be offered to choose a value when
compression isn't supported in the first place.

Jan

