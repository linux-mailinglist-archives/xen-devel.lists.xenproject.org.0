Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC29373B0F
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 14:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123089.232187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGZB-0002mr-Cl; Wed, 05 May 2021 12:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123089.232187; Wed, 05 May 2021 12:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leGZB-0002jy-81; Wed, 05 May 2021 12:23:49 +0000
Received: by outflank-mailman (input) for mailman id 123089;
 Wed, 05 May 2021 12:23:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTpK=KA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leGZ9-0002js-L1
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 12:23:47 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e8cd0b9-2124-4255-8322-661ef7aa84e9;
 Wed, 05 May 2021 12:23:46 +0000 (UTC)
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
X-Inumbo-ID: 3e8cd0b9-2124-4255-8322-661ef7aa84e9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620217426;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IStPD8hZzviPScV4zEwwK7+8HGHSP8ydKF4ea/UA2fQ=;
  b=gNacauTZVRwp+PfpXRC+3gLf9N2rjtDgoft6PduTc1CtKbzPUgx6NxdH
   BjjIZEHmlEdKAzMr1SYplsDr7eV+ITt8b4N5nQk8IUjJtOvNOrMPM/sNM
   czieUEnC0jIOR4fL2q8iVAjKKdasyXdHX/9LffUVOpQdIA+f8RmSr3i/l
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jnk9VvhbV/uCuP7xErOyGCiel9Zx554vlcPRMCTAdpxIUnUZrfXeRF0FdJpdz73gUmZjtloK8V
 qaScTf0nF9Op9dY+TildfPZD7MAn53RRyDbVsNvMLX631CJqVyN7etu6wTpuYSe+QEopN7Pgy9
 76QdJmEAxSkItV+uDEMkhkjdlQ/H9GmeKZ1mYFEKViK76/saHbOe3PwCJ8ljhWtJu9Uu4wBDh/
 vUrdb+vpi2id1gR0UPCyB/jJnGBB2oLcWcDWEhZjBtzSMVSfPN8eLOu6l9o/uAcCumNM9u0jzt
 cUE=
X-SBRS: 5.1
X-MesageID: 43120754
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:C1UayKmHcsKWR9Y0FW9/Tm4cQoLpDfOcj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0ZNi+wOCRNNW57LLA+E4
 eR4dcCijq7YHIMbtm6AH5tZZm4m/TgkpX6bRkaQyM94A6Vgj+yrJL8GR6U3hAROgk/vIsK22
 7DjgD/++Gfo+i2oyWsrFP7wrZ3vJ/aytVFDNGRkcR9EFvRoyuheYgJYczhgBkbu+eqgWxa9e
 XkgxBlBMhr7mOUQ2fdm2qQ5yDF8BIDr0Dv0kWZh3yLm72IeBsfB9BajYxUNjv1gnBQxe1U66
 5A02KHu5c/N3qp906clru4JS1CrUa6rWEvluQelRVkIPMjQYRcsJAF+wdtGIoAdRiKmbwPKv
 VkD83X+Z9tADWnRk3e11MfpOCEbzAYGxeLRVU6ocqF0zRat2AR9Tpn+OUv2lgH754zUJ9C+q
 DtNblpjqhHSossYbt6H/ppe7r6NkX9BTb3dE6CK1XuE68Kf1rLtp7M+b0woMWnYoYBwpcekI
 nIOWko+lIaSgbLM4mjzZdL+hfCTCGWRjL20PxT4JB/p/nVWKfrGTfrciFvr+KQ59EkRuHLUf
 e6P5xbR9X5K3H1JIpP1wriH7FPNHglVtEPsNpTYSPOnuv7bqnR8sDLevfaI7TgVRw+XHnkP3
 cFVD/vYOpa6ESGXWL5nQjxV3vhdleXx+MzLIHqu8wojKQdPIxFtQYYzX6j4NuQFDFEuqsqOG
 tySYmX15+TlC2TxyLl/m9pMh1SAgJ++7P7SU5HogcMLgfRebYHsNOPRHBK0BK8V1tCZvKTND
 Qai0V8+KqxIZDV7zslEcibPmWTiGZWg36WUZEGmOmm6d3+cp01SrYqMZYBWznjJlhQo0JHuW
 1DYAgLSgv0DTX1k5ioi5QSGaX4bNlzgACiJOZOsnLBvUCgpcUiL0FrHAKGYIqyu0IDVjBUjl
 p+/+s0m7ybgwuiLmM5naAFKlFWUX+WB7hHFQyBQ41RltnQCUZNZFbPoQbfpwA4e2Ls+UlXom
 D6NyWbdcvGBUdntmlC3rzn9051cWuhb1t9A0oKwrFVJCDjgDJewOWLbq283y+qZlwOzvo0HR
 vFbTERSzkejOyf5VqwonKvBH8mzpIhMqjhF7wlaajUwW7oApaPj7s6E/hd+4tFONjivvQQa/
 +WfxaYIVrDeqUU8j3QgkxgFDh/qXEin/+t5Qbs63Kg2mUjRdXVO1ZrStggUqehxlmhY8zN9p
 p3jdg457Ttdkrwb8OL0qHRYXpoLAjJrWu/UuEvrtR1sMsJxc9ONqiedQGN8ndNmCgaBoPTsm
 g1Raxg+rDPOoN1ZaUpCmpk12tssO7KFVchtwz9P/Q3cl4shULKJt/h2cu8lZMfRmm64DbqMV
 aR8ydh7+7IciuK27kdEb8xKw1tGT8BwUUn2OOJbIvLDgq2M8lF4VqhK3e4GYUtApStKPE1rh
 xg5cuPkPLSXy3k2BrItT8+Bq5V6W6oTYeTBw2LcNQ4vuCSCBCpgqGw5tS0gyqyYTyna14AjY
 kATHcuVK14+3Afpbxy9DOzRKzxql8klFUbwQgPrC+T5qGWpEHBHU9HNgXFhI5xRjc7CAnQsf
 j4
