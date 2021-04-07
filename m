Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648C8357221
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 18:29:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106845.204271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUB2H-00044V-7x; Wed, 07 Apr 2021 16:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106845.204271; Wed, 07 Apr 2021 16:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUB2H-000446-49; Wed, 07 Apr 2021 16:28:09 +0000
Received: by outflank-mailman (input) for mailman id 106845;
 Wed, 07 Apr 2021 16:28:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gkPf=JE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lUB2E-000441-SI
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 16:28:07 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32811e61-c787-4961-8132-a5e0c366ef54;
 Wed, 07 Apr 2021 16:28:05 +0000 (UTC)
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
X-Inumbo-ID: 32811e61-c787-4961-8132-a5e0c366ef54
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617812885;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Lg1O6O9hx1+1KvgpmBF/UJHvRUW0T2jLpFvoEv73JCc=;
  b=U4xNhVjO8zfgT87Iws40ddHx1NuNsRpG6txJiW6nbtstTrWVq5TSwbzN
   kcp0m8vgefwlVk0SfAjkIrZNK5aLcdncnLrUfWCDDuUjl6J07EtO7o64M
   aknpwKtq/PObqQpot7atc2rlbJX7+zk4v6jMRBL9egU3edBQtfl5RbFOD
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5n03gKApZPmIYFN8e5L2rUMhUpYAK7NazbEDuhPYaKKXRYuRbGMeDfcbZE+dwRCZP+Xag2ElnN
 FuFwk5rvSoCfGzie7BfC6EGtOhrDxfGnG6OTQJgMO0Aas19Px1kh3yRJfkM5BOsAqkiijyHO6b
 yTQVLSjnl3rRCRDBcJGtxL6xNTMTdxhJBQuVVyv/aFxEvcjcqf4vNWbqsr7ZQpNcsLy2Ynzmqx
 DtVkcsj1KEBqH4vjv29jKuGeXCAwfBxalYIeHaUpre0dZ6N7qgQi4Y2yf3gtl2Ync2oDdeYqQ2
 YpY=
X-SBRS: 5.2
X-MesageID: 41091421
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GQdgT6MeJ/Z4msBcTj6jsMiAIKoaSvp033AA0UdtRRtJNvGJjs
 zGppgm/DLXqBJUYnEvnticJLKNKEm2ybdZ6ZQcVI3MYCDIo22tRbsN0aLHzyf7EyPzss5xvJ
 0QEJRWLN31ARxEgd3h4A++euxA/PC9/KqlhfjTwh5WJGkBBp1I1RtzCQqQDyRNNWt7LKc+fa
 D92uN34xamZHQLfoCaKxA+Loz+juyOrryjTT4qbiRXjTWzsQ==
X-IronPort-AV: E=Sophos;i="5.82,203,1613451600"; 
   d="scan'208";a="41091421"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5MDO/qSsvmyUix2jjoML3aUy8s1dhqh21k4CkLtKErR1iknKZz2iGh9Tt9aztdT7H4iCaRNH4PVjy3+nA+O9VAls/nbZGaiSW0NMtE8jYw4JSviTJAesFXFgiHCJKWAsazIuM7uulJoVbHkug4nUQoYuX/weIuRwCgWA7oX3x5/tGyUpMVDcuVBopuXZtKw6WqwuvNFtIriUvAzf9IMcWn1eVyR+53j8ZPnNmULSA9S3bKTcvBjg11rM72jWrSCScDQjswxy16YOzl8IMy5kjIttDJn2yGx/BiKDFsNrO1EbWN0d5hq1/QO6EF7t51u6Ow4OtYLKkBzppJN83rLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SgnrrbGxNg8GvtC9yLBXB21bEd7IUu1/IWiIiF3+Pc=;
 b=oVmRukdnlbNGDSa3Oq4letmzH9PL32PiOHDMXMPmMgUMSzUoYH+dZEe/c4vAqGmJ/RKAow6M5Jvd6lEQww9CoCb/qx3u+NkOCfEB2i9OH0dYEdbbkqALA16BM4A2fI5FXS2lSU9LIIIxFknTZLGQooaISgKTnBZT+XD0w1cKx9+MbN61geJuUFNWOIeU76jVl/XcxxJAP1dtsAslB9/N4QGlAQ55jdPED1wJFZ2gh/4d/KE79TNQcZ4HY1ZLNq37hG9soSriGPeQexWIUKcGqEJvXCYKWCf13Rji9PUglOgl6HkXbX/U/C3TneWkjqoedfy/SAmspJGjqzknS6pGwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SgnrrbGxNg8GvtC9yLBXB21bEd7IUu1/IWiIiF3+Pc=;
 b=T74R+8bIDaV387SLOmWxYc5453GU6ZYw8niABCpBztLzhuTLa469E64pDbJwVVIAcOmYTltdYwxQrGAKBPefy71uMlitbFmXdhEvC9/csucig6DCPbgQz7pYeafBqcfFIayiSD+B5zA5rdUB7hVxjIyL/KARIACnYRGAEtcQ1FI=
Date: Wed, 7 Apr 2021 18:27:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 03/11] x86/vlapic: introduce an EOI callback mechanism
Message-ID: <YG3djUEiAd9wqQvv@Air-de-Roger>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-4-roger.pau@citrix.com>
 <d18d9e3b-872f-b0cb-aebf-5e55d4433b75@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d18d9e3b-872f-b0cb-aebf-5e55d4433b75@suse.com>
X-ClientProxiedBy: PR3P193CA0007.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c42dff92-4972-433a-bede-08d8f9e21d69
X-MS-TrafficTypeDiagnostic: DM6PR03MB3946:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3946DC40F3D7E6328D0F390B8F759@DM6PR03MB3946.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CHiUMWIhu3w8vVHRKiBk4wLxtyyvY2/zRJfqwL9X1abcTHXDbmaF3lAntYB48X1fLNgRuM5XZvTPCAMPVxxw7FtlV3l9d8+F6sz/g5xBGaUKXviDcUiR7ePbcdh0POs0Xd/CLRmD0POPvrRiEThaDYAogVfV/x6F2Td5E4fm979UuKSfSPux6w7DP5W2ivCkBv9czUwA3ssRTQkp6O3bfnHVgKdnXJSTQu3zzUeqEHbB7dzPWPtkgWvr8pK5yJveYM36h59kPKS6V6EhRsuVeRM2qV+a//s2m3cT/x/VMON6k1Bt+8mfsIShb8j3YWK6VzZj+NvKfRVdKkC4j4/DFT/C73xbRpi+8Z+ezqJ1bbkrpi4MqsUKSImY11pE8abqUaBdJibjP/Ans2ROOqkzrlN4RlmoskxinoA+0ThWaBdEbdCiGLK2PUe6L2vC1JrEpcmCtSdV680tHBhTP/AWM2ZlplYSUS6JXFUQJqAainuOsK4Jd+OKFY/2bFpVFHLq2CBgbClbU9O+H129A9ffevGCUeCGdmvI+4TvtDjmP0Yp0KIX4Y8b1MB6iJsFPGkbZWDdkjaomkhVkxkPvdX/0+LBG6YcwImVvccanC2xEQwCg5Es0pD9MQRnu3Pr78qXezBlpS4wTGu1KIl0dYf+iSzNbLQYgUlegKHRtkJrAXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(366004)(136003)(39860400002)(376002)(396003)(86362001)(4326008)(38100700001)(66556008)(66476007)(53546011)(33716001)(26005)(66946007)(6496006)(956004)(6486002)(5660300002)(9686003)(6916009)(16526019)(186003)(8936002)(478600001)(6666004)(85182001)(8676002)(316002)(54906003)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c3FvUnZDRWNtNVRDeWVLMVZnL2lPV2lFVVZRb1ZDQWZLd3FzZFdJL2p6QVU3?=
 =?utf-8?B?L2s5d0FINmxlQXB1MHBIQW9jcm5pcjltK3oyOFVYZkJ3MU5KQlVKTW9nMEdi?=
 =?utf-8?B?Nk15cWY5N2lSRWdJbXF3ZVNjMXkvaTRyL0piUmltQ0FPVU9IckdGUGhtaVNS?=
 =?utf-8?B?UFl4RkxucG9DcGY5RHFjUzBUV1gvazcyTy9NMXdCWkdERTVxSmI4cVoxaVM2?=
 =?utf-8?B?S1MvVVUzOVJMMDZ0QmMrNm90OUp0SGFIQjR4TFljdHBHUXR3U1phV1dTaDNh?=
 =?utf-8?B?dnBYNkQrelhFcHppcFgvdlAyYTJSaFdkVmRnRCtCVGdTWitmMzJsWXQyVlFp?=
 =?utf-8?B?YnlsRTB6MGZIT3pZVVZaYVZlN0VXWEZmQzFsdzVnc0ttU2h2NDF2SHR5YzlT?=
 =?utf-8?B?V0FUZFBlNHJERmlVQkZWS2x0YVJ3UHl0dzl4UTlZUG9DSTlnN29aZERoM0dl?=
 =?utf-8?B?bUNWT0pPN3JxM3dnNXZ6K1lYUlpPZ1puZFBLV2d2SU9obWRVQVhNdVZMcUR6?=
 =?utf-8?B?ZTZFYnhRVEhhakxmRTVVcjA0bjRHWXkwNERHS2MwT1RuY0hnN0RnQk5NMW5v?=
 =?utf-8?B?Nk5TTzBVU1JlQmNBRjJ3UjdOczE0NnNNdUxlV3cxd3RVazEvdGt3dXRHaExo?=
 =?utf-8?B?QnkrcWR4M0tuZEVOQlh2Nm9LZWRNTHlGM1c5NHhJazNYYmRRcG51NDZvSk40?=
 =?utf-8?B?YUhCY09Oa2tySU9QbE45dnIyWU9sSjhxYS91SzlCcFcvUEgrbTFBS0lLbXV0?=
 =?utf-8?B?RXFtd0JJNmxMbk14MXRGTDFzY2dxSmZLVGNWajlzT0FMZk85Y3ZtWFVtekJH?=
 =?utf-8?B?a2xFaDIzcFVBRjVBMkJNSEdMNEF1WGFDejl4MktldHRjZ3g3OGxwSTgvZ1Zm?=
 =?utf-8?B?bUx0Q1dBbjRZV21Kc1VpSVREUXg1dVAzTWhIZTEwTFdmVUN6dnJ1eTBvaGtX?=
 =?utf-8?B?OE5jWmFmMS85V1d1SWpUTnlJZm54aDl0Q3A1eDF3bUx3Zm4vbmpUdW5YRFd2?=
 =?utf-8?B?dnRHNkVkWWVJYTN4WnFBYTZBTUk3cWlsVWRUcEZ1M3p2UmZ2STQyb3hhRm9w?=
 =?utf-8?B?K25zN3dGZmIwbU9pc0s2ZmRsMm1uSGVwVk9CVEEzVVAwWnhoZmc1eTdVV2t4?=
 =?utf-8?B?ZGhjZm9DVGVkcjJtcCtwWjdyLzNmSlE3N3BJcmhyV1M2WHM1TFFnaHBZa0Mx?=
 =?utf-8?B?Ri9GbEN3b053b1FzM0djWXI2aWxwemMxQlpqMFUyUExldlBxTy92cktoVnhs?=
 =?utf-8?B?QlpTSitSVEUzeXBwK0NlUTNQWHRteDl3amd1MGcrbnVXWDhTdzhiVXV5RmJ1?=
 =?utf-8?B?cWFkQ1ppVFNuWWNIamtNK1NFenp2dStIaExIWmIzamQ0Rzhob2FTOFZUUlpW?=
 =?utf-8?B?L2k5L0UwQkRhaE9veVIzazZYLzJBbkQvbmhTWmVwWkFZZS9OMnBzYnF6WmR2?=
 =?utf-8?B?d0xocUZDcHd0K2hFYnpJWFd5MHltTFcwR2RrN0ozQ0tEdlFxbXBsb0FDR3Ix?=
 =?utf-8?B?TlFBN21Jdnhsa2gwSFR0OG1qZDlOaFZIMCttaEFTTVBzK1hwbnFYUnkreUlw?=
 =?utf-8?B?QXFuRm9oQUxTWllSUHFOdmRMREZoQ0JsTzhzWXBrcnpIOFVzMEx5ZjA3ekZv?=
 =?utf-8?B?d0pwSGNUb0RMWldjQnM4NUprY3V2WWxLSm9lMVowT0xsamxlckh6bnZCb1Bl?=
 =?utf-8?B?SHBDVmNkZUJla0hadVU0UzBmbldQa0YydjNLVHJVa2E4WXk5S2thME5FRTdH?=
 =?utf-8?Q?4G1nd/qmlKrMzy2q7Kr9GguJyQyz7TYtlBdWeqg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c42dff92-4972-433a-bede-08d8f9e21d69
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 16:28:02.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hi4Yzon/TsWjNb5rEE88mrYcjPV8SGE8Phi/MAg6HnrnHGCl9Hn51KhZYlIl+CN7gToJOlLDuPaArWeoVaNOvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3946
X-OriginatorOrg: citrix.com

On Wed, Apr 07, 2021 at 04:55:43PM +0200, Jan Beulich wrote:
> On 31.03.2021 12:32, Roger Pau Monne wrote:
> > Add a new vlapic_set_irq_callback helper in order to inject a vector
> > and set a callback to be executed when the guest performs the end of
> > interrupt acknowledgment.
> > 
> > Such functionality will be used to migrate the current ad hoc handling
> > done in vlapic_handle_EOI for the vectors that require some logic to
> > be executed when the end of interrupt is performed.
> > 
> > The setter of the callback will be in charge for setting the callback
> > again on resume. That is the reason why vlapic_set_callback is not a
> > static function.
> 
> I'm struggling with your use of "resume" here: Resuming from S3
> doesn't require re-doing anything that's kept in memory, does it?
> So what meaning does the word have here?

Right, I can see the confusion. Resume here means a guest being
migrated or restored, not Xen itself being resumed. Callbacks are not
part of the exported guest state, and hence any emulated device that
requires a callback will have to register it as part of loading the
saved state.

> Apart from this, and with the xzalloc_array() change requested
> by Andrew, this looks good to me.

Thanks, Roger.