X-IronPort-AV: E=Sophos;i="5.82,274,1613451600"; 
   d="scan'208";a="43120754"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7hr7D6yfh1+jfbjVrsllNfN7sJTcrQVpy7XDhlE6MLVjMjYt2/TtCCH1SjMUXv+iTftjtA8Hm8YcGQzGFt++RRqmoKCXiHFKal+7yyVeHivBaWLDcnYBJKFo+hC80KD0JaoCKtiXMtMAW8Pyh58J6jogQ7dS7M72XaR/8u8ivJKvIacLbVQKabn2BpCpvMb22d1NkVbh88ykYYD0OepqlvhPa/7hDLcyH6J8IieZlT1LPFvcN2vXyRxJSHdmuIhSH+PXyKJ4J1FDArRsFXatGrjmFYU27NDEeJ84HqI6+uzI1wvd94K3v0wzlpB+ZYUMIMGNESb9LeF6XPqS91/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQXbRTOV/O+7P3DEn863dmhXsUirKZNZN4i5Jtwqpmo=;
 b=dOs8gf0wV63vysabjMk+cQmuw5ppvSzdqX9KagSSE0N/EBOgim3qQiP0oljoBNS2QvhCvIWUwiJb8nM9SjIb2PT1j5w64g8756/DLIFlv4G67PXeabEeYIrs3LTJdY15NqCRSa6kcdG6RjrG1HaoP3PO71pFGYlJ+PPket9E+McT408MMqZXQZcUqQ+TPOq4WaoIABb9ZPoa8Yzc6Uj9cZIS1IDbyB0t83ViyQzgbl2yFB0LxCesF/3LG/VVW/AVRfHEc0ES9daEdkI2K5MpqOMuevoZR/V/x/HEgDSZTgtRwFgPecRMO2zrs5J7idDWc713ameRuZdcFkYqCpTc3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQXbRTOV/O+7P3DEn863dmhXsUirKZNZN4i5Jtwqpmo=;
 b=h6yC7+lZqGJVc8VKXcI0gBsJ67zdpDrEOyKC2xnCUf9omhQa/LF2z9t5ibXQBB2e24kpiVlKef0I8Chfcvh+akBxMOs6b2HU4igO2jXPYheW2jboey00oWXMOU54W3mjOWPcezB4QKUqzgXtspTG9BjWubQv/wcdSqHUhdT+VwI=
Date: Wed, 5 May 2021 14:23:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
CC: Xen Development List <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: save xen config before building
Message-ID: <YJKOSW62716AdMoM@Air-de-Roger>
References: <20210505114516.456201-1-wl@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210505114516.456201-1-wl@xen.org>
X-ClientProxiedBy: PR3P189CA0088.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00f1a331-f340-4374-e542-08d90fc09f79
X-MS-TrafficTypeDiagnostic: DM4PR03MB6062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6062EEA0CA25285E2971FFD88F599@DM4PR03MB6062.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NkVAmkCEibr5KpjQSZme4l+PF3MSh6wOh9YUJeijbybRDK/YnKAYXJEvICkLRsPhBB0oN6iQY3mBjnLS+A3yCzfVBCkSkgQuabj6igQMv1Sp3d+knrBafqr0xL5KW0gMw1FDEllciM97hKZikh8CSQoRbXijMHgguAyt0LsoM95vclq8IoJTa7qlmqXPKmpS8jDJeRkL3D7qP4/kGVHCQw3p8dVf26vZLvYZIyp1wbi8gYtPxpITLhxGoqQOIHpH4wdyfZ5eWg9Cd8tLnOo0pnIHJtFRttztoYXV47F/TPgLG03QLjMRNx/w5MVUCBtq6jZqqtqLrXf6KOZnL/8Jv+zP1dfLiNZ9eZnFZK0zlzUgZETjOQmk3tf4vzNZQsopiziuBjSRPn7tjOR7GZvwinHCnf8UC1yjRN0wly6hJ6E1JJ5+oFeGZlyJ0sAUdfN83QG8QVwuIS7POCJ9W+cISCm9sdtVheXxkHUKIZWvLlzlwFJg3tFa5YotdotbPSZcbmS4xcoR3Er0q47jcO9P6UrmMQJJoh1uaB45D3kNFAvuaILrVrnaxAbgS6f0U2M0lv7cf9TWlZ0k/xSQtAeBYO7JnD8Ad4uZIMVrwnxDcXo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(8936002)(85182001)(26005)(4744005)(478600001)(6496006)(38100700002)(33716001)(6666004)(316002)(8676002)(956004)(86362001)(54906003)(66476007)(9686003)(66556008)(66946007)(16526019)(5660300002)(6486002)(2906002)(6916009)(186003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WXMrN1JLYTlFM3REOXlQTDE3U2lFWUdIZnNGQVF0cXE0NFlkcUhTaGRNdGlF?=
 =?utf-8?B?UTFxcng5TWp1NXlaeHExM3dVM3JOQTZCZmNaYzB0UW5rby9HRHY1SWN6YjNM?=
 =?utf-8?B?MEhUUzNoTVVVQ2lzNnhOVzY4UUY1ZnFKeGtIUmdzL1VINzlVczROMW5ma1Vw?=
 =?utf-8?B?c240eTdmQ1Q5R20xMm5sSXJFQnlHUXR1bXhTdWJ1ZHF1VzBCWnByNlBVbVp2?=
 =?utf-8?B?d0Z2K3p5SEd1MzVkdXJGNWc0LzZRcHE2d2lFdlJxME1reGkxTTgwY1pBbzNV?=
 =?utf-8?B?T2RtRDd2RFZjbnAxOHd4TWgrT0I5NnhpdzJHLzU5SGI1dlVXdTI0UWYrSVE0?=
 =?utf-8?B?eHY0aGlWZFNuWDNkeElJakZ5RnJKcnNvSkFBNjYxVGFjQVNNNXl4UHMzVjd1?=
 =?utf-8?B?TjNKUHFMN0VqZUw0Uys1ayt4d09tQWJsWFljY0loU3VpTWlhb2dZQTZqN3pB?=
 =?utf-8?B?ZkZ2M0JnMVBKbUI3ZklWQmRBRWIwdGNSVTZyM0x1alRvYmRxamh4WmlNdy9r?=
 =?utf-8?B?V1VxaTN2anh0dGdaNFRKYjhyWVg0ZmUzdm1CaTRtSk5BaGNqOXVjS3VGbG9H?=
 =?utf-8?B?UGhrc1pHZ1JDc2d1bHg1ZkJkRmhLZXAwUElkQUQ1VWEzK1pEQWllR0phN3lX?=
 =?utf-8?B?bUhEc2QveHMrbXM1OWd5S1hySG5LK1NIUTYvNFZZcE5YRHpDcERtUm1yWC9K?=
 =?utf-8?B?bGxMYk96NXIvVXZGK2g0YjZFUHFodTVzTk50b1IrOVhNbENsbWUxUE1ncU4x?=
 =?utf-8?B?eGJpdUFmQTJZWllDYmdFdHhuMlpqdjF1aUpINUxtdzFPN0lCalIyLzdrczVo?=
 =?utf-8?B?UVdJRWovNis5YkM1a3F5NDN6MEt6UkJNbk81Wk1HTEZCZG9HMlFVWmhsV2F4?=
 =?utf-8?B?ckZ0emJoOS9FRTBIU2JCRjRvS2owR1JQUUlWK0czankwNGgvSzVZeVNCU0ht?=
 =?utf-8?B?Ni96bFpVQndBbG14bDhUbm9KZVBlWEMrZWpROG5ScFlod1hFMUFWNHJPLzVn?=
 =?utf-8?B?U1h2Rk1aZmJMcG90SUY5QlpGcGJKWCtEdmF0L0FkMmd1ekRMN3JDY3FtZGRt?=
 =?utf-8?B?anRad2ZTU0xsWXd1SkZJZkh0NHRNWkgvdGZJOFA5UzdwenFUL3FRS3hPakkz?=
 =?utf-8?B?VzNSUXo5S0N1YjZ6T011TVJKNVd2Z09mRXFsVm9KckZScG5JT1ZKMWM2ZEFI?=
 =?utf-8?B?czJ2RngxNDkwTDFSc0thZkl3MjJ3SG1EeWQ5V2pWZDJaU3p0ZGZYYVJZTWZP?=
 =?utf-8?B?ZWIveklxYkZzUU9QTk9vT2VTenZrWGtVdGx3V29GQ1EySURhUTZWQWZ4ZUxs?=
 =?utf-8?B?RjJzd3Q0MFdQMjdGeVNDd1lCWE9IelRLZm5CWXdQYSthZGRYWTAyVVRiK3oy?=
 =?utf-8?B?LzZXNXpQalFXa0FoekNLM081TmRhYzBiVU80T0Vmek5CRWhJSzRrOE5mLzRu?=
 =?utf-8?B?WmRpQXBqNWZGaXZNSmZZSGt4ZGJDbWtvVEg1cVoyNUhiL09YUDhLbHNjKzlP?=
 =?utf-8?B?a2xhUC9GcFg4MzlybE5MZjE0cHVZem5tajE1dnd6THIzVVpQSGxiemxWV1pz?=
 =?utf-8?B?UmFXOE9sR3NRdDBDUmlRSVh0YyszVHVqUDZub3I1eS9zVWZxQmZDL1Z6NWVy?=
 =?utf-8?B?SnBqeUlPdXlnYUUvN2RPcDRnbWMwdTF4ZnVMSVc4UlhRdzVINUVQT096clJt?=
 =?utf-8?B?dzhIWXBpRTgxc09oUGUrdS9YR0ErSUNNZkR1YWtmZ1FNY1BCaVJvTEo1K0R5?=
 =?utf-8?Q?pLaGKNDfOppCKG+pAow29l/DQ9GrS4/PVhuJ7dI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f1a331-f340-4374-e542-08d90fc09f79
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 12:23:43.4533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AE6FL6bMKwJA2IyXjEg/O693Ngnlo/vLvLkvg859h5xwYDGrv3IjDaSQiBS9Y3T7zt/4S3thGSIwMpSpPXm+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6062
X-OriginatorOrg: citrix.com

On Wed, May 05, 2021 at 11:45:16AM +0000, Wei Liu wrote:
> It is reported that failed randconfig runs are missing the config file
> which makes debugging impossible. Fix this by moving the line that
> copies the config file before the build is executed.
> 
> Signed-off-by: Wei Liu <wl@xen.org>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

